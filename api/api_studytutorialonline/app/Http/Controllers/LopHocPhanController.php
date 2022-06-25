<?php

namespace App\Http\Controllers;

use App\Models\DS_GiangVien;
use App\Models\DS_SinhVien;
use App\Models\LopHocPhan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class LopHocPhanController extends Controller
{
    public function FixImg(LopHocPhan $lopHocPhan)
    {
        if (Storage::disk('public')->exists($lopHocPhan->avt)) {
            $lopHocPhan->avt = Storage::url($lopHocPhan->avt);
        } else {
            $lopHocPhan->avt = '/assets/images/lophocphan/no_image.png';
        }
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $lstLopHocPhan = LopHocPhan::all();
        foreach ($lstLopHocPhan as $item) {
            $item->bomon;
            $item->lop;
            $this->FixImg($item);
        }
        if (empty($lstLopHocPhan)) {
            return response()->json(['message' => 'chua co lop hoc phan nao'], 404);
        }
        $response = [
            'lophocphan' => $lstLopHocPhan,
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
        $input['id_bo_mon'] = $request->input('id_bo_mon');
        $input['id_lop'] = $request->input('id_lop');
        $input['trang_thai'] = $request->input('trang_thai');
        $validator = Validator::make($input, [
            'id_bo_mon' => ['required', 'max:255', 'integer'],
            'id_lop' => ['required', 'max:255', 'integer'],
            'trang_thai' => ['required', 'max:255', 'integer'],
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        $lopHocPhan = LopHocPhan::create($input);
        if ($request->hasFile('avt')) {
            $lopHocPhan['avt'] = $request->file('avt')
                ->store('assets/images/lophocphan/' . $lopHocPhan['id'], 'public');
        }
        $lopHocPhan->save();
        $lopHocPhan->bomon;
        $lopHocPhan->lop;
        $response = [
            'message' => 'them lop hoc phan thanh cong !',
            'lophocphan' => $lopHocPhan
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
        $lopHocPhan = LopHocPhan::find($id);
        if (empty($lopHocPhan)) {
            return response()->json(['message' => 'khong tim thay lop hoc phan nao !'], 404);
        }
        $lopHocPhan->lop;
        $lopHocPhan->baikiemtra;
        $lopHocPhan->bomon;
        $lopHocPhan->baitap;
        $dsgv = DS_GiangVien::join('lop_hoc_phans', 'ds_giang_viens.id_lop_hoc_phan', '=', 'lop_hoc_phans.id')
            ->join('giang_viens', 'ds_giang_viens.id_giang_vien', '=', 'giang_viens.id')
            ->where('lop_hoc_phans.id', $id)
            ->select('lop_hoc_phans.*', 'ds_giang_viens.*', 'giang_viens.*')->get();
        $dssv = DS_SinhVien::join('lop_hoc_phans', 'ds_sinh_viens.id_lop_hoc_phan', '=', 'lop_hoc_phans.id')
            ->join('sinh_viens', 'ds_sinh_viens.id_sinh_vien', '=', 'sinh_viens.id')
            ->where('lop_hoc_phans.id', $id)
            ->select('lop_hoc_phans.*', 'ds_sinh_viens.*', 'sinh_viens.*')->get();
        $response = [
            'lophocphan' => $lopHocPhan,
            'dssv' => $dssv,
            'dsgv' => $dsgv
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
        $lopHocPhan = LopHocPhan::find($id);
        if (empty($lopHocPhan)) {
            return response()->json(['message' => ' khong tim thay lop hoc phan nao !', 404]);
        }
        $lopHocPhan->fill([
            'id_bo_mon' => $request->input('id_bo_mon'),
            'id_lop' => $request->input('id_lop'),
            'trang_thai' => $request->input('trang_thai')
        ]);
        if ($request->hasFile('avt')) {
            $lopHocPhan['avt'] = $request->file('avt')
                ->store('assets/images/lophocphan/' . $lopHocPhan['id'], 'public');
        }
        $lopHocPhan->save();
        $lopHocPhan->bomon;
        $lopHocPhan->lop;
        $response = [
            'message' => 'chinh sua thanh cong !',
            'lophocphan' => $lopHocPhan
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
        $lopHocPhan = LopHocPhan::find($id);
        if (empty($lopHocPhan)) {
            return response()->json(['message' => ' khong tim thay lop hoc phan nao !', 404]);
        }
        $lopHocPhan->delete();
        $lstLopHocPhan = LopHocPhan::all();
        $response = [
            'message' => 'xoa thanh cong !',
            'lophocphan' => $lstLopHocPhan
        ];
        return response()->json($response, 200);
    }
}