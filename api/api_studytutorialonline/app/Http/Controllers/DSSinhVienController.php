<?php

namespace App\Http\Controllers;

use App\Models\DS_SinhVien;
use App\Models\Lop;
use App\Models\SinhVien;
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
        foreach ($sinhVien as $item) {
            $input['id_sinh_vien'] = $item->id;
            $input['id_lop_hoc_phan'] = $item->lop->lophocphan->id;
            $input['id_lop'] = $item->lop->id;
            $input['trang_thai'] = 1;
            $dsSinhVien = DS_SinhVien::created($input);
        }
        $response = [
            'message' => 'them thanh cong !',
            'danhsachsinhvien' => $dsSinhVien
        ];
        return response()->json($response, 200);
    }
}