<?php

namespace App\Http\Controllers;

use App\Models\BinhLuan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BinhLuanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $binhLuan = BinhLuan::all();
        foreach ($binhLuan as $item) {
            $item->sinhvien;
            $item->baitap;
        }
        $response = [
            'binhluan' => $binhLuan
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
        $input['id_bai_tap'] = $request->input('id_bai_tap');
        $input['id_sinh_vien'] = $request->input('id_sinh_vien');
        $input['noi_dung'] = $request->input('noi_dung');
        $input['trang_thai'] = 1;
        $validator = Validator::make($input, [
            'id_bai_tap' => ['required', 'max:255', 'integer'],
            'id_sinh_vien' => ['required', 'max:255', 'integer'],
            'noi_dung' => ['required', 'max:255', 'string'],
            'trang_thai' => ['required', 'max:255', 'integer'],
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        $binhLuan = BinhLuan::create($input);
        $binhLuan->baitap;
        $binhLuan->sinhvien;
        $response = [
            'message' => 'them thanh cong bo mon !',
            'binhluan' => $binhLuan
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
        $binhLuan = BinhLuan::find($id);
        if (empty($binhLuan)) {
            return response()->json(['message' => 'khong tim thay binh luan !'], 404);
        }
        $binhLuan->baitap;
        $binhLuan->sinhvien;
        $response = [
            'binhluan' => $binhLuan
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
        $binhLuan = BinhLuan::find($id);
        if (empty($binhLuan)) {
            return response()->json(['message' => 'khong tim thay binh luan !'], 404);
        }
        $binhLuan->fill([
            'id_bai_tap' => $request->input('id_bai_tap'),
            'id_sinh_vien' => $request->input('id_sinh_vien'),
            'noi_dung' => $request->input('noi_dung'),
            'trang_thai' => $request->input('trang_thai'),
        ]);
        $binhLuan->save();
        $binhLuan->baitap;
        $binhLuan->sinhvien;
        $response = [
            'message' => 'chinh sua thanh cong !',
            'binhluan' => $binhLuan
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
        $binhLuan = BinhLuan::find($id);
        if (empty($binhLuan)) {
            return response()->json(['message' => 'khong tim thay binh luan !'], 404);
        }
        $binhLuan->delete();
        $lstBinhLuan = BinhLuan::all();
        foreach ($lstBinhLuan as $item) {
            $item->baitap;
            $item->sinhvien;
        }
        $response = [
            'message' => 'xoa thanh cong !',
            'binhluan' => $lstBinhLuan
        ];
        return response()->json($response, 200);
    }
}