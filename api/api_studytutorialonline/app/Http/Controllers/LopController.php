<?php

namespace App\Http\Controllers;

use App\Models\Lop;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Exists;

class LopController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $lstLop = Lop::all();
        return response()->json($lstLop, 200);
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
        $input['id_giangvien'] = $request->input('id_giangvien');
        $input['ten_lop'] = $request->input('ten_lop');
        $input['nien_khoa'] = $request->input('nien_khoa');
        $input['trang_thai'] = 1;

        $validator = Validator::make($input, ['ten_lop' => 'required|max:255|string', 'nien_khoa' => 'required|max:255|string']);

        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $respone['data'] = $validator->errors();
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }

        $lop = Lop::create($input);
        $respone = [
            'message' => "Them lop thanh cong !",
            'lop' => $lop
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
        $lop = Lop::find($id);
        $sinhvien = Lop::find($id)->sinhvien;
        $respone = [
            'lop' => $lop,
            'sinhvien' => $sinhvien
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
        $lop = Lop::find($id);
        if (empty($lop)) {
            return response()->json(['message' => 'khong tim thay lop nao !'], 404);
        }
        $lop->fill([
            'id_giangvien' => $request->input('id_giangvien'),
            'ten_lop' => $request->input('ten_lop'),
            'nien_khoa' => $request->input('nien_khoa'),
            'trang_thai' => $request->input('trang_thai'),
        ]);
        $lop->save();
        $respone = [
            'message' => 'chinh sua thanh cong !',
            'lop' => $lop
        ];
        return response()->json($respone, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $lop = Lop::find($id);
        $sinhVien = $lop->sinhvien->first();
        if (empty($lop)) {
            return response()->json(['message' => 'khong tim thay lop nao !'], 404);
        } else if (!empty($sinhVien)) {
            return response()->json(['message' => 'Lop dang co sinh vien nen khong the xoa !'], 404);
        }
        $lop->delete();
        $lstLop = Lop::all();
        $respone = [
            'message' => 'xoa thanh cong !',
            'lop' => $lstLop,
        ];
        return response()->json($respone, 200);
    }
}