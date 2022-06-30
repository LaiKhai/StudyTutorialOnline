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
        //
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
            return response()->json(['message' => 'khong tim thay danh sach nao !'], 404);
        }
        $dssv->sinhvien;
        $dssv->lophocphan;
        $response = [
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
    public function destroy($id)
    {
        //
    }

    public function createDSSVWithSinhVien()
    {
        $lopHocPhan = LopHocPhan::max('id');
        $sinhVien = DS_SinhVien::join('sinh_viens', 'ds_sinh_viens.id_sinh_vien', '=', 'sinh_viens.id')
            ->join('lop_hoc_phans', 'ds_sinh_viens.id_lop_hoc_phan', '=', 'lop_hoc_phans.id')
            ->join('lops', 'lop_hoc_phans.id_lop', '=', 'lops.id')
            ->where('ds_sinh_viens.id_lop_hoc_phan', $lopHocPhan)
            ->select('sinh_viens.*')->get();

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
            'message' => 'them danh sach thanh cong !',
            // 'dssv' => $lstDSSV
            'sinhVien' => $sinhVien
        ];

        return response()->json($response, 200);
    }
}