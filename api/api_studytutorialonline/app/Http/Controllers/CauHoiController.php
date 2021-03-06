<?php

namespace App\Http\Controllers;

use App\Models\CauHoi;
use App\Models\CheckFile;
use App\Models\File;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CauHoiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cauHoi = CauHoi::all();
        foreach ($cauHoi as $item) {
            $item->baikiemtra;
            $item->file;
        }
        $response = [
            'status' => true,
            'cauhoi' => $cauHoi
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
        // foreach(json_decode($request) as $item){

        // }
        $input['id_bai_kiem_tra'] = $request->input('id_bai_kiem_tra');
        $input['id_file'] = $request->input('id_file');
        $input['de_bai'] = $request->input('de_bai');
        $input['dap_an_1'] = $request->input('dap_an_1');
        $input['dap_an_2'] = $request->input('dap_an_2');
        $input['dap_an_3'] = $request->input('dap_an_3');
        $input['dap_an_4'] = $request->input('dap_an_4');
        $input['dap_an_dung'] = $request->input('dap_an_dung');
        $input['diem'] = $request->input('diem');
        $input['trang_thai'] = $request->input('trang_thai');
        $validator = Validator::make($input, [
            'id_bai_kiem_tra' => ['required', 'max:255', 'integer'],
            'de_bai' => ['required', 'max:255', 'string'],
            'dap_an_1' => ['required'],
            'dap_an_2' => ['required'],
            'dap_an_3' => ['required'],
            'dap_an_4' => ['required'],
            'dap_an_dung' => ['required'],
            'diem' => ['required'],
            'trang_thai' => ['required', 'integer'],
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
                $response['status'] = false;
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        $cauHoi = CauHoi::created($input);
        $response = [
            'status' => true,
            'message' => 'them thanh cong !',
            'cauhoi' => $cauHoi
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
        $cauHoi = CauHoi::find($id);
        if (empty($cauHoi)) {
            return response()->json([
                'status' => false,
                'message' => 'Khong tim thay cau hoi nao !'
            ], 404);
        }
        $cauHoi->baikiemtra;
        $cauHoi->file;
        $response = [
            'status' => true,
            'cauhoi' => $cauHoi,
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
        $cauHoi = CauHoi::find($id);
        if (empty($cauHoi)) {
            return response()->json([
                'status' => false,
                'message' => ' Khong tim thay cau hoi nao !', 404
            ]);
        }
        $cauHoi->fill([
            'id_sinh_vien' => $request->input('id_sinh_vien'),
            'id_bai_tap' => $request->input('id_bai_tap'),
            'id_lop_hoc_phan' => $request->input('id_lop_hoc_phan'),
            'tg_nop_bai' => $request->input('tg_nop_bai'),
            'trang_thai' => $request->input('trang_thai')
        ]);
        $cauHoi->save();
        $response = [
            'status' => true,
            'message' => 'chinh sua thanh cong !',
            'cauhoi' => $cauHoi
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
        $cauHoi = CauHoi::find($id);
        if (empty($baiTap)) {
            return response()->json([
                'status' => false,
                'message' => ' Khong tim thay cau hoi nao !', 404
            ]);
        }
        $cauHoi->delete();
        $lstCauHoi = CauHoi::all();
        $response = [
            'status' => true,
            'message' => 'xoa thanh cong !',
            'cauhoi' => $lstCauHoi
        ];
        return response()->json($response, 200);
    }

    public function getidFile(Request $request)
    {
        $files = $request->file('file');
        $inputfile['trang_thai'] = 1;
        if ($request->hasFile('file')) {
            $path = $files->store('assets/files/' . $files->getClientOriginalName(), 'public');
            $inputfile['noi_dung'] = $path;
            $inputfile['loai_file'] = $files->extension();
            $inputfile['ten_file'] = $files->getClientOriginalName();
            $itemFile2 = File::create($inputfile);
        }
        $response = [
            'status' => true,
            'file' => $itemFile2->id
        ];
        return response()->json($response, 200);
    }
}