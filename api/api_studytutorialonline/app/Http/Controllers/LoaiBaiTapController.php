<?php

namespace App\Http\Controllers;

use App\Models\LoaiBaiTap;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

class LoaiBaiTapController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $loaiBaiTap = LoaiBaiTap::all();
        $respone = ['loaibaitap' => $loaiBaiTap];
        return response()->json($respone, 200);
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
        $input['trang_thai'] = $request->input('trang_thai');
        $validator = Validator::make($input, [
            'ten_loai' => ['required', 'string', 'max:255'],
            'trang_thai' => ['required', 'integer']
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $respone['error'] = $validator->errors();
            }
            $respone['message'] = 'Validator Errors';
            return response()->json($respone, 404);
        }
        $loaiBaiTap = LoaiBaiTap::create($input);
        $respone =
            [
                'message' => 'them loai bai tap thanh cong !',
                'loaibaitap' => $loaiBaiTap
            ];
        return response()->json($respone, 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $loaiBaiTap = LoaiBaiTap::find($id);
        if (empty($loaiBaiTap)) {
            $respone = [
                'message' => 'khong tim thay loai bai tap nao !',
            ];
            return response()->json($respone, 404);
        }
        $respone = [
            'loaibaitap' => $loaiBaiTap
        ];
        return response()->json($respone, 200);
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
        $loaiBaiTap = LoaiBaiTap::find($id);
        if (empty($loaiBaiTap)) {
            return response()->json(['messsage' => 'khong tim thay sinh vien nao !'], 404);
        }
        $loaiBaiTap->fill([
            'ten_loai' => $request->input('ten_loai'),
            'trang_thai' => $request->input('trang_thai'),
        ]);

        $loaiBaiTap->save();
        $response = [
            'message' => 'chinh sua thanh cong !',
            'sinhvien' => $loaiBaiTap
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
        $loaiBaiTap = LoaiBaiTap::find($id);
        if (empty($loaiBaiTap)) {
            $response = ['message' => 'khong tim thay sinh vien nao !'];
            return response()->json($response, 404);
        }
        $loaiBaiTap->delete();
        $lstLoaiBT = LoaiBaiTap::all();
        $response = [
            'message' => 'xoa thanh cong !',
            'sinhvien' => $lstLoaiBT
        ];
        return response()->json($response, 200);
    }
}