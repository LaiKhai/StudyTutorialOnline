<?php

namespace App\Http\Controllers;

use App\Models\CheckFile;
use App\Http\Requests\StoreCheckFileRequest;
use App\Http\Requests\UpdateCheckFileRequest;

class CheckFileController extends Controller
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
     * @param  \App\Http\Requests\StoreCheckFileRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCheckFileRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CheckFile  $checkFile
     * @return \Illuminate\Http\Response
     */
    public function show(CheckFile $checkFile)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\CheckFile  $checkFile
     * @return \Illuminate\Http\Response
     */
    public function edit(CheckFile $checkFile)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateCheckFileRequest  $request
     * @param  \App\Models\CheckFile  $checkFile
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCheckFileRequest $request, CheckFile $checkFile)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CheckFile  $checkFile
     * @return \Illuminate\Http\Response
     */
    public function destroy(CheckFile $checkFile)
    {
        //
    }
}
