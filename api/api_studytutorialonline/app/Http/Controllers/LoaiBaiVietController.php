<?php

namespace App\Http\Controllers;

use App\Models\LoaiBaiViet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class LoaiBaiVietController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $lstLoaiBaiViet = LoaiBaiViet::all();
        $response = [
            'loaibaiviet' => $lstLoaiBaiViet
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
        $input['ten_loai'] = $request->input('ten_loai');
        $input['trang_thai'] = 1;
        $validator = Validator::make($input, [
            'ten_loai' => ['required', 'max:255', 'string'],
            'trang_thai' => ['required', 'max:255', 'integer'],
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        $loaiBaiViet = LoaiBaiViet::create($input);
        $response = [
            'message' => 'them thanh cong !',
            'loaibaiviet' => $loaiBaiViet
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
        $loaiBaiViet = LoaiBaiViet::find($id);
        if (empty($loaiBaiViet)) {
            return response()->json(['message' => 'khong tim thay loai bai viet nao !'], 404);
        }
        $response = [
            'loaibaiviet' => $loaiBaiViet
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
        $loaiBaiViet = LoaiBaiViet::find($id);
        if (empty($loaiBaiViet)) {
            return response()->json(['message' => 'khong tim thay loai bai viet !'], 404);
        }
        $loaiBaiViet->fill([
            'ten_loai' => $request->input('noi_dung'),
            'trang_thai' => $request->input('trang_thai'),
        ]);
        $loaiBaiViet->save();
        $response = [
            'message' => 'chinh sua thanh cong !',
            'loaibaiviet' => $loaiBaiViet
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
        $loaiBaiViet = LoaiBaiViet::find($id);
        if (empty($loaiBaiViet)) {
            return response()->json(['message' => 'khong tim thay loai bai viet nao !'], 404);
        }
        $loaiBaiViet->delete();
        $response = [
            'message' => 'xoa thanh cong !',
            'loaibaiviet' => $loaiBaiViet
        ];
        return response()->json($response, 200);
    }
}