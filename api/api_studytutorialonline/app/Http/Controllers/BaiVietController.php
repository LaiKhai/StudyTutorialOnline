<?php

namespace App\Http\Controllers;

use App\Models\BaiViet;
use App\Models\CheckFile;
use App\Models\File;
use App\Models\SinhVien;
use App\Models\GiangVien;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;


class BaiVietController extends Controller
{
    public function FixImg(SinhVien $sinhVien)
    {
        if (Storage::disk('public')->exists($sinhVien->avt)) {
            $sinhVien->avt = Storage::url($sinhVien->avt);
        } else {
            $sinhVien->avt = '/assets/images/no_image.png';
        }
    }
    public function FixImgGV(GiangVien $giangVien)
    {
        if (Storage::disk('public')->exists($giangVien->avt)) {
            $giangVien->avt = Storage::url($giangVien->avt);
        } else {
            $giangVien->avt = '/assets/images/no_image.png';
        }
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $lstBaiViet = BaiViet::all();

        foreach ($lstBaiViet as $item) {
            $item->lophocphan;
            $item->loaibaiviet;
            $item->checkfile;
            $item->sinhvien;
            $item->giangvien;
        }
        return response()->json([
            'baiviet' => $lstBaiViet,
        ], 200);
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
    public function store(Request  $request)
    {
        $input['id_lop_hoc_phan'] = $request->input('id_lop_hoc_phan');
        $input['id_loai_bai_viet'] = $request->input('id_loai_bai_viet');
        $input['id_sinh_vien'] = $request->input('id_sinh_vien');
        $input['id_giang_vien'] = $request->input('id_giang_vien');
        $input['noi_dung'] = $request->input('noi_dung');
        $input['trang_thai'] = 1;
        $validator = Validator::make($input, [
            'id_lop_hoc_phan' => ['required', 'max:255', 'integer'],
            'id_loai_bai_viet' => ['required', 'max:255', 'integer'],
            'trang_thai' => ['required', 'max:255', 'integer']
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        $baiViet = BaiViet::create($input);
        $inputcheckfile['id_bai_viet'] = $baiViet->id;
        $inputcheckfile['trang_thai'] = 1;
        $inputfile['trang_thai'] = 1;
        $files = $request->file('file');
        if ($request->hasFile('file')) {
            foreach ($files as $itemFile) {
                $path = $itemFile->store('assets/files/' . $itemFile->getClientOriginalName(), 'public');
                $inputfile['noi_dung'] = $path;
                $inputfile['loai_file'] = $itemFile->extension();
                $inputfile['ten_file'] = $itemFile->getClientOriginalName();
                $itemFile2 = File::create($inputfile);
                $inputcheckfile['id_file'] = $itemFile2->id;
                CheckFile::create($inputcheckfile);
            }
        }


        $checkfile = CheckFile::join('bai_viets', 'check_files.id_bai_viet', '=', 'bai_viets.id')
            ->join('files', 'check_files.id_file', '=', 'files.id')
            ->where('check_files.id_bai_viet', $baiViet->id)
            ->select('files.*')
            ->get();
        $baiViet->lophocphan;
        $baiViet->loaibaiviet;

        if ($baiViet->sinhvien != null) {
            $this->FixImg($baiViet->sinhvien);
        } else if ($baiViet->giangvien != null) {
            $this->FixImgGV($baiViet->giangvien);
        }
        $response = [
            'message' => 'them thanh cong !',
            'baiviet' => $baiViet,
            'file' => $checkfile
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
        $baiViet = BaiViet::find($id);
        if (empty($baiViet)) {
            return response()->json(['message' => 'khong tim thay bai viet !'], 404);
        }
        $checkfile = CheckFile::join('bai_viets', 'check_files.id_bai_viet', '=', 'bai_viets.id')
            ->join('files', 'check_files.id_file', '=', 'files.id')
            ->where('check_files.id_bai_viet', $id)
            ->select('files.*')
            ->get();
        $baiViet->lophocphan;
        $baiViet->loaibaiviet;
        if ($baiViet->sinhvien != null) {
            $this->FixImg($baiViet->sinhvien);
        } else if ($baiViet->giangvien != null) {
            $this->FixImgGV($baiViet->giangvien);
        }
        $response = [
            'baiviet' => $baiViet,
            'file' => $checkfile
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
        $baiViet = BaiViet::find($id);
        if (empty($baiViet)) {
            return response()->json(['message' => 'khong tim thay bai viet !'], 404);
        }
        $baiViet->fill([
            'id_lop_hoc_phan' => $request->input('id_lop_hoc_phan'),
            'id_loai_bai_viet' => $request->input('id_loai_bai_viet'),
            'id_sinh_vien' => $request->input('id_sinh_vien'),
            'id_giang_vien' => $request->input('id_giang_vien'),
            'noi_dung' => $request->input('noi_dung'),
            'trang_thai' => $request->input('trang_thai'),
        ]);
        $baiViet->save();
        $baiViet->lophocphan;
        $baiViet->loaibaiviet;
        $this->FixImg($baiViet->sinhvien);
        $this->FixImgGV($baiViet->giangvien);
        $response = [
            'message' => 'chinh sua thanh cong !',
            'baiviet' => $baiViet
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
        $baiViet = BaiViet::find($id);
        if (empty($baiViet)) {
            return response()->json(['message' => 'khong tim thay bai viet !']);
        }
        $baiViet->delete();
        $lstBaiViet = BaiViet::all();
        foreach ($lstBaiViet as $item) {
            $item->lophocphan;
            $item->loaibaiviet;
            $item->checkfile;
            $item->sinhvien;
            $item->giangvien;
        }
        $response = [
            'message' => 'xoa thanh cong !',
            'baiviet' => $lstBaiViet
        ];
        return response()->json($response, 200);
    }
}