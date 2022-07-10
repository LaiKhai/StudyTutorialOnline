<?php

namespace App\Http\Controllers;

use App\Models\DS_GiangVien;
use App\Models\LopHocPhan;
use App\Models\GiangVien;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;


class GiangVienController extends Controller
{
    public function FixImg(GiangVien $giangVien)
    {
        if (Storage::disk('public')->exists($giangVien->avt)) {
            $giangVien->avt = Storage::url($giangVien->avt);
        } else {
            $giangVien->avt = '/assets/images/no_image.png';
        }
    }
    public function FixImgLHP(LopHocPhan $lopHocPhan)
    {
        if (Storage::disk('public')->exists($lopHocPhan->avt)) {
            $lopHocPhan->avt = Storage::url($lopHocPhan->avt);
        } else {
            $lopHocPhan->avt = '/assets/images/lophocphan/no_image.png';
        }
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $giangVien = GiangVien::all();
        foreach ($giangVien as $item) {
            $item->khoa;
            $item->chucvu;
            $item->baikiemtra;
            $item->lop;
            $item->baiviet;
            $this->FixImg($item);
        }
        $response = [
            'status' => true,
            'user' => $giangVien,
        ];
        return response()->json($response, 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input['id_khoa'] = $request->input('id_khoa');
        $input['email'] = $request->input('email');
        $input['password'] = Hash::make($request->input('password'));
        $input['ho_ten'] = $request->input('ho_ten');
        $input['ma_so'] = $request->input('ma_so');
        $input['sdt'] = $request->input('sdt');
        $input['ngay_sinh'] = $request->input('ngay_sinh');
        $input['id_chuc_vu'] = $request->input('id_chuc_vu');
        $input['trang_thai'] = 1;
        $validator = Validator::make($input, [
            'id_khoa' => 'required',
            'email' => ['required', 'max:255', 'email:rfc,dns', 'unique:sinh_viens,email', 'regex:/(.*)@caothang\.edu.vn/i'],
            'password' => ['required', 'max:255'],
            'ho_ten' => ['required', 'max:255,string'],
            'ma_so' => ['required', 'max:255', 'string'],
            'sdt' => ['required', 'max:255', 'string'],
            'ngay_sinh' => ['required', 'max:255', 'date'],
            'id_chuc_vu' => ['required', 'max:255', 'integer'],
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
                $response['status'] = false;
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        $giangVien = GiangVien::create($input);
        if ($request->hasFile('avt')) {
            $giangVien['avt'] = $request->file('avt')->store('assets/images/avatar/' . $giangVien['id'], 'public');
        }
        $giangVien->save();
        $giangVien->khoa;
        $giangVien->chucvu;
        $giangVien->baikiemtra;
        $giangVien->lop;
        $giangVien->baiviet;
        $response = [
            'status' => true,
            'message' => 'Dang ky giang vien thanh cong !',
            'user' => $giangVien
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
        $giangVien = GiangVien::find($id);
        if (empty($giangVien)) {
            return response()->json([
                'status' => false,
                'message' => 'Khong tim thay giang vien nao !'
            ], 404);
        }
        $this->FixImg($giangVien);
        $giangVien->khoa;
        $giangVien->chucvu;
        $giangVien->baikiemtra;
        $giangVien->lop;
        $giangVien->baiviet;

        $response = [
            'status' => true,
            'user' => $giangVien
        ];
        return response()->json($response, 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        $giangVien = GiangVien::find($id);
        if (empty($giangVien)) {
            return response()->json([
                'status' => false,
                'message' => ' Khong tim thay giang vien nao !', 404
            ]);
        }
        $giangVien->fill([
            'id_khoa' => $request->input('id_khoa'),
            'id_chuc_vu' => $request->input('id_chuc_vu'),
            'email' => $request->input('email'),
            'password' => Hash::make($request->input('password')),
            'ma_so' => $request->input('ma_so'),
            'sdt' => $request->input('sdt'),
            'ho_ten' => $request->input('ho_ten'),
            'ngay_sinh' => $request->input('ngay_sinh'),
            'trang_thai' => $request->input('trang_thai')
        ]);
        if ($request->hasFile('avt')) {
            $giangVien['avt'] = $request->file('avt')->store('assets/images/avatar/' . $giangVien['id'], 'public');
        }
        $giangVien->save();
        $giangVien->khoa;
        $giangVien->chucvu;
        $giangVien->baikiemtra;
        $giangVien->lop;
        $giangVien->baiviet;
        $response = [
            'status' => true,
            'message' => 'chinh sua thanh cong !',
            'lophocphan' => $giangVien
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
        $giangVien = GiangVien::find($id);
        if (empty($giangVien)) {
            $response = [
                'status' => false,
                'message' => 'khong tim thay giang vien nao !'
            ];
            return response()->json($response, 404);
        }
        $giangVien->delete();
        $lstGiangVien = GiangVien::all();
        foreach ($lstGiangVien as $item) {
            $item->khoa;
            $item->chucvu;
            $item->baikiemtra;
            $item->lop;
            $item->baiviet;
            $this->FixImg($item);
        }
        $response = [
            'status' => true,
            'message' => 'xoa thanh cong !',
            'giangvien' => $lstGiangVien
        ];
        return response()->json($response, 200);
    }

    public function lophocphanwithgiangvien($id)
    {
        $lhp = DS_GiangVien::join('lop_hoc_phans', 'ds_giang_viens.id_lop_hoc_phan', '=', 'lop_hoc_phans.id')
            ->join('giang_viens', 'ds_giang_viens.id_giang_vien', '=', 'giang_viens.id')
            ->join('bo_mons', 'lop_hoc_phans.id_bo_mon', '=', 'bo_mons.id')
            ->join('lops', 'lop_hoc_phans.id_lop', '=', 'lops.id')
            ->where('ds_giang_viens.id_giang_vien', $id)
            ->select('ds_giang_viens.id_giang_vien', 'lop_hoc_phans.*', 'giang_viens.ho_ten as ho_ten_gv', 'bo_mons.ten_mon_hoc', 'lops.ten_lop')->get();

        $response = [
            'status' => true,
            'lophocphan' => $lhp
        ];
        return response()->json($response, 200);
    }

    public function search(Request $request)
    {
        $searchInput = $request->input('search');
        $giangVien = GiangVien::join('khoas', 'giang_viens.id_khoa', '=', 'khoas.id')
            ->where('ten_khoa', 'like', '%' . $searchInput . '%')
            ->orWhere('email', 'like', '%' . $searchInput . '%')
            ->orWhere('ma_so', 'like', '%' . $searchInput . '%')
            ->orWhere('ho_ten', 'like', '%' . $searchInput . '%')
            ->get();
        foreach ($giangVien as $item) {
            $item->khoa;
            $item->chucvu;
            $item->baikiemtra;
            $item->lop;
            $item->baiviet;
            $this->FixImg($item);
        }
        $response = [
            'data' => $giangVien
        ];
        return response()->json($response, 200);
    }
    public function searchGiangVienwithKhoa(Request $request)
    {
        $searchInput = $request->input('searchGV');
        $lopHocPhan = LopHocPhan::join('bo_mons', 'lop_hoc_phans.id_bo_mon', '=', 'bo_mons.id')
            ->join('khoas', 'bo_mons.id_khoa', '=', 'khoas.id')
            ->join('lops', 'lop_hoc_phans.id_lop', '=', 'lops.id')
            ->join('giang_viens', 'lops.id_giangvien', '=', 'giang_viens.id')
            ->where('khoas.ten_khoa', 'like', '%' . $searchInput . '%')
            ->select('giang_viens.*', 'khoas.ten_khoa')->distinct()->get();
        $response = [
            'data' => $lopHocPhan
        ];
        return response()->json($response, 200);
    }
}