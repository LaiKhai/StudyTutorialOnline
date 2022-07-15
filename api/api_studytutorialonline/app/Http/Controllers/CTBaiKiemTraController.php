<?php

namespace App\Http\Controllers;

use App\Models\CTBaiKiemTra;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CTBaiKiemTraController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ctBaiKiemTra = CTBaiKiemTra::all();
        foreach ($ctBaiKiemTra as $item) {
            $item->baikiemtra;
            $item->traloi;
        }
        $response = [
            'status' => true,
            'ctbaikiemtra' => $ctBaiKiemTra
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
        $input['id_bai_kiem_tra'] = $request->input('id_bai_kiem_tra');
        $input['id_sinh_vien'] = $request->input('id_sinh_vien');
        $input['tg_nop_bai'] = $request->input('tg_nop_bai');
        $input['tong_diem'] = $request->input('tong_diem');
        $input['trang_thai'] = $request->input('trang_thai');
        $validator = Validator::make($input, [
            'id_bai_kiem_tra' => ['required', 'max:255', 'integer'],
            'id_sinh_vien' => ['required', 'max:255', 'string'],
            'tg_nop_bai' => ['required'],
            'tong_diem' => ['required'],
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
        $ctBaiKiemTra = CTBaiKiemTra::create($input);
        $response = [
            'status' => true,
            'message' => 'them chi tiet bai kiem tra thanh cong !',
            'ctbaikiemtra' => $ctBaiKiemTra
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
        $ctBaiKiemTra = CTBaiKiemTra::find($id);
        if (empty($ctBaiKiemTra)) {
            return response()->json([
                'status' => false,
                'message' => 'Khong tim thay chi tiet bai kiem tra nao !'
            ], 404);
        }
        $ctBaiKiemTra->baikiemtra;
        $ctBaiKiemTra->traloi;
        $response = [
            'status' => true,
            'ctbaikiemtra' => $ctBaiKiemTra,
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
        $ctBaiKiemTra = CTBaiKiemTra::find($id);
        if (empty($ctBaiKiemTra)) {
            return response()->json([
                'status' => false,
                'message' => ' Khong tim thay chi tiet bai kiem tra nao !', 404
            ]);
        }
        $ctBaiKiemTra->fill([
            'id_bai_kiem_tra' => $request->input('id_bai_kiem_tra'),
            'id_sinh_vien' => $request->input('id_sinh_vien'),
            'tg_nop_bai' => $request->input('tg_nop_bai'),
            'tong_diem' => $request->input('tong_diem'),
            'trang_thai' => $request->input('trang_thai')
        ]);
        $ctBaiKiemTra->save();
        $response = [
            'status' => true,
            'message' => 'chinh sua thanh cong !',
            'ctbaikiemtra' => $ctBaiKiemTra
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
        $ctBaiKiemTra = CTBaiKiemTra::find($id);
        if (empty($baiTap)) {
            return response()->json([
                'status' => false,
                'message' => ' Khong tim thay chi tiet bai kiem tra nao !', 404
            ]);
        }
        $ctBaiKiemTra->delete();
        $lstCTBaiKiemTra = CTBaiKiemTra::all();
        $response = [
            'status' => true,
            'message' => 'xoa thanh cong !',
            'ctbaikiemtra' => $lstCTBaiKiemTra
        ];
        return response()->json($response, 200);
    }
}