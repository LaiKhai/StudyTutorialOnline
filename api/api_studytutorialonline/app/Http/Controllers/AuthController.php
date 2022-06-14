<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\SinhVien;
use App\Models\GiangVien;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    //-----------------------------------------------------------//
    //                           API Đăng kí Sinh Viên
    //----------------------------------------------------------//
    public function dangKySinhVien(Request $request)
    {
        $input['id_lop'] = $request->input('id_lop');
        $input['email'] = $request->input('email');
        $input['password'] = Hash::make($request->input('password'));
        $input['ho_ten'] = $request->input('ho_ten');
        $input['mssv'] = $request->input('mssv');
        $input['sdt'] = $request->input('sdt');
        $input['ngay_sinh'] = $request->input('ngay_sinh');
        $input['trang_thai'] = 1;
        $validator = Validator::make($input, [
            'email' => ['required', 'max:255', 'email:rfc,dns', 'unique:sinh_viens,email', 'regex:/(.*)@caothang\.edu.vn/i'],
            'password' => 'required|max:255',
            'ho_ten' => 'required|max:255|string',
            'mssv' => 'required|max:255|string',
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
        $input['msgv'] = $request->input('msgv');
        $input['sdt'] = $request->input('sdt');
        $input['ngay_sinh'] = $request->input('ngay_sinh');
        $input['id_chuc_vu'] = $request->input('id_chuc_vu');
        $input['trang_thai'] = 1;
        $validator = Validator::make($input, [
            'email' => ['required', 'max:255', 'email:rfc,dns', 'unique:sinh_viens,email', 'regex:/(.*)@caothang\.edu.vn/i'],
            'password' => 'required|max:255',
            'ho_ten' => 'required|max:255|string',
            'msgv' => 'required|max:255|string',
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
        $response = [
            'message' => 'Dang ky giang vien thanh cong !',
            'giangvien' => $giangVien
        ];

        return response()->json($response, 200);
    }
    //-----------------------------------------------------------//
    //                           API Đăng nhập
    //----------------------------------------------------------//

    public function dangNhapSinhVien(Request $request)
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

        if (!$sinhVien || !Hash::check($input['password'], $sinhVien->password)) {
            return response(['message' => 'tai khoan hoac mat khau sai'], 401);
        } else {
            $token = $sinhVien->createToken('TokenSinhVien')->plainTextToken;
            $response =
                [
                    'message' => 'Dang Nhap Thanh Cong !',
                    'sinhvien' => $sinhVien,
                    'token' => $token
                ];
            return response()->json($response, 200);
        }
    }

    public function dangNhapGiangVien(Request $request)
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