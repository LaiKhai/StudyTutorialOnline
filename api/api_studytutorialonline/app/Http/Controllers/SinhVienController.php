<?php

namespace App\Http\Controllers;

use App\Models\SinhVien;
use App\Models\Lop;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\SinhVienImport;
use Illuminate\Support\Facades\Storage;

class SinhVienController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $sinhVien=SinhVien::all();
        $lop=Lop::max('id');
        $response=[
            'sinhvien'=>$sinhVien,
            'id_lop'=>$lop
        ];
        return response()->json($response,200);
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
     * @param  \App\Models\SinhVien  $sinhVien
     * @return \Illuminate\Http\Response
     */
    public function show(SinhVien $sinhVien)
    {
        $sinhvien=SinhVien::find($sinhVien)->first();
        return response()->json($sinhvien,200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\SinhVien  $sinhVien
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, SinhVien $sinhVien)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\SinhVien  $sinhVien
     * @return \Illuminate\Http\Response
     */
    public function destroy(SinhVien $sinhVien)
    {
        //
    }
    public function import(Request $request) 
    {
        if($request->hasFile('SVimport')){
            $path1 = $request->file('SVimport')->store('temp','public');
            $path=Storage::files($path1);
            Excel::import(new SinhVienImport, $path);    
        }
        $sinhVien=SinhVien::all();
        $response=[
            'message'=>"Them thanh cong",
            'sinhvien'=>$path
        ];
        return response()->json($response,200);
    }
}