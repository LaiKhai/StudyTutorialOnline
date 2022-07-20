<?php

namespace App\Http\Controllers;

use App\Models\CheckFile;
use App\Models\File;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\DB;
use App\Models\TraLoi_ThongBao;

class TraLoi_ThongBaoController extends Controller
{
    public function store(Request $request)
    {
        $input['id_sinh_vien'] = $request->input('id_sinh_vien');
        $input['id_bai_viet'] = $request->input('id_bai_viet');
        $input['cau_tra_loi'] = $request->input('cau_tra_loi');
        $trangthai = 1;
        $validator = Validator::make($input, [
            'id_sinh_vien' => ['required', 'max:255', 'integer'],
            'id_bai_viet' => ['required', 'max:255', 'integer'],
            'cau_tra_loi' => ['required', 'max:255', 'string'],
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
                $response['status'] = false;
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        try {
            $inputfile['trang_thai'] = 1;
            $files = $request->file('file');
            if ($request->hasFile('file')) {
                $path = $files->store('assets/files/' . $files->getClientOriginalName(), 'public');
                $inputfile['noi_dung'] = $path;
                $inputfile['loai_file'] = $files->extension();
                $inputfile['ten_file'] = $files->getClientOriginalName();
                $itemFile2 = File::create($inputfile);
            }
            $input['id_file'] = $itemFile2->id;
            DB::select('call tao_traloi_thongbao(?,?,?,?,?)', [
                $input['id_sinh_vien'],
                $input['id_bai_viet'],
                $input['id_file'],
                $input['cau_tra_loi'],
                $trangthai
            ]);
            $response = [
                'status' => true
            ];
            return response()->json($response, 200);
        } catch (ModelNotFoundException $e) {
            $response = [
                'status' => false
            ];
            return response()->json($response, 404);
        }
    }

    public function getSinhVien(Request $request)
    {
        $sv = TraLoi_ThongBao::join('files', 'traloi_thongbao.id_file', '=', 'files.id')
            ->join('sinh_viens', 'traloi_thongbao.id_sinh_vien', '=', 'sinh_viens.id')
            ->join('bai_viets', 'traloi_thongbao.id_bai_viet', '=', 'bai_viets.id')
            ->where([['traloi_thongbao.id_sinh_vien', $request->input('id_sinh_vien')], ['traloi_thongbao.id_bai_viet', $request->input('id_bai_viet')]])
            ->select(
                'sinh_viens.*',
                'traloi_thongbao.id_sinh_vien as idSVTraLoiThongBao',
                'traloi_thongbao.id_bai_viet',
                'traloi_thongbao.id_file',
                'traloi_thongbao.cau_tra_loi',
                'traloi_thongbao.trang_thai',
                'bai_viets.id as idbaiviet',
                'bai_viets.id_lop_hoc_phan',
                'bai_viets.id_loai_bai_viet',
                'bai_viets.id_giang_vien',
                'bai_viets.noi_dung',
                'files.id as IDFile',
                'files.noi_dung',
                'files.ten_file',
                'files.loai_file',
                'files.trang_thai',
            )
            ->get();
        if ($sv != null) {
            $response = [
                'status' => true,
                'data' => $sv
            ];
            return response()->json($response, 200);
        } else {
            $response = [
                'status' => false
            ];
            return response()->json($response, 404);
        }
    }

    public function getfile(Request $request)
    {
        $file = TraLoi_ThongBao::join('files', 'traloi_thongbao.id_file', '=', 'files.id')
            ->join('sinh_viens', 'traloi_thongbao.id_sinh_vien', '=', 'sinh_viens.id')
            ->where([
                ['traloi_thongbao.id_sinh_vien', $request->input('id_sinh_vien')],
                ['traloi_thongbao.id_bai_viet', $request->input('id_bai_viet')]
            ])
            ->select('files.*', 'traloi_thongbao.id_sinh_vien as idSVTraLoiThongBao', 'sinh_viens.ho_ten')
            ->get();
        if ($file != null) {
            $response = [
                'status' => true,
                'data' => $file
            ];
            return response()->json($response, 200);
        } else {
            $response = [
                'status' => false
            ];
            return response()->json($response, 404);
        }
    }

    public function getdstraloi(Request $request)
    {
        $idbaiviet = $request->input('id_bai_viet');
        $dstraloi = TraLoi_ThongBao::join('bai_viets', 'traloi_thongbao.id_bai_viet', '=', 'bai_viets.id')
            ->join('sinh_viens', 'traloi_thongbao.id_sinh_vien', '=', 'sinh_viens.id')
            ->join('lops', 'sinh_viens.id_lop', '=', 'lops.id')
            ->join('files', 'traloi_thongbao.id_file', '=', 'files.id')
            ->where([['traloi_thongbao.id_bai_viet', $idbaiviet], ['bai_viets.id_loai_bai_viet', 2]])
            ->select('traloi_thongbao.id_bai_viet', 'traloi_thongbao.cau_tra_loi', 'sinh_viens.*', 'lops.ten_lop', 'files.id as idFile', 'files.noi_dung', 'files.ten_file', 'files.loai_file', 'bai_viets.id_loai_bai_viet')
            ->get();

        $response = [
            'status' => true,
            'data' => $dstraloi
        ];
        return response()->json($response, 200);
    }

    public function getchitiettraloi(Request $request)
    {
        $idbaiviet = $request->input('id_bai_viet');
        $idtraloi = $request->input('id_tra_loi');

        $cttraloi = TraLoi_ThongBao::join('bai_viets', 'traloi_thongbao.id_bai_viet', '=', 'bai_viets.id')
            ->join('sinh_viens', 'traloi_thongbao.id_sinh_vien', '=', 'sinh_viens.id')
            ->join('lops', 'sinh_viens.id_lop', '=', 'lops.id')
            ->join('files', 'traloi_thongbao.id_file', '=', 'files.id')
            ->where([['traloi_thongbao.id_bai_viet', $idbaiviet], ['traloi_thongbao.id', $idtraloi], ['bai_viets.id_loai_bai_viet', 2]])
            ->select('traloi_thongbao.id_bai_viet', 'traloi_thongbao.cau_tra_loi', 'sinh_viens.*', 'lops.ten_lop', 'files.id as idFile', 'files.noi_dung', 'files.ten_file', 'files.loai_file', 'bai_viets.id_loai_bai_viet')
            ->get();

        $response = [
            'status' => true,
            'data' => $cttraloi
        ];
        return response()->json($response, 200);
    }
}