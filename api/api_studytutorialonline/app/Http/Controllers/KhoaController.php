<?php

namespace App\Http\Controllers;

use App\Models\Khoa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\Console\Input\Input;

class KhoaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $lstKhoa = Khoa::all();
        $response = [
            'khoa' => $lstKhoa
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
        $input['ten_khoa'] = $request->input('ten_khoa');
        $input['trang_thai'] = 1;
        $validator = Validator::make($input, [
            'ten_khoa' => ['required', 'max:255', 'string'],
            'trang_thai' => ['required', 'max:255', 'integer'],
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        $khoa = Khoa::create($input);
        $response = [
            'message' => 'them thanh cong !',
            'khoa' => $khoa
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
        $khoa = Khoa::find($id);
        if (empty($khoa)) {
            return response()->json(['message' => 'khong tim thay khoa nao !'], 404);
        }
        $response = [
            'khoa' => $khoa
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
        $khoa = Khoa::find($id);
        if (empty($khoa)) {
            return response()->json(['message' => 'khong tim thay khoa nao !'], 404);
        }
        $khoa->fill([
            'ten_khoa' => $request->input('ten_khoa'),
            'trang_thai' => $request->input('trang_thai'),
        ]);
        $khoa->save();
        $response = [
            'message' => 'chinh sua thanh cong !',
            'khoa' => $khoa
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
        $khoa = Khoa::find($id);
        if (empty($khoa)) {
            return response()->json(['message' => 'khong tim thay khoa nao !'], 404);
        }
        $khoa->delete();
        $lstKhoa = Khoa::all();
        $response = [
            'message' => 'xoa thanh cong !',
            'khoa' => $lstKhoa
        ];
        return response()->json($response, 200);
    }
}