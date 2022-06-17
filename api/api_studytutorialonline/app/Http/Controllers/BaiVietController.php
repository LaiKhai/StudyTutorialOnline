<?php

namespace App\Http\Controllers;

use App\Models\BaiViet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class BaiVietController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $lstBaiViet = BaiViet::all();
        return response()->json($lstBaiViet, 200);
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
    public function store(Request  $request)
    {
        $input['id_lop_hoc_phan'] = $request->input('id_lop_hoc_phan');
        $input['id_loai_bai_viet'] = $request->input('id_loai_bai_viet');
        $input['noi_dung'] = $request->input('noi_dung');
        $input['trang_thai'] = 1;
        $validator = Validator::make($input, [
            'id_lop_hoc_phan' => ['required', 'max:255', 'integer'],
            'id_loai_bai_viet' => ['required', 'max:255', 'integer'],
            'noi_dung' => ['required', 'string'],
            'trang_thai' => ['required', 'max:255', 'integer']
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        $baiViet = BaiViet::created($input);
        $response = [
            'message' => 'them thanh cong !',
            'baiviet' => $baiViet
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
        $baiViet = BaiViet::find($id);
        if (empty($baiViet)) {
            return response()->json(['message' => 'khong tim thay bai viet !'], 404);
        }
        $response = [
            'baiviet' => $baiViet
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
        $baiViet = BaiViet::find($id);
        if (empty($baiViet)) {
            return response()->json(['message' => 'khong tim thay bai viet !'], 404);
        }
        $baiViet->fill([
            'id_lop_hoc_phan' => $request->input('id_lop_hoc_phan'),
            'id_loai_bai_viet' => $request->input('id_loai_bai_viet'),
            'noi_dung' => $request->input('noi_dung'),
            'trang_thai' => $request->input('trang_thai'),
        ]);
        $baiViet->save();
        $response = [
            'message' => 'chinh sua thanh cong !',
            'khoa' => $baiViet
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
        //
    }
}