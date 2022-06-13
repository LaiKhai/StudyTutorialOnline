<?php

namespace App\Http\Controllers;

use App\Models\FileExcel;
use App\Http\Requests\StoreFileExcelRequest;
use App\Http\Requests\UpdateFileExcelRequest;

class FileExcelController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
     * @param  \App\Http\Requests\StoreFileExcelRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreFileExcelRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\FileExcel  $fileExcel
     * @return \Illuminate\Http\Response
     */
    public function show(FileExcel $fileExcel)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\FileExcel  $fileExcel
     * @return \Illuminate\Http\Response
     */
    public function edit(FileExcel $fileExcel)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateFileExcelRequest  $request
     * @param  \App\Models\FileExcel  $fileExcel
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateFileExcelRequest $request, FileExcel $fileExcel)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\FileExcel  $fileExcel
     * @return \Illuminate\Http\Response
     */
    public function destroy(FileExcel $fileExcel)
    {
        //
    }
}
