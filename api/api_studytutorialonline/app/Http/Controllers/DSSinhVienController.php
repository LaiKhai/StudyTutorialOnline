<?php

namespace App\Http\Controllers;

use App\Imports\DSSVImport;
use App\Models\DS_SinhVien;
use Maatwebsite\Excel\Facades\Excel;
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
        //
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
        $sinhVien = SinhVien::all();
        $lopHocPhan = LopHocPhan::max('id');
        foreach ($sinhVien as $item) {
            $input['id_sinh_vien'] = $item->id;
            $input['id_lop'] = $item->id_lop;
            $input['id_lop_hoc_phan'] = $lopHocPhan;
            $input['trang_thai'] = 1;
            DS_SinhVien::create($input);
        }
        $lstdssv = DS_SinhVien::all();
        return response()->json($lstdssv, 200);
    }
}