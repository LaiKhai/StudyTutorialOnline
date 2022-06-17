<?php

namespace App\Http\Controllers;

use App\Models\SinhVien;
use App\Models\LopHocPhan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\SinhVienImport;
use App\Models\DS_SinhVien;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class SinhVienController extends Controller
{
    public function FixImg(SinhVien $sinhVien)
    {
        if (Storage::disk('public')->exists($sinhVien->avt)) {
            $sinhVien->avt = Storage::url($sinhVien->avt);
        } else {
            $sinhVien->avt = '/assets/images/no_image.png';
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
        foreach ($sinhVien as $item) {
            $this->FixImg($item);
        }

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
        $input['id_lop'] = $request->input('id_lop');
        $input['email'] = $request->input('email');
        $input['password'] = Hash::make($request->input('password'));
        $input['ho_ten'] = $request->input('ho_ten');
        $input['mssv'] = $request->input('mssv');
        $input['sdt'] = $request->input('sdt');
        $input['ngay_sinh'] = $request->input('ngay_sinh');
        $input['trang_thai'] = 1;
        $validator = Validator::make($input, [
            'id_lop' => ['required', 'max:255', 'integer'],
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
        if ($request->hasFile('avt')) {
            $sinhVien['avt'] = $request->file('avt')->store('assets/images/avatar/' . $sinhVien['id'], 'public');
        }
        $sinhVien->save();
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
        $sinhVien = SinhVien::find($id);
        $this->FixImg($sinhVien);
        $sinhVien->traloi;
        $sinhVien->ctbaitap;
        $response = [
            'sinhvien' => $sinhVien,
        ];
        return response()->json($response, 200);
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
            return response()->json(['messsage' => 'khong tim thay sinh vien nao !'], 404);
        }
        $sinhVien->fill([
            'email' => $request->input('email'),
            'password' => $request->input('password'),
            'ho_ten' => $request->input('ho_ten'),
            'mssv' => $request->input('mssv'),
            'sdt' => $request->input('sdt'),
            'ngay_sinh' => $request->input('ngay_sinh'),
            'trang_thai' => $request->input('trang_thai'),
        ]);
        if ($request->hasFile('avt')) {
            $sinhVien['avt'] = $request->file('avt')->store('assets/images/avatar/' . $sinhVien['id'], 'public');
        }
        $sinhVien->save();
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
        $sinhVien = SinhVien::find($id);
        if (empty($sinhVien)) {
            $response = ['message' => 'khong tim thay sinh vien nao !'];
            return response()->json($response, 404);
        }
        $sinhVien->delete();
        $lstSinhVien = SinhVien::all();
        $response = [
            'message' => 'xoa thanh cong !',
            'sinhvien' => $lstSinhVien
        ];
        return response()->json($response, 200);
    }



    public function import(Request $request)
    {
        Excel::import(new SinhVienImport, $request->file('file'));

        $lstSinhVien = SinhVien::all();
        foreach ($lstSinhVien as $item) {
            $this->FixImg($item);
        }
        $response = [
            'message' => 'them thanh cong !',
            'sinhvien' => $lstSinhVien
        ];
        return response()->json($response, 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function detailLopHocPhan($id)
    {
        $lopHocPhan = DS_SinhVien::join('lop_hoc_phans', 'ds_sinh_viens.id_lop_hoc_phan', '=', 'lop_hoc_phans.id')
            ->where('ds_sinh_viens.id_sinh_vien', $id)
            ->select('ds_sinh_viens.id_sinh_vien', 'lop_hoc_phans.*')->get();
        $response = [
            'lophocphan' => $lopHocPhan
        ];
        return response()->json($response, 200);
    }
}