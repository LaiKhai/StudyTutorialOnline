<?php

namespace App\Http\Controllers;

use App\Models\CauHoi;
use App\Http\Requests\StoreCauHoiRequest;
use App\Http\Requests\UpdateCauHoiRequest;

class CauHoiController extends Controller
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
     * @param  \App\Http\Requests\StoreCauHoiRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCauHoiRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CauHoi  $cauHoi
     * @return \Illuminate\Http\Response
     */
    public function show(CauHoi $cauHoi)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\CauHoi  $cauHoi
     * @return \Illuminate\Http\Response
     */
    public function edit(CauHoi $cauHoi)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateCauHoiRequest  $request
     * @param  \App\Models\CauHoi  $cauHoi
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCauHoiRequest $request, CauHoi $cauHoi)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CauHoi  $cauHoi
     * @return \Illuminate\Http\Response
     */
    public function destroy(CauHoi $cauHoi)
    {
        //
    }
}
