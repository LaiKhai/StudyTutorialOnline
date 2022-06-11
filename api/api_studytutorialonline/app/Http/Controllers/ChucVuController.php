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
        $chucvu = ChucVu::all();
        $response = [
            'chucvu' => $chucvu
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
     * @param  \App\Http\Requests\StoreChucVuRequest  $request
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
        $chucvu = ChucVu::find($id);
        $response = [
            'chucvu' => $chucvu
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
     * @param  \App\Http\Requests\UpdateChucVuRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
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