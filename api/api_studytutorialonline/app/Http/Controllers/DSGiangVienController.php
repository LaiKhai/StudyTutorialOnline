<?php

namespace App\Http\Controllers;

use App\Models\DS_GiangVien;
use App\Http\Requests\StoreDS_GiangVienRequest;
use App\Http\Requests\UpdateDS_GiangVienRequest;
use App\Models\GiangVien;
use App\Models\LopHocPhan;

class DSGiangVienController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
     * @param  \App\Http\Requests\StoreDS_GiangVienRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreDS_GiangVienRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\DS_GiangVien  $dS_GiangVien
     * @return \Illuminate\Http\Response
     */
    public function show(DS_GiangVien $dS_GiangVien)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\DS_GiangVien  $dS_GiangVien
     * @return \Illuminate\Http\Response
     */
    public function edit(DS_GiangVien $dS_GiangVien)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateDS_GiangVienRequest  $request
     * @param  \App\Models\DS_GiangVien  $dS_GiangVien
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateDS_GiangVienRequest $request, DS_GiangVien $dS_GiangVien)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\DS_GiangVien  $dS_GiangVien
     * @return \Illuminate\Http\Response
     */
    public function destroy(DS_GiangVien $dS_GiangVien)
    {
        //
    }

    public function createDSSVWithGiangVien()
    {
        $giangVien = GiangVien::all();
        $lopHocPhan = LopHocPhan::max('id');
        foreach ($giangVien as $item) {
            $input['id_giang_vien'] = $item->id;
            $input['id_lop_hoc_phan'] = $lopHocPhan;
            $input['trang_thai'] = 1;
            DS_GiangVien::create($input);
        }
        $lstdsgv = DS_GiangVien::all();
        return response()->json($lstdsgv, 200);
    }
}