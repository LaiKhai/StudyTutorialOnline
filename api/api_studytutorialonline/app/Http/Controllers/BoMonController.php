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
        foreach ($lstBoMon as $item) {
            $item->khoa;
        }
        $response = [
            'status' => 'true',
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
                $response['status'] = 'false';
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        $boMon = BoMon::create($input);
        $boMon->khoa;
        $lophocphan = BoMon::join('lop_hoc_phans', 'lop_hoc_phans.id_bo_mon', '=', 'bo_mons.id')
            ->where('lop_hoc_phans.id_bo_mon', $boMon->lophocphan)->get();
        $response = [
            'status' => 'true',
            'message' => 'them thanh cong bo mon !',
            'bomon' => $boMon,
            'lophocphan' => $lophocphan
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
            return response()->json([
                'status' => 'false',
                'message' => 'khong tim thay bo mon nao !'
            ], 404);
        }
        $boMon->khoa;
        $lophocphan = BoMon::join('lop_hoc_phans', 'lop_hoc_phans.id_bo_mon', '=', 'bo_mons.id')
            ->join('lops', 'lop_hoc_phans.id_lop', '=', 'lops.id')
            ->where('bo_mons.id', $id)
            ->select('lop_hoc_phans.*', 'bo_mons.*', 'lops.*')->get();
        $response = [
            'status' => 'true',
            'bomon' => $boMon,
            'lophocphan' => $lophocphan
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
            return response()->json([
                'status' => 'false',
                'message' => 'khong tim thay bo mon nao !'
            ], 404);
        }
        $boMon->fill([
            'id_khoa' => $request->input('id_khoa'),
            'ten_mon_hoc' => $request->input('ten_mon_hoc'),
            'loai_mon_hoc' => $request->input('loai_mon_hoc'),
            'trang_thai' => $request->input('trang_thai'),
        ]);
        $boMon->save();
        $boMon->khoa;
        $lophocphan = BoMon::join('lop_hoc_phans', 'lop_hoc_phans.id_bo_mon', '=', 'bo_mons.id')
            ->where('lop_hoc_phans.id_bo_mon', $boMon->lophocphan)->get();
        $response = [
            'status' => 'true',
            'message' => 'chinh sua thanh cong !',
            'bomon' => $boMon,
            'lophocphan' => $lophocphan
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
            return response()->json([
                'status' => 'false',
                'message' => 'khong tim thay bo mon nao !'
            ], 404);
        }
        $boMon->delete();
        $lstBoMon = BoMon::all();
        foreach ($lstBoMon as $item) {
            $item->khoa;
            $lophocphan = BoMon::join('lop_hoc_phans', 'lop_hoc_phans.id_bo_mon', '=', 'bo_mons.id')
                ->where('lop_hoc_phans.id_bo_mon', $item->lophocphan)->get();
        }

        $response = [
            'status' => 'true',
            'message' => 'xoa thanh cong !',
            'bomon' => $lstBoMon,
            'lophoaphan' => $lophocphan
        ];
        return response()->json($response, 200);
    }
}