<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\SinhVien;
use App\Models\GiangVien;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    public function FixImgSV(SinhVien $sinhVien)
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
    //-----------------------------------------------------------//
    //                           API Đăng kí Sinh Viên
    //----------------------------------------------------------//
    public function dangKySinhVien(Request $request)
    {
        $input['id_lop'] = $request->input('id_lop');
        $input['email'] = $request->input('email');
        $input['password'] = Hash::make($request->input('password'));
        $input['ho_ten'] = $request->input('ho_ten');
        $input['ma_so'] = $request->input('ma_so');
        $input['sdt'] = $request->input('sdt');
        $input['ngay_sinh'] = $request->input('ngay_sinh');
        $input['trang_thai'] = 1;
        $validator = Validator::make($input, [
            'email' => ['required', 'max:255', 'email:rfc,dns', 'unique:sinh_viens,email', 'regex:/(.*)@caothang\.edu.vn/i'],
            'password' => 'required|max:255',
            'ho_ten' => 'required|max:255|string',
            'ma_so' => 'required|max:255|string',
            'sdt' => 'required|max:255|string',
            'ngay_sinh' => 'required|max:255',
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }

        $sinhVien = SinhVien::create($input);
        if ($request->hasFile('avt')) {
            $sinhVien['avt'] = $request->file('avt')->store('assets/images/avatar/' . $sinhVien['id'], 'public');
        }
        $sinhVien->save();
        $response = [
            'message' => 'Dang ky sinh vien thanh cong !',
            'sinhvien' => $sinhVien
        ];

        return response()->json($response, 200);
    }
    //-----------------------------------------------------------//
    //                API Đăng kí Giảng Viên
    //----------------------------------------------------------//
    public function dangKyGiangVien(Request $request)
    {
        $input['email'] = $request->input('email');
        $input['password'] = Hash::make($request->input('password'));
        $input['ho_ten'] = $request->input('ho_ten');
        $input['ma_so'] = $request->input('ma_so');
        $input['sdt'] = $request->input('sdt');
        $input['ngay_sinh'] = $request->input('ngay_sinh');
        $input['id_chuc_vu'] = $request->input('id_chuc_vu');
        $input['trang_thai'] = 1;
        $validator = Validator::make($input, [
            'email' => ['required', 'max:255', 'email:rfc,dns', 'unique:sinh_viens,email', 'regex:/(.*)@caothang\.edu.vn/i'],
            'password' => 'required|max:255',
            'ho_ten' => 'required|max:255|string',
            'ma_so' => 'required|max:255|string',
            'sdt' => 'required|max:255|string',
            'ngay_sinh' => 'required|max:255|date',
            'id_chuc_vu' => 'required|max:255|integer',
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }

        $giangVien = GiangVien::create($input);
        if ($request->hasFile('avt')) {
            $giangVien['avt'] = $request->file('avt')->store('assets/images/avatar/' . $giangVien['id'], 'public');
        }
        $giangVien->save();
        $response = [
            'message' => 'Dang ky giang vien thanh cong !',
            'giangvien' => $giangVien
        ];

        return response()->json($response, 200);
    }
    //-----------------------------------------------------------//
    //                           API Đăng nhập
    //----------------------------------------------------------//

    public function loginUser(Request $request)
    {
        $input['email'] = $request->input('email');
        $input['password'] = $request->input('password');
        $validator = Validator::make($input, [
            'email' => ['required', 'max:255', 'regex:/(.*)@caothang\.edu.vn/i'],
            'password' => 'required'
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        $sinhVien = SinhVien::where('email', $input['email'])->first();
        $giangVien = GiangVien::where('email', $input['email'])->first();

        if ($sinhVien == null && $giangVien == null) {
            $response = [
                'message' => 'tai khoan khong ton tai !'
            ];
            return response()->json($response, 404);
        } else if ($giangVien != null) {
            if (!$giangVien || !Hash::check($input['password'], $giangVien->password)) {
                return response(['message' => 'tai khoan hoac mat khau sai'], 401);
            } else {
                $this->FixImgGV($giangVien);
                $token = $giangVien->createToken('TokenSinhVien')->plainTextToken;
                $response =
                    [
                        'message' => 'Dang Nhap Thanh Cong !',
                        'user' => $giangVien,
                        'token' => $token
                    ];
                return response()->json($response, 200);
            }
        } else {
            if (!$sinhVien || !Hash::check($input['password'], $sinhVien->password)) {
                return response(['message' => 'tai khoan hoac mat khau sai'], 401);
            } else {
                $this->FixImgSV($sinhVien);
                $token = $sinhVien->createToken('TokenSinhVien')->plainTextToken;
                $response =
                    [
                        'message' => 'Dang Nhap Thanh Cong !',
                        'user' => $sinhVien,
                        'token' => $token
                    ];
                return response()->json($response, 200);
            }
        }
    }

    public function dangNhapAdmin(Request $request)
    {
        $input['email'] = $request->input('email');
        $input['password'] = $request->input('password');
        $validator = Validator::make($input, [
            'email' => ['required', 'max:255', 'regex:/(.*)@caothang\.edu.vn/i'],
            'password' => 'required'
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        $giangVien = GiangVien::where('email', $input['email'])->first();

        if (!$giangVien || !Hash::check($input['password'], $giangVien->password)) {
            return response(['message' => 'tai khoan hoac mat khau sai'], 401);
        } else if ($giangVien->id_chuc_vu != 1) {
            return response(['message' => 'khong phai tai khoan phong dao tao !'], 400);
        } else {
            $token = $giangVien->createToken('TokenGiangVien')->plainTextToken;
            $response =
                [
                    'message' => 'Dang Nhap Thanh Cong !',
                    'giangvien' => $giangVien,
                    'token' => $token
                ];
            return response()->json($response, 200);
        }
    }
}