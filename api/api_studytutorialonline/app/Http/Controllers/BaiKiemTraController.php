<?php

namespace App\Http\Controllers;

use App\Models\BaiKiemTra;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BaiKiemTraController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $baiKiemTra = BaiKiemTra::all();
        foreach ($baiKiemTra as $item) {
            $item->lophocphan;
            $item->giangvien;
            $item->file;
            $item->ctbaikiemtra;
            $item->cauhoi;
        }
        $response = [
            'baikiemtra' => $baiKiemTra
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
        $input['id_lop_hoc_phan'] = $request->input('id_lop_hoc_phan');
        $input['id_giang_vien'] = $request->input('id_giang_vien');
        $input['id_file'] = $request->input('id_file');
        $input['sl_cau_hoi'] = $request->input('sl_cau_hoi');
        $input['noi_dung'] = $request->input('noi_dung');
        $input['tg_bat_dau'] = $request->input('tg_bat_dau');
        $input['tg_ket_thuc'] = $request->input('tg_ket_thuc');
        $input['trang_thai'] = $request->input('trang_thai');
        $validator = Validator::make($input, [
            'id_lop_hoc_phan' => ['required', 'max:255', 'integer'],
            'id_giang_vien' => ['required', 'max:255', 'integer'],
            'sl_cau_hoi' => ['required', 'integer'],
            'noi_dung' => ['required', 'max:255', 'string'],
            'tg_bat_dau' => ['required'],
            'tg_ket_thuc' => ['required'],
            'trang_thai' => ['required', 'integer'],
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        $baiKiemTra = BaiKiemTra::create($input);
        $baiKiemTra->lophocphan;
        $baiKiemTra->giangvien;
        $baiKiemTra->file;
        $baiKiemTra->ctbaikiemtra;
        $baiKiemTra->cauhoi;
        $response = [
            'message' => 'them bai kiem tra thanh cong !',
            'baikiemtra' => $baiKiemTra
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
        $baiKiemTra = BaiKiemTra::find($id);
        if (empty($baiKiemTra)) {
            return response()->json(['message' => 'Khong tim thay bai kiem tra nao !'], 404);
        }
        $baiKiemTra->lophocphan;
        $baiKiemTra->giangvien;
        $baiKiemTra->file;
        $baiKiemTra->ctbaikiemtra;
        $baiKiemTra->cauhoi;
        $response = [
            'baikiemtra' => $baiKiemTra,
        ];
        return response($response, 200);
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
        $baiKiemTra = BaiKiemTra::find($id);
        if (empty($baiKiemTra)) {
            return response()->json(['message' => ' Khong tim thay bai kiem tra nao !', 404]);
        }
        $baiKiemTra->fill([
            'id_lop_hoc_phan' => $request->input('id_lop_hoc_phan'),
            'id_giang_vien' => $request->input('id_giang_vien'),
            'id_file' => $request->input('id_file'),
            'sl_cau_hoi' => $request->input('sl_cau_hoi'),
            'noi_dung' => $request->input('noi_dung'),
            'tg_bat_dau' => $request->input('tg_bat_dau'),
            'tg_ket_thuc' => $request->input('tg_ket_thuc'),
            'trang_thai' => $request->input('trang_thai')
        ]);
        $baiKiemTra->save();
        $baiKiemTra->lophocphan;
        $baiKiemTra->giangvien;
        $baiKiemTra->file;
        $baiKiemTra->ctbaikiemtra;
        $baiKiemTra->cauhoi;
        $response = [
            'message' => 'chinh sua thanh cong !',
            'baikiemtra' => $baiKiemTra
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
        $baiKiemTra = BaiKiemTra::find($id);
        if (empty($baiTap)) {
            return response()->json(['message' => ' Khong tim thay bai kiem tra nao !', 404]);
        }
        $baiKiemTra->delete();
        $lstBaiKiemTra = BaiKiemTra::all();
        foreach ($lstBaiKiemTra as $item) {
            $item->lophocphan;
            $item->giangvien;
            $item->file;
            $item->ctbaikiemtra;
            $item->cauhoi;
        }
        $response = [
            'message' => 'xoa thanh cong !',
            'baikiemtra' => $lstBaiKiemTra
        ];
        return response()->json($response, 200);
    }
}