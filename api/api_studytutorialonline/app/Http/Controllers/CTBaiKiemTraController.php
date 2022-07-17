<?php

namespace App\Http\Controllers;

use App\Models\BaiKiemTra;
use App\Models\TraLoi;
use App\Models\CTBaiKiemTra;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Carbon;

class CTBaiKiemTraController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ctBaiKiemTra = CTBaiKiemTra::where('trang_thai', '>', "0")->get();
        foreach ($ctBaiKiemTra as $item) {
            $item->baikiemtra;
            $item->traloi;
        }
        $response = [
            'status' => true,
            'data' => $ctBaiKiemTra
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
        $input['id_bai_kiem_tra'] = $request->input('id_bai_kiem_tra');
        $input['id_sinh_vien'] = $request->input('id_sinh_vien');
        $input['trang_thai'] = 3;
        DB::select('call update_ct_bai_kiem_tra(?,?,?)', [
            $input['id_bai_kiem_tra'],
            $input['id_sinh_vien'],
            $input['trang_thai'],
        ]);
        $sv = CTBaiKiemTra::where('id_sinh_vien', $input['id_sinh_vien'])->first();
        $tg_ket_thuc = CTBaiKiemTra::join('bai_kiem_tras', 'ct_bai_kiem_tras.id_bai_kiem_tra', '=', 'bai_kiem_tras.id')
            ->where('ct_bai_kiem_tras.id_bai_kiem_tra', $input['id_bai_kiem_tra'])
            ->max('bai_kiem_tras.tg_ket_thuc');
        $tg_nop_bai = CTBaiKiemTra::where('id_bai_kiem_tra', $input['id_bai_kiem_tra'])->max('tg_nop_bai');
        if ($tg_ket_thuc == null) {
            DB::select('call cap_nhat_trang_thai_CTBKT(?,?,?)', [
                $input['id_bai_kiem_tra'],
                $input['id_sinh_vien'],
                1,
            ]);
            $kq = CTBaiKiemTra::all();
            $response = [
                'status' => true,
                'data' => $kq,
            ];
            return response()->json($response, 200);
        }
        if ($sv == null) {
            DB::select('call cap_nhat_trang_thai_CTBKT(?,?,?)', [
                $input['id_bai_kiem_tra'],
                $input['id_sinh_vien'],
                3,
            ]);
            $kq = CTBaiKiemTra::all();
            $response = [
                'status' => true,
                'message' => 'Không nộp bài',
                'data' => $kq,
            ];
            return response()->json($response, 200);
        }
        if ($sv != null && $tg_ket_thuc < $tg_nop_bai) {
            DB::select('call cap_nhat_trang_thai_CTBKT(?,?,?)', [
                $input['id_bai_kiem_tra'],
                $input['id_sinh_vien'],
                2,
            ]);
            $kq = CTBaiKiemTra::all();
            $response = [
                'status' => true,
                'message' => 'Nộp trễ',
                'data' => $kq,
            ];
            return response()->json($response, 200);
        }
        if ($sv != null && $tg_ket_thuc == $tg_nop_bai) {
            DB::select('call cap_nhat_trang_thai_CTBKT(?,?,?)', [
                $input['id_bai_kiem_tra'],
                $input['id_sinh_vien'],
                1,
            ]);
            $kq = CTBaiKiemTra::all();
            $response = [
                'status' => true,
                'message' => 'Đã nộp',
                'data' => $kq,
            ];
            return response()->json($response, 200);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $ctBaiKiemTra = CTBaiKiemTra::find($id);
        if (empty($ctBaiKiemTra)) {
            return response()->json([
                'status' => false,
                'message' => 'Khong tim thay chi tiet bai kiem tra nao !'
            ], 404);
        }
        $ctBaiKiemTra->baikiemtra;
        $ctBaiKiemTra->traloi;
        $response = [
            'status' => true,
            'data' => $ctBaiKiemTra,
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
        $ctBaiKiemTra = CTBaiKiemTra::find($id);
        if (empty($ctBaiKiemTra)) {
            return response()->json([
                'status' => false,
                'message' => ' Khong tim thay chi tiet bai kiem tra nao !', 404
            ]);
        }
        $ctBaiKiemTra->fill([
            'id_bai_kiem_tra' => $request->input('id_bai_kiem_tra'),
            'id_sinh_vien' => $request->input('id_sinh_vien'),
            'tg_nop_bai' => $request->input('tg_nop_bai'),
            'tong_diem' => $request->input('tong_diem'),
            'trang_thai' => $request->input('trang_thai')
        ]);
        $ctBaiKiemTra->save();
        $response = [
            'status' => true,
            'message' => 'chinh sua thanh cong !',
            'data' => $ctBaiKiemTra
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
        $ctBaiKiemTra = CTBaiKiemTra::find($id);
        if (empty($baiTap)) {
            return response()->json([
                'status' => false,
                'message' => ' Khong tim thay chi tiet bai kiem tra nao !', 404
            ]);
        }
        $ctBaiKiemTra->delete();
        $lstCTBaiKiemTra = CTBaiKiemTra::all();
        $response = [
            'status' => true,
            'message' => 'xoa thanh cong !',
            'data' => $lstCTBaiKiemTra
        ];
        return response()->json($response, 200);
    }

    public function baikiemtrawithsinhvien(Request $request)
    {
        $idsv = $request->input('id_sinh_vien');
        $idlhp = $request->input('id_lop_hoc_phan');
        $lstbaikiemtra = CTBaiKiemTra::join('sinh_viens', 'ct_bai_kiem_tras.id_sinh_vien', '=', 'sinh_viens.id')
            ->join('bai_kiem_tras', 'ct_bai_kiem_tras.id_bai_kiem_tra', '=', 'bai_kiem_tras.id')
            ->join('lop_hoc_phans', 'lop_hoc_phans.id_lop', '=', 'sinh_viens.id_lop')
            ->where([['ct_bai_kiem_tras.id_sinh_vien', '=', $idsv], ['lop_hoc_phans.id', $idlhp]])
            ->select(
                'sinh_viens.ho_ten',
                'ct_bai_kiem_tras.*',
                'lop_hoc_phans.id as idlophocphan',
                'bai_kiem_tras.sl_cau_hoi',
                'bai_kiem_tras.tieu_de',
                'bai_kiem_tras.noi_dung',
                'bai_kiem_tras.tg_bat_dau',
                'bai_kiem_tras.tg_ket_thuc',
            )->get();
        if ($lstbaikiemtra == null) {
            $response = [
                'status' => false
            ];
            return response()->json($response, 200);
        }
        $response = [
            'status' => true,
            'data' => $lstbaikiemtra
        ];
        return response()->json($response, 200);
    }
}