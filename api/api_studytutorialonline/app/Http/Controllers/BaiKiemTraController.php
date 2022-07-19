<?php

namespace App\Http\Controllers;

use App\Models\BaiKiemTra;
use App\Models\CauHoi;
use App\Models\CTBaiKiemTra;
use App\Models\DS_SinhVien;
use App\Models\SinhVien;
use App\Models\TraLoi;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class BaiKiemTraController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $baiKiemTra = BaiKiemTra::all()->where('trang_thai', '>', "0");
        foreach ($baiKiemTra as $item) {
            $item->lophocphan;
            $item->giangvien;
            $item->file;
            $item->ctbaikiemtra;
            $item->cauhoi;
        }
        $response = [
            'status' => true,
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
                $response['status'] = false;
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
            'status' => true,
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
    public function show(Request $request, $id)
    {
        $baiKiemTra = BaiKiemTra::find($id);
        if (empty($baiKiemTra)) {
            return response()->json([
                'status' => false,
                'message' => 'Khong tim thay bai kiem tra nao !'
            ], 404);
        }
        $baiKiemTra->lophocphan;
        $baiKiemTra->giangvien;
        $baiKiemTra->file;
        $baiKiemTra->ctbaikiemtra;
        $baiKiemTra->cauhoi;
        $idsv = CTBaiKiemTra::join('bai_kiem_tras', 'ct_bai_kiem_tras.id_bai_kiem_tra', '=', 'bai_kiem_tras.id')
            ->join('sinh_viens', 'ct_bai_kiem_tras.id_sinh_vien', '=', 'sinh_viens.id')
            ->where('ct_bai_kiem_tras.id_bai_kiem_tra', $id)
            ->select('ct_bai_kiem_tras.id_sinh_vien')
            ->first();
        $sv = SinhVien::find($idsv);
        $response = [
            'status' => true,
            'baikiemtra' => $baiKiemTra,
            'sinhvien' => $sv
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
            return response()->json([
                'status' => false,
                'message' => ' Khong tim thay bai kiem tra nao !', 404
            ]);
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
            'status' => true,
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
            'status' => true,
            'message' => 'xoa thanh cong !',
            'baikiemtra' => $lstBaiKiemTra
        ];
        return response()->json($response, 200);
    }

    /**
     * Remove the specified resource from storage.
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function taoBaiKT(Request $request)
    {

        DB::select('call tao_Bai_Ktra(?,?,?,?,?,?,?)', [
            $request->input('tg_ket_thuc'),
            $request->input('id_lop_hoc_phan'),
            $request->input('sl_cau_hoi'),
            $request->input('id_giang_vien'),
            $request->input('tieu_de'),
            $request->input('noi_dung'),
            $request->input('trang_thai'),
        ]);
        $idbaiKiemTra = BaiKiemTra::max('id');
        $baiKiemTra = BaiKiemTra::find($idbaiKiemTra);
        $response = [
            'status' => true,
            'message' => 'Tao bai kiem tra thanh cong !',
            'baikiemtra' => $baiKiemTra
        ];
        return response()->json($response, 200);
    }

    /**
     * Remove the specified resource from storage.
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function taoCauHoi(Request $request)
    {
        foreach ($request->json('list_cau_hoi') as $item) {
            DB::select('call tao_cau_hoi(?,?,?,?,?,?,?,?)', [
                $item['id_bai_kiem_tra'],
                $item['de_bai'],
                $item['dap_an_1'],
                $item['dap_an_2'],
                $item['dap_an_3'],
                $item['dap_an_4'],
                $item['dap_an_dung'],
                $item['diem'],
            ]);
        }
        $cauHoi = CauHoi::all();
        $response = [
            'status' => true,
            'message' => 'Tao cau hoi thanh cong !',
            'cauhoi' => $cauHoi
        ];
        return response()->json($response, 200);
    }

    /**
     * Remove the specified resource from storage.
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function taoCauTraloi(Request $request)
    {
        DB::select('call Tao_cau_TrL(?,?,?)', [
            $request->input('dap_an'),
            $request->input('id_cau_hoi'),
            $request->input('id_cau_tra_loi'),
        ]);
        $traLoi = TraLoi::find($request->input('id_cau_tra_loi'));
        $response = [
            'message' => 'da tra loi !',
            'traloi' => $traLoi
        ];
        return response()->json($response, 200);
    }

    /**
     * Remove the specified resource from storage.
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function nopBai(Request $request)
    {
        try {
            foreach ($request->json('list_cau_tra_loi') as $item) {
                DB::select('call Tao_cau_TrL(?,?,?)', [
                    $item['dap_an'],
                    $item['id_cau_hoi'],
                    $item['id_cau_tra_loi'],
                ]);
            }
            $traLoi = TraLoi::all();
            $response = [
                'status' => true,
                'message' => 'da nop bai thanh cong !',
                'traloi' => $traLoi
            ];
        } catch (ModelNotFoundException $exception) {
            $response = [
                'status' => false
            ];
        }
        return response()->json($response, 200);
    }

    /**
     * Remove the specified resource from storage.
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function batdauKT(Request $request)
    {
        DB::select('call Bat_dau_KT(?,?)', [
            $request->input('id_bai_kiem_tra'),
            $request->input('id_lop_hoc_phan'),
        ]);
        DB::select('call tao_chi_tiet_bai_ktra_2(?,?)', [
            $request->input('id_bai_kiem_tra'),
            3,
        ]);
        $traLoi = TraLoi::all();
        $ctbaiktra = CTBaiKiemTra::all();
        $response = [
            'message' => 'da bat dau kiem tra !',
            'traloi' => $traLoi,
            'ctBaiKtra' => $ctbaiktra
        ];
        return response()->json($response, 200);
    }
}