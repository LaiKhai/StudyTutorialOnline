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
        if (Storage::disk('public')->exists($file->noi_dung)) {
            $file->noi_dung = Storage::url($file->noi_dung);
        } else {
            $file->noi_dung = 'null';
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
            'status' => true,
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
        $input['trang_thai'] = 1;

        $file = File::create($input);
        if ($request->hasFile('noi_dung')) {
            $file['noi_dung'] = $request->file('noi_dung')->store('assets/files/' . $file->id, 'public');
            $file['loai_file'] = $request->file('noi_dung')->extension();
            $file['ten_file'] = $request->file('noi_dung')->getClientOriginalName();
        }
        $file->save();
        $response = [
            'status' => true,
            'message' => 'them file thanh cong !',
            'file' => $file
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
        $file = File::find($id);
        $this->FixFile($file);
        $response = [
            'status' => true,
            'file' => $file
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
        $file = File::find($id);
        if (empty($file)) {
            return response()->json([
                'status' => false,
                'messsage' => 'khong tim thay file nao !'
            ], 404);
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
            'status' => true,
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
            $response = [
                'status' => false,
                'message' => 'khong tim thay file nao !'
            ];
            return response()->json($response, 404);
        }
        $file->delete();
        $lstFile = File::all();
        $response = [
            'status' => true,
            'message' => 'xoa thanh cong !',
            'file' => $lstFile
        ];
        return response()->json($response, 200);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function dowloadFile($filename)
    {

        // Check if file exists in app/storage/file folder
        $file_path = storage_path() . '/assets/files/appstore.png/' . $filename;
        if (file_exists($file_path)) {
            // Send Download
            return response()->download($file_path, $filename, [
                'Content-Length: ' . filesize($file_path)
            ]);
        } else {
            // Error
            exit('Requested file does not exist on our server!');
        }
    }
}