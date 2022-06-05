<?php

namespace App\Http\Controllers;

use App\Models\DS_SinhVien;
use App\Http\Requests\StoreDS_SinhVienRequest;
use App\Http\Requests\UpdateDS_SinhVienRequest;

class DSSinhVienController extends Controller
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
     * @param  \App\Http\Requests\StoreDS_SinhVienRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreDS_SinhVienRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\DS_SinhVien  $dS_SinhVien
     * @return \Illuminate\Http\Response
     */
    public function show(DS_SinhVien $dS_SinhVien)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\DS_SinhVien  $dS_SinhVien
     * @return \Illuminate\Http\Response
     */
    public function edit(DS_SinhVien $dS_SinhVien)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateDS_SinhVienRequest  $request
     * @param  \App\Models\DS_SinhVien  $dS_SinhVien
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateDS_SinhVienRequest $request, DS_SinhVien $dS_SinhVien)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\DS_SinhVien  $dS_SinhVien
     * @return \Illuminate\Http\Response
     */
    public function destroy(DS_SinhVien $dS_SinhVien)
    {
        //
    }
}
