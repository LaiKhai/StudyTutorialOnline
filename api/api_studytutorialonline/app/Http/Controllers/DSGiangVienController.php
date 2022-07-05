<?php

namespace App\Http\Controllers;

use App\Models\DS_GiangVien;
use Illuminate\Http\Request;
use App\Models\GiangVien;
use Illuminate\Support\Facades\DB;
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
        $dsgv = DS_GiangVien::all();
        $response = [
            'status' => 'true',
            'lstdsgv' => $dsgv
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

        $input['id_giang_vien'] = $request->input('id_giang_vien');
        $input['id_lop_hoc_phan'] = $request->inpuut('id_lop_hoc_phan');
        $input['trang_thai'] = 1;
        DS_GiangVien::create($input);
        $lstdsgv = DS_GiangVien::all();
        $response = [
            'status' => 'true',
            'lstdsgv' => $lstdsgv
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

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function createDSSVWithGiangVien(Request $request)
    {

        $lopHocPhan = LopHocPhan::max('id');
        $input['id_giang_vien'] = $request->input('id_giang_vien');
        $input['id_lop_hoc_phan'] = $lopHocPhan;
        DB::select('call tao_dsgv(?,?)', [
            $input['id_giang_vien'],
            $input['id_lop_hoc_phan'],
        ]);
        $lstdsgv = DS_GiangVien::all();

        $response = [
            'status' => 'true',
            'lstdsgv' => $lstdsgv
        ];
        return response()->json($response, 200);
    }
}