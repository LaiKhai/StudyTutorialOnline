<?php

namespace App\Http\Controllers;

use App\Models\GiangVien;
use App\Models\Lop;
use App\Models\LopHocPhan;
use App\Models\SinhVien;
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
        $lstLop = Lop::all()->where('trang_thai', '>', "0");
        foreach ($lstLop as $item) {
            $item->giangvien;
        }
        $response = [
            'status' => true,
            'lop' => $lstLop
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
        $input['id_giangvien'] = $request->input('id_giangvien');
        $input['id_khoa'] = $request->input('id_khoa');
        $input['ten_lop'] = $request->input('ten_lop');
        $input['nien_khoa'] = $request->input('nien_khoa');
        $input['trang_thai'] = 1;

        $validator = Validator::make($input, [
            'id_giangvien' => 'required|max:255|string',
            'id_khoa' => 'required|max:255|string',
            'ten_lop' => 'required|max:255|string|unique:lops,ten_lop',
            'nien_khoa' => 'required|max:255|string'
        ]);

        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $respone['data'] = $validator->errors();
                $respone['status'] = false;
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }

        $lop = Lop::create($input);
        $respone = [
            'status' => true,
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
        $lop->giangvien;
        $lop->sinhvien;
        $sinhvien = Lop::find($id)->sinhvien;
        // $lop = Lop::join("giang_viens", "lops.id_giangvien", "=", "giang_viens.id")
        //     ->where("lops.id", $id)
        //     ->select("lops.*", "giang_viens.ho_ten as ten_giang_vien")
        //     ->get();
        $respone = [
            'status' => true,
            'lop' => $lop,
            'user' => $sinhvien,
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
            return response()->json([
                'status' => false,
                'message' => 'khong tim thay lop nao !'
            ], 404);
        }
        $lop->fill([
            'id_giangvien' => $request->input('id_giangvien'),
            'id_khoa' => $request->input('id_khoa'),
            'ten_lop' => $request->input('ten_lop'),
            'nien_khoa' => $request->input('nien_khoa'),
            'trang_thai' => $request->input('trang_thai'),
        ]);
        $lop->save();
        $respone = [
            'status' => true,
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
            return response()->json([
                'status' => false,
                'message' => 'khong tim thay lop nao !'
            ], 404);
        } else if (!empty($sinhVien)) {
            return response()->json([
                'status' => false,
                'message' => 'Lop dang co sinh vien nen khong the xoa !'
            ], 404);
        }
        $lop->delete();
        $lstLop = Lop::all();
        $respone = [
            'status' => true,
            'message' => 'xoa thanh cong !',
            'lop' => $lstLop,
        ];
        return response()->json($respone, 200);
    }

    /**
     * Lay danh sach lop theo id sinh vien
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function LstLopWithIdSV($id)
    {
        $sinhVien = SinhVien::find($id);
        $lop = SinhVien::find($id)->lop;
        $respone = [
            'status' => true,
            'user' => $sinhVien,
            'lstlop' => $lop
        ];
        return response()->json($respone, 200);
    }

    public function lopwithKhoa(Request $request)
    {
        $khoa = $request->input('khoa');
        $lop = Lop::join('khoas', 'lops.id_khoa', '=', 'khoas.id')
            ->join('giang_viens', 'lops.id_giangvien', '=', 'giang_viens.id')
            ->where('khoas.ten_khoa', 'like', '%' . $khoa . '%')
            ->where('lops.trang_thai', '>', "0")
            ->select('lops.*', 'giang_viens.ho_ten')->get();
        if (empty($lop)) {
            return response()->json([
                'status' => false,
                'message' => 'khong tim thay lop nao !'
            ], 404);
        }
        $response = [
            'lop' => $lop
        ];
        return response()->json($response, 200);
    }

    public function search(Request $request)
    {
        $searchInput = $request->input('search');
        $lop = Lop::join('giang_viens', 'lops.id_giangvien', '=', 'giang_viens.id')
            ->where(
                'ten_lop',
                'like',
                '%' . $searchInput . '%'

            )
            ->where('lops.trang_thai', '>', "0")
            ->orWhere('nien_khoa', 'like', '%' . $searchInput . '%')
            ->orWhere('giang_viens.ho_ten', 'like', '%' . $searchInput . '%')
            ->select('lops.*')
            ->get();
        foreach ($lop as $item) {
            $item->giangvien;
        }
        $response = [
            'data' => $lop
        ];
        return response()->json($response, 200);
    }
}