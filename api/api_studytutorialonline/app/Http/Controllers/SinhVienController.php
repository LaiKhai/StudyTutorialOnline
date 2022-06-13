<?php

namespace App\Http\Controllers;

use App\Models\SinhVien;
use App\Models\FileExcel;
use App\Models\Lop;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\SinhVienImport;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class SinhVienController extends Controller
{
    public function FixFile(FileExcel $excel)
    {
        if (Storage::disk('public')->exists($excel->file)) {
            $excel->file = Storage::url($excel->file);
        } else {
            $excel->file = '/admin_view/assets/images/No_Image.png';
        }
    }
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $sinhvien = SinhVien::find($id);
        return response()->json($sinhvien, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $sinhVien = SinhVien::find($id);
        if (empty($sinhVien)) {
            return response()->json(['messsage' => 'khong tim thay sinh vien nao !'], 200);
        }
        $input = $request->all();
        $sinhVien->email = $input['email'];
        $sinhVien->password = $input['password'];
        $sinhVien->ho_ten = $input['ho_ten'];
        $sinhVien->avt = $input['avt'];
        $sinhVien->mssv = $input['mssv'];
        $sinhVien->sdt = $input['sdt'];
        $sinhVien->ngay_sinh = $input['ngay_sinh'];
        $sinhVien->trang_thai = $input['trang_thai'];
        $response = [
            'message' => 'chinh sua thanh cong !',
            'sinhvien' => $sinhVien
        ];
        return response()->json($response, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    public function import(Request $request)
    {
        $md5Name = md5_file($request->file('file')->getRealPath());
        $guessExtension = $request->file('file')->guessExtension();
        $path1 = $request->file('file')->storeAs('temp', $md5Name . '.' . $guessExtension, 'public');
        $path = Storage::files($path1);
        $file_path = Storage::url(implode("/", $path));
        Excel::import(new SinhVienImport, implode("/", $path));
        $sinhVien = SinhVien::create();
        $lstSinhVien = $sinhVien->all();
        $response = [
            'message' => 'them thanh cong !',
            'sinhvien' => $lstSinhVien
        ];
        return response()->json($response, 200);
    }
}