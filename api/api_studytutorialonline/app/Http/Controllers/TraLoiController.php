<?php

namespace App\Http\Controllers;

use App\Exports\DanhSachDiemExport;
use App\Models\BaiKiemTra;
use App\Models\TraLoi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\DB;

use Illuminate\Database\Eloquent\ModelNotFoundException;

class TraLoiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $traLoi = TraLoi::all();
        foreach ($traLoi as $item) {
            $item->sinhvien;
            $item->cauhoi;
            $item->file;
        }
        $response = [
            'status' => true,
            'traloi' => $traLoi
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
        $input['id_sinh_vien'] = $request->input('id_sinh_vien');
        $input['id_cau_hoi'] = $request->input('id_cau_hoi');
        $input['id_file'] = $request->input('id_file');
        $input['dap_an'] = $request->input('dap_an');
        $input['diem'] = $request->input('diem');
        $input['trang_thai'] = $request->input('trang_thai');
        $validator = Validator::make($input, [
            'id_sinh_vien' => ['required', 'max:255', 'integer'],
            'id_cau_hoi' => ['required', 'max:255', 'integer'],
            'dap_an' => ['required', 'max:255'],
            'diem' => ['required', 'max:255'],
            'trang_thai' => ['required', 'max:255', 'integer'],
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
                $response['status'] = false;
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        $traLoi = TraLoi::create($input);
        $response = [
            'status' => true,
            'message' => 'them cau tra loi thanh cong',
            'traloi' => $traLoi
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
        $traLoi = TraLoi::find($id);
        $traLoi->sinhvien;
        $traLoi->cauhoi;
        $traLoi->file;
        if (empty($traLoi)) {
            return response()->json([
                'status' => false,
                'message' => 'Khong tim thay cau tra loi nao !'
            ], 404);
        }
        $response = [
            'status' => true,
            'traloi' => $traLoi,
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
        $traLoi = TraLoi::find($id);
        if (empty($traLoi)) {
            return response()->json([
                'status' => false,
                'message' => ' Khong tim thay cau tra loi nao !', 404
            ]);
        }
        $traLoi->fill([
            'id_sinh_vien' => $request->input('id_sinh_vien'),
            'id_cau_hoi' => $request->input('id_bai_tap'),
            'id_file' => $request->input('id_file'),
            'dap_an' => $request->input('dap_an'),
            'diem' => $request->input('diem'),
            'trang_thai' => $request->input('trang_thai')
        ]);
        $traLoi->save();
        $response = [
            'status' => true,
            'message' => 'chinh sua thanh cong !',
            'traloi' => $traLoi
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
        $traLoi = TraLoi::find($id);
        if (empty($baiTap)) {
            return response()->json([
                'status' => false,
                'message' => ' Khong tim thay cau tra loi nao !', 404
            ]);
        }
        $traLoi->delete();
        $lstTraLoi = TraLoi::all();
        $response = [
            'status' => true,
            'message' => 'xoa thanh cong !',
            'traloi' => $lstTraLoi
        ];
        return response()->json($response, 200);
    }

    public function traloiwithbaikiemtra(Request $request)
    {
        $idBaiKtra = $request->input('id_bai_ktra');
        $idSinhVien = $request->input('id_sinh_vien');
        $baikiemtra = TraLoi::join('cau_hois', 'tra_lois.id_cau_hoi', '=', 'cau_hois.id')
            ->join('ct_bai_kiem_tras', 'ct_bai_kiem_tras.id_sinh_vien', '=', 'tra_lois.id_sinh_vien')
            ->where([['tra_lois.id_sinh_vien', $idSinhVien], ['cau_hois.id_bai_kiem_tra', $idBaiKtra]])
            ->select(
                'tra_lois.id as idTraLoi',
                'tra_lois.dap_an',
                'tra_lois.diem',
                'tra_lois.trang_thai',
                'cau_hois.*',
                'ct_bai_kiem_tras.trang_thai as trangthaictbaikiemtra'
            )
            ->get();
        $response = [
            'status' => true,
            'baikiemtra' => $baikiemtra
        ];
        return response()->json($response, 200);
    }

    public function exportDiemSV(Request $request)
    {
        return Excel::download(new DanhSachDiemExport($request->baikt, $request->lophp), 'DS_Diem_SV.xlsx');
    }

    public function danhsachDiemSV(Request $request)
    {
        $lsttraloi = TraLoi::join('cau_hois', 'tra_lois.id_cau_hoi', '=', 'cau_hois.id')
            ->join('bai_kiem_tras', 'cau_hois.id_bai_kiem_tra', '=', 'bai_kiem_tras.id')
            ->join('ct_bai_kiem_tras', 'ct_bai_kiem_tras.id_bai_kiem_tra', '=', 'bai_kiem_tras.id')
            ->join('sinh_viens', 'tra_lois.id_sinh_vien', '=', 'sinh_viens.id')
            ->join('lops', 'sinh_viens.id_lop', '=', 'lops.id')
            ->join('lop_hoc_phans', 'lop_hoc_phans.id_lop', '=', 'sinh_viens.id_lop')
            ->where([['cau_hois.id_bai_kiem_tra', $request->input('id_bai_kiem_tra')], ['lop_hoc_phans.id', $request->input('id_lop_hp')]])
            ->select('sinh_viens.ma_so', 'sinh_viens.ho_ten', 'lops.ten_lop', 'bai_kiem_tras.id as idBKT', DB::raw("SUM(tra_lois.diem) as tongdiem"), 'ct_bai_kiem_tras.trang_thai as trangthaiCTBKT')
            ->groupBy('sinh_viens.ma_so', 'sinh_viens.ho_ten', 'lops.ten_lop', 'bai_kiem_tras.id', 'ct_bai_kiem_tras.trang_thai')
            ->get();

        $response = [
            'status' => true,
            'dsdiemsv' => $lsttraloi
        ];
        return response()->json($response, 404);
    }

    public function lichsuTraLoi(Request $request)
    {
        $lichsu = TraLoi::join('cau_hois', 'tra_lois.id_cau_hoi', '=', 'cau_hois.id')
            ->join('bai_kiem_tras', 'cau_hois.id_bai_kiem_tra', '=', 'bai_kiem_tras.id')
            ->join('sinh_viens', 'tra_lois.id_sinh_vien', '=', 'sinh_viens.id')
            ->join('lops', 'sinh_viens.id_lop', '=', 'lops.id')
            ->where([['cau_hois.id_bai_kiem_tra', $request->input('id_bai_kiem_tra')], ['sinh_viens.id', $request->input('id_sinh_vien')]])
            ->select('tra_lois.id as idcautraloi', 'sinh_viens.ma_so', 'sinh_viens.ho_ten', 'lops.ten_lop', 'bai_kiem_tras.id as idBKT', 'tra_lois.dap_an')
            ->groupBy('tra_lois.id', 'sinh_viens.ma_so', 'sinh_viens.ho_ten', 'lops.ten_lop', 'bai_kiem_tras.id', 'tra_lois.dap_an')
            ->get();

        $response = [
            'status' => true,
            'dsdiemsv' => $lichsu
        ];
        return response()->json($response, 404);
    }
}