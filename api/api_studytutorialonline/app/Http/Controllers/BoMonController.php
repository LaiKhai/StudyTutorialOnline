<?php

namespace App\Http\Controllers;

use App\Models\BoMon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class BoMonController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $lstBoMon = BoMon::all();
        if (empty($lstBoMon)) {
            return response()->json(['message' => 'khong co bo mon nao !'], 404);
        }
        $response = [
            'bomon' => $lstBoMon
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
        $input['id_khoa'] = $request->input('id_khoa');
        $input['ten_mon_hoc'] = $request->input('ten_mon_hoc');
        $input['loai_mon_hoc'] = $request->input('loai_mon_hoc');
        $input['trang_thai'] = 1;
        $validator = Validator::make($input, [
            'id_khoa' => ['required', 'max:255', 'integer'],
            'ten_mon_hoc' => ['required', 'max:255', 'string'],
            'loai_mon_hoc' => ['required', 'max:255', 'integer'],
            'trang_thai' => ['required', 'max:255', 'integer'],
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        $boMon = BoMon::create($input);
        $response = [
            'message' => 'them thanh cong bo mon !',
            'bomon' => $boMon
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
        $boMon = BoMon::find($id);
        if (empty($boMon)) {
            return response()->json(['message' => 'khong tim thay bo mon nao !'], 404);
        }
        $response = [
            'bomon' => $boMon
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
        $boMon = BoMon::find($id);
        if (empty($boMon)) {
            return response()->json(['message' => 'khong tim thay bo mon nao !'], 404);
        }
        $boMon->fill([
            'id_khoa' => $request->input('id_khoa'),
            'ten_mon_hoc' => $request->input('ten_mon_hoc'),
            'loai_mon_hoc' => $request->input('loai_mon_hoc'),
            'trang_thai' => $request->input('trang_thai'),
        ]);
        $boMon->save();
        $response = [
            'message' => 'chinh sua thanh cong !',
            'bomon' => $boMon
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
        $boMon = BoMon::find($id);
        if (empty($boMon)) {
            return response()->json(['message' => 'khong tim thay bo mon nao !'], 404);
        }
        $boMon->delete();
        $lstBoMon = BoMon::all();
        $response = [
            'message' => 'xoa thanh cong !',
            'bomon' => $lstBoMon
        ];
        return response()->json($response, 200);
    }
}