<?php

namespace App\Http\Controllers;

use App\Models\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class FileController extends Controller
{
    public function FixFile(File $file)
    {
        if (Storage::disk('public')->exists($file->avt)) {
            $file->noi_dung = Storage::url($file->noi_dung);
        } else {
            $file->noi_dung = null;
        }
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $file = File::all();
        foreach ($file as $item) {
            $this->FixFile($item);
        }
        $response = [
            'file' => $file,
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
        $input['loai_file'] = $request->input('loai_file');
        $input['trang_thai'] = $request->input('trang_thai');
        $validator = Validator::make($input, [
            'noi_dung' => ['required'],
            'trang_thai' => ['required', 'max:255', 'integer'],
        ]);
        if ($validator->fails()) {
            if (!empty($validator->errors())) {
                $response['data'] = $validator->errors();
            }
            $response['message'] = 'Vaidator Error';
            return response()->json($response, 404);
        }
        $file = File::create($input);
        if ($request->hasFile('noi_dung')) {
            $file['noi_dung'] = $request->file('noi_dung')->store('assets/files/' . $file['id'], 'public');
        }
        $file->save();
        $response = [
            'message' => 'them file thanh cong !',
            'file' => $file
        ];
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $file = File::find($id);
        $this->FixFile($file);
        return response()->json($file, 200);
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
        $file = File::find($id);
        if (empty($file)) {
            return response()->json(['messsage' => 'khong tim thay file nao !'], 404);
        }
        $file->fill([
            'loai_file' => $request->input('loai_file'),
            'trang_thai' => $request->input('trang_thai')
        ]);
        if ($request->hasFile('noi_dung')) {
            $file['noi_dung'] = $request->file('noi_dung')->store('assets/files/' . $file['id'], 'public');
        }
        $file->save();
        $response = [
            'message' => 'chinh sua thanh cong !',
            'file' => $file
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
        $file = File::find($id);
        if (empty($file)) {
            $response = ['message' => 'khong tim thay file nao !'];
            return response()->json($response, 404);
        }
        $file->delete();
        $lstFile = File::all();
        $response = [
            'message' => 'xoa thanh cong !',
            'file' => $lstFile
        ];
        return response()->json($response, 200);
    }
}