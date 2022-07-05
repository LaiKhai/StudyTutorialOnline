<?php

namespace App\Http\Controllers;

use App\Models\CTBaiTap;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CTBaiTapController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ctBaiTap = CTBaiTap::all();
        foreach ($ctBaiTap as $item) {
            $item->sinhvien;
            $item->baitap;
            $item->lophocphan;
            $item->file;
        }
        $response = [
            'status' => true,
            'ctbaitap' => $ctBaiTap
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
        $input['id_bai_tap'] = $request->input('id_bai_tap');
        $input['id_lop_hoc_phan'] = $request->input('id_lop_hoc_phan');
        $input['tg_nop_bai'] = $request->input('tg_nop_bai');
        $input['trang_thai'] = $request->input('trang_thai');
        $validator = Validator::make($input, [
            'id_sinh_vien' => ['required', 'max:255', 'integer'],
            'id_bai_tap' => ['required', 'max:255', 'integer'],
            'id_lop_hoc_phan' => ['required'],
            'tg_nop_bai' => ['required'],
            'trang_thai' => ['required'],
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
                $response['status'] = false;
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        $ctBaiTap = CTBaiTap::created($input);
        $response = [
            'status' => true,
            'message' => 'them thanh cong !',
            'ctbaitap' => $ctBaiTap
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
        $ctBaiTap = CTBaiTap::find($id);
        if (empty($ctBaiTap)) {
            return response()->json([
                'status' => false,
                'message' => 'Khong tim thay chi tiet bai tap nao !'
            ], 404);
        }
        $ctBaiTap->sinhvien;
        $ctBaiTap->baitap;
        $ctBaiTap->lophocphan;
        $ctBaiTap->file;
        $response = [
            'status' => true,
            'ctbaitap' => $ctBaiTap,
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
        $ctBaiTap = CTBaiTap::find($id);
        if (empty($ctBaiTap)) {
            return response()->json([
                'status' => false,
                'message' => ' Khong tim thay chi tiet bai tap nao !', 404
            ]);
        }
        $ctBaiTap->fill([
            'id_sinh_vien' => $request->input('id_sinh_vien'),
            'id_bai_tap' => $request->input('id_bai_tap'),
            'id_lop_hoc_phan' => $request->input('id_lop_hoc_phan'),
            'tg_nop_bai' => $request->input('tg_nop_bai'),
            'trang_thai' => $request->input('trang_thai')
        ]);
        $ctBaiTap->save();
        $response = [
            'status' => true,
            'message' => 'chinh sua thanh cong !',
            'ctbaitap' => $ctBaiTap
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
        $ctBaiTap = CTBaiTap::find($id);
        if (empty($baiTap)) {
            return response()->json([
                'status' => false,
                'message' => ' Khong tim thay chi tiet bai kiem tra nao !', 404
            ]);
        }
        $ctBaiTap->delete();
        $lstCTBaiTap = CTBaiTap::all();
        $response = [
            'status' => true,
            'message' => 'xoa thanh cong !',
            'ctbaitap' => $lstCTBaiTap
        ];
        return response()->json($response, 200);
    }
}