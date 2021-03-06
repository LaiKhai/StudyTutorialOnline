<?php

namespace App\Http\Controllers;

use App\Exports\DiemDanhExport;
use App\Models\SinhVien;
use App\Models\LopHocPhan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\SinhVienImport;
use App\Exports\SinhVienExport;
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
        $sinhVien = SinhVien::where('trang_thai', '>', "0")->get();
        foreach ($sinhVien as $item) {
            $item->lop;
            $item->ctbaitap;
            $item->traloi;
            $item->binhluan;
            $item->baiviet;
            $this->FixImg($item);
        }

        $response = [
            'status' => true,
            'user' => $sinhVien,
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
        $input['ma_so'] = $request->input('ma_so');
        $input['sdt'] = $request->input('sdt');
        $input['ngay_sinh'] = $request->input('ngay_sinh');
        $input['trang_thai'] = 1;
        $validator = Validator::make($input, [
            'id_lop' => ['required', 'max:255', 'integer'],
            'email' => ['required', 'max:255', 'email:rfc,dns', 'unique:sinh_viens,email', 'regex:/(.*)@caothang\.edu.vn/i'],
            'password' => 'required|max:255',
            'ho_ten' => 'required|max:255|string',
            'ma_so' => 'required|max:255|string',
            'sdt' => 'required|max:255|string',
            'ngay_sinh' => 'required|max:255',
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
                $response['status'] = false;
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }

        $sinhVien = SinhVien::create($input);
        if ($request->hasFile('avt')) {
            $sinhVien['avt'] = $request->file('avt')->store('assets/images/avatar/' . $sinhVien['id'], 'public');
        }
        $sinhVien->save();
        $sinhVien = SinhVien::join('lops', 'sinh_viens.id_lop', '=', 'lops.id')
            ->where('sinh_viens.id', $sinhVien->id)
            ->select('sinh_viens.*', 'lops.ten_lop', 'lops.nien_khoa')
            ->get();
        $response = [
            'status' => true,
            'user' => $sinhVien
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
        $sinhVien = SinhVien::join('lops', 'sinh_viens.id_lop', '=', 'lops.id')
            ->where('sinh_viens.id', $id)
            ->select('sinh_viens.*', 'lops.ten_lop', 'lops.nien_khoa')
            ->get();
        // $this->FixImg($sinhVien);
        $response = [
            'status' => true,
            'user' => $sinhVien,
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
            return response()->json([
                'status' => false,
                'messsage' => 'khong tim thay sinh vien nao !'
            ], 404);
        }
        $sinhVien->fill([
            'email' => $request->input('email'),
            'password' => Hash::make($request->input('password')),
            'ho_ten' => $request->input('ho_ten'),
            'ma_so' => $request->input('ma_so'),
            'sdt' => $request->input('sdt'),
            'ngay_sinh' => $request->input('ngay_sinh'),
            'trang_thai' => $request->input('trang_thai'),
        ]);
        if ($request->hasFile('avt')) {
            $sinhVien['avt'] = $request->file('avt')->store('assets/images/avatar/' . $sinhVien['id'], 'public');
        }
        $sinhVien->save();
        $sinhVien = SinhVien::join('lops', 'sinh_viens.id_lop', '=', 'lops.id')
            ->where('sinh_viens.id', $id)
            ->select('sinh_viens.*', 'lops.ten_lop', 'lops.nien_khoa')
            ->get();
        $response = [
            'status' => true,
            'user' => $sinhVien
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
            $response = [
                'status' => false,
                'message' => 'khong tim thay sinh vien nao !'
            ];
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
            'status' => true,
            'message' => 'them thanh cong !',
            'sinhvien' => $lstSinhVien
        ];
        return response()->json($response, 200);
    }

    public function export()
    {
        return Excel::download(new SinhVienExport, 'SinhVien.xlsx');
    }

    public function exportDiemDanh($idlop)
    {
        return Excel::download(new DiemDanhExport($idlop), 'DiemDanh.xlsx');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function lophocphanwithsinhvien($id)
    {
        $lopHocPhan = DS_SinhVien::leftJoin('lop_hoc_phans', 'ds_sinh_viens.id_lop_hoc_phan', '=', 'lop_hoc_phans.id')
            ->leftJoin('sinh_viens', 'ds_sinh_viens.id_sinh_vien', '=', 'sinh_viens.id')
            ->leftJoin('bo_mons', 'lop_hoc_phans.id_bo_mon', '=', 'bo_mons.id')
            ->leftJoin('lops', 'lop_hoc_phans.id_lop', '=', 'lops.id')
            ->leftJoin('giang_viens', 'lops.id_giangvien', '=', 'giang_viens.id')
            ->where([['ds_sinh_viens.id_sinh_vien', $id], ['lop_hoc_phans.trang_thai', '>', '0']])
            ->select('ds_sinh_viens.id_sinh_vien', 'lop_hoc_phans.*', 'sinh_viens.ho_ten as ho_ten_sv', 'bo_mons.ten_mon_hoc', 'lops.ten_lop', 'giang_viens.ho_ten as hoten_giangvien')
            ->distinct()
            ->get();
        $response = [
            'status' => true,
            'lophocphan' => $lopHocPhan
        ];
        return response()->json($response, 200);
    }

    public function lstSinhVienwithKhoa(Request $request)
    {
        $khoa = $request->input('khoa');
        $sinhVien = DS_SinhVien::join('lop_hoc_phans', 'ds_sinh_viens.id_lop_hoc_phan', '=', 'lop_hoc_phans.id')
            ->join('sinh_viens', 'ds_sinh_viens.id_sinh_vien', '=', 'sinh_viens.id')
            ->join('bo_mons', 'lop_hoc_phans.id_bo_mon', '=', 'bo_mons.id')
            ->join('khoas', 'bo_mons.id_khoa', '=', 'khoas.id')
            ->where('khoas.ten_khoa', 'like', '%' . $khoa . '%')
            ->select('sinh_viens.*', 'khoas.ten_khoa')->get();
        if (empty($sinhVien)) {
            return response()->json([
                'status' => false,
                'message' => 'khong tim thay lop nao !'
            ], 404);
        }
        $response = [
            'sinhvien' => $sinhVien
        ];
        return response()->json($response, 200);
    }

    public function search(Request $request)
    {
        $searchInput = $request->input('search');
        $sinhVien = SinhVien::join('lops', 'sinh_viens.id_lop', '=', 'lops.id')
            ->where('ten_lop', 'like', '%' . $searchInput . '%')
            ->orWhere('email', 'like', '%' . $searchInput . '%')
            ->orWhere('ma_so', 'like', '%' . $searchInput . '%')
            ->orWhere('ho_ten', 'like', '%' . $searchInput . '%')
            ->get();
        foreach ($sinhVien as $item) {
            $item->lop;
            $item->ctbaitap;
            $item->traloi;
            $item->binhluan;
            $item->baiviet;
            $this->FixImg($item);
        }
        $response = [
            'data' => $sinhVien
        ];
        return response()->json($response, 200);
    }

    public function searchSinhVienwithKhoa(Request $request)
    {
        $searchInput = $request->input('searchSV');
        $sinhVien = SinhVien::join('lops', 'sinh_viens.id_lop', '=', 'lops.id')
            ->join('khoas', 'lops.id_khoa', '=', 'khoas.id')
            ->where('khoas.ten_khoa', 'like', '%' . $searchInput . '%')
            ->where('sinh_viens.trang_thai', '>', "0")
            ->select('sinh_viens.*', 'lops.ten_lop', 'lops.nien_khoa')
            ->get();
        $response = [
            'data' => $sinhVien
        ];
        return response()->json($response, 200);
    }
}