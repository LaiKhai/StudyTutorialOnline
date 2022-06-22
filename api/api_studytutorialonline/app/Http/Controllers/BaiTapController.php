<?php

namespace App\Http\Controllers;

use App\Models\BaiTap;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BaiTapController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $lstBaiTap = BaiTap::all();
        foreach ($lstBaiTap as $item) {
            $item->lophocphan;
            $item->loaibaitap;
        }
        $response = [
            'baitap' => $lstBaiTap
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
        $input['id_lop_hoc_phan'] = $request->input('id_lop_hoc_phan');
        $input['id_file'] = $request->input('id_file');
        $input['id_loai'] = $request->input('id_loai');
        $input['tieu_de'] = $request->input('tieu_de');
        $input['noi_dung'] = $request->input('noi_dung');
        $input['tg_bat_dau'] = $request->input('tg_bat_dau');
        $input['tg_ket_thuc'] = $request->input('tg_ket_thuc');
        $input['trang_thai'] = $request->input('trang_thai');
        $validator = Validator::make($input, [
            'id_lop_hoc_phan' => ['required', 'max:255', 'integer'],
            'id_loai' => ['required', 'max:255', 'integer'],
            'tieu_de' => ['required', 'max:255', 'string'],
            'noi_dung' => ['required', 'integer'],
            'tg_bat_dau' => ['required'],
            'tg_ket_thuc' => ['required'],
            'trang_thai' => ['required', 'max:255', 'integer'],
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        $baiTap = BaiTap::create($input);
        $response = [
            'message' => 'them bai tap thanh cong !',
            'baiTap' => $baiTap
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
        $baiTap = BaiTap::find($id);
        if (empty($baiTap)) {
            return response()->json(['message' => 'Khong tim thay bai tap nao !'], 404);
        }
        $baiTap->lophocphan;
        $baiTap->loaibaitap;
        $response = [
            'baiTap' => $baiTap,
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
        $baiTap = BaiTap::find($id);
        if (empty($baiTap)) {
            return response()->json(['message' => ' Khong tim thay bai tap nao !', 404]);
        }
        $baiTap->fill([
            'id_lop_hoc_phan' => $request->input('id_lop_hoc_phan'),
            'id_file' => $request->input('id_file'),
            'id_loai' => $request->input('id_loai'),
            'tieu_de' => $request->input('tieu_de'),
            'noi_dung' => $request->input('noi_dung'),
            'tg_bat_dau' => $request->input('tg_bat_dau'),
            'tg_ket_thuc' => $request->input('tg_ket_thuc'),
            'trang_thai' => $request->input('trang_thai')
        ]);
        $baiTap->save();
        $response = [
            'message' => 'chinh sua thanh cong !',
            'baitap' => $baiTap
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
        $baiTap = BaiTap::find($id);
        if (empty($baiTap)) {
            return response()->json(['message' => ' Khong tim thay bai tap nao !', 404]);
        }
        $baiTap->delete();
        $lstBaiTap = BaiTap::all();
        $response = [
            'message' => 'xoa thanh cong !',
            'baitap' => $lstBaiTap
        ];
        return response()->json($response, 200);
    }
}