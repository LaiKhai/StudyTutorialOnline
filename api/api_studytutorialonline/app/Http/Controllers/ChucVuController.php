<?php

namespace App\Http\Controllers;

use App\Models\ChucVu;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ChucVuController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $chucVu = ChucVu::all();
        $response = [
            'chucvu' => $chucVu
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
     *  @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input['ten_chuc_vu'] = $request->input('ten_chuc_vu');
        $input['trang_thai'] = 1;
        $validator = Validator::make($input, [
            'ten_chuc_vu' => 'required|string|max:255',
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        $chucVu = ChucVu::create($input);
        $response = [
            'message' => 'Tao thanh cong !',
            'chucvu' => $chucVu
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
        $chucVu = ChucVu::find($id);
        $response = [
            'chucvu' => $chucVu
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
        $chucVu = ChucVu::find($id);
        if (empty($chucVu)) {
            return response()->json(['message' => 'khong tim thay chuc vu nao !'], 404);
        }
        $chucVu->fill([
            'ten_chuc_vu' => $request->input('ten_chuc_vu'),
            'trang_thai' => $request->input('trang_thai')
        ]);
        $chucVu->save();
        $response = [
            'message' => 'chinh sua thanh cong !',
            'chucvu' => $chucVu,
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
        $chucVu = ChucVu::find($id);
        if (empty($chucVu)) {
            return response()->json(['message' => 'khong tim thay chuc vu nao !'], 200);
        }
        $chucVu->delete();
        $lstChucVu = ChucVu::all();
        $response =
            [
                'message' => 'xoa chuc vu thanh cong !',
                'chucvu' => $lstChucVu
            ];
        return response()->json($response, 200);
    }
}