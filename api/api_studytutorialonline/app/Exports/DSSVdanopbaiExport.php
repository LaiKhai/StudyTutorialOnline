<?php

namespace App\Exports;

use App\Models\CTBaiKiemTra;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithCustomStartCell;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\Exportable;

class DSSVdanopbaiExport implements
    FromQuery,
    WithHeadings,
    WithCustomStartCell,
    WithMapping,
    WithColumnFormatting,
    ShouldAutoSize,
    WithEvents
{
    use Exportable;

    public function __construct(int $idbkt, int $idlop)
    {
        $this->idbkt = $idbkt;
        $this->idlop = $idlop;
    }

    public function query()
    {
        $data = CTBaiKiemTra::query()->join('sinh_viens', 'ct_bai_kiem_tras.id_sinh_vien', '=', 'sinh_viens.id')
            ->join('lops', 'sinh_viens.id_lop', '=', 'lops.id')
            ->where([['ct_bai_kiem_tras.id_bai_kiem_tra', $this->idbkt], ['sinh_viens.id_lop', $this->idlop], ['ct_bai_kiem_tras.trang_thai', '1']])
            ->orWhere([['ct_bai_kiem_tras.id_bai_kiem_tra', $this->idbkt], ['sinh_viens.id_lop', $this->idlop], ['ct_bai_kiem_tras.trang_thai', '2']])
            ->select('sinh_viens.ma_so', 'sinh_viens.ho_ten', 'lops.ten_lop', 'ct_bai_kiem_tras.trang_thai as trangthaiCTBKT')
            ->groupBy('sinh_viens.ma_so', 'sinh_viens.ho_ten', 'lops.ten_lop', 'ct_bai_kiem_tras.trang_thai');

        return $data;
    }

    public function map($data): array
    {
        return [
            $data->ma_so,
            $data->ho_ten,
            $data->ten_lop,

        ];
    }

    public function startCell(): string
    {
        return 'A1';
    }

    public function columnFormats(): array
    {
        return [
            'D' => NumberFormat::FORMAT_NUMBER_0,
        ];
    }


    public function headings(): array
    {
        return [
            ['Danh sách điểm sinh viên'],
            [
                'MSSV',
                'Họ Tên',
                'Lớp',
                'Điểm'
            ]
        ];
    }

    /**
     * @return array
     */
    public function registerEvents(): array
    {
        return [];
    }
}