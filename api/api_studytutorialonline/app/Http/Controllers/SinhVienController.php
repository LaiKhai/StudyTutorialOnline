<?php

namespace App\Http\Controllers;

use App\Models\SinhVien;
use App\Models\Lop;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\SinhVienImport;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class SinhVienController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $sinhVien = SinhVien::all();
        $response = [
            'sinhvien' => $sinhVien,
        ];
        return response()->json($response, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input['email'] = $request->input('email');
        $input['password'] = Hash::make($request->input('password'));
        $input['ho_ten'] = $request->input('ho_ten');
        $input['mssv'] = $request->input('mssv');
        $input['sdt'] = $request->input('sdt');
        $input['ngay_sinh'] = $request->input('ngay_sinh');
        $input['trang_thai'] = 1;
        $validator = Validator::make($input, [
            'email' => ['required', 'max:255', 'email:rfc,dns', 'unique:sinh_viens,email', 'regex:/(.*)@caothang\.edu.vn/i'],
            'password' => 'required|max:255',
            'ho_ten' => 'required|max:255|string',
            'mssv' => 'required|max:255|string',
            'sdt' => 'required|max:255|string',
            'ngay_sinh' => 'required|max:255',
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }

        $sinhVien = SinhVien::create($input);
        $response = [
            'message' => 'Dang ky sinh vien thanh cong !',
            'sinhvien' => $sinhVien
        ];

        return response()->json($response, 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\SinhVien  $sinhVien
     * @return \Illuminate\Http\Response
     */
    public function show(SinhVien $sinhVien)
    {
        $sinhvien = SinhVien::find($sinhVien)->first();
        return response()->json($sinhvien, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\SinhVien  $sinhVien
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, SinhVien $sinhVien)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\SinhVien  $sinhVien
     * @return \Illuminate\Http\Response
     */
    public function destroy(SinhVien $sinhVien)
    {
        //
    }
    public function import(Request $request)
    {
        if ($request->hasFile('SVimport')) {
            $path1 = $request->file('SVimport')->store('temp', 'public');
            $path = Storage::files($path1);
            Excel::import(new SinhVienImport, $path);
        }
        $sinhVien = SinhVien::all();
        $response = [
            'message' => "Them thanh cong",
            'sinhvien' => $path
        ];
        return response()->json($response, 200);
    }
}