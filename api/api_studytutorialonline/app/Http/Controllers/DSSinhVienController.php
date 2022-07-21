<?php

namespace App\Http\Controllers;

use App\Imports\DSSVImport;
use App\Models\DS_SinhVien;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\DB;
use App\Models\SinhVien;
use App\Models\LopHocPhan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class DSSinhVienController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $lstDSSV = DS_SinhVien::all();
        foreach ($lstDSSV as $item) {
            $item->sinhvien;
            $item->lophocphan;
        }
        $response = [
            'status' => true,
            'dssv' => $lstDSSV
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
        $input['id_lop_hoc_phan'] = $request->input('id_lop_hoc_phan');
        $input['trang_thai'] = "1";

        $validator = Validator::make($input, [
            'id_sinh_vien' => ['required', 'max:255', 'integer'],
            'id_lop_hoc_phan' => ['required', 'max:255', 'integer'],
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
        $dssv = DS_SinhVien::create($input);
        $response = ['status' => true, 'dssv' => $dssv];
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
        $dssv = DS_SinhVien::find($id);
        if (empty($dssv)) {
            return response()->json([
                'status' => false,
                'message' => 'khong tim thay danh sach nao !'
            ], 404);
        }
        $dssv->sinhvien;
        $dssv->lophocphan;
        $response = [
            'status' => true,
            'dssv' => $dssv
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function deletesinhvien(Request $request)
    {
        $dssv = DS_SinhVien::where('id_sinh_vien', $request->input('id_sinh_vien'))->first();
        if (empty($dssv)) {
            $response = [
                'status' => false,
                'message' => 'khong tim thay sinh vien nao !'
            ];
            return response()->json($response, 404);
        }
        DS_SinhVien::where('id_sinh_vien', $request->input('id_sinh_vien'))->delete();
        $lstSinhVien = DS_SinhVien::all();
        $response = [
            'message' => 'xoa thanh cong !',
            'sinhvien' => $lstSinhVien
        ];
        return response()->json($response, 200);
    }

    public function createDSSVWithSinhVien()
    {
        $lopHocPhan = LopHocPhan::max('id');
        $idLop = LopHocPhan::find($lopHocPhan);
        $sinhVien = SinhVien::join('lops', 'sinh_viens.id_lop', '=', 'lops.id')
            ->where('sinh_viens.id_lop', $idLop->id_lop)
            ->select('sinh_viens.*')
            ->get();

        foreach ($sinhVien as $item) {
            $input['id_sinh_vien'] = $item->id;
            $input['id_lop_hoc_phan'] = $lopHocPhan;
            DB::select('call tao_dssv(?,?)', [
                $input['id_sinh_vien'],
                $input['id_lop_hoc_phan'],
            ]);
        }
        $lstDSSV = DS_SinhVien::all();
        $response = [
            'status' => true,
            'message' => 'them danh sach thanh cong !',
            // 'dssv' => $lstDSSV
            'sinhVien' => $lstDSSV
        ];

        return response()->json($response, 200);
    }
}