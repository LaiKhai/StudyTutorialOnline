<?php

namespace App\Exports;

use App\Models\TraLoi;
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

class DanhSachDiemExport implements
    FromQuery,
    WithHeadings,
    WithCustomStartCell,
    WithMapping,
    WithColumnFormatting,
    ShouldAutoSize,
    WithEvents
{
    use Exportable;

    public function __construct(int $idbkt, int $idlophp)
    {
        $this->idbkt = $idbkt;
        $this->idlophp = $idlophp;
    }

    public function query()
    {
        $traloi = TraLoi::query()->join('cau_hois', 'tra_lois.id_cau_hoi', '=', 'cau_hois.id')
            ->join('bai_kiem_tras', 'cau_hois.id_bai_kiem_tra', '=', 'bai_kiem_tras.id')
            ->join('ds_sinh_viens', 'tra_lois.id_sinh_vien', '=', 'ds_sinh_viens.id_sinh_vien')
            ->join('sinh_viens', 'ds_sinh_viens.id_sinh_vien', '=', 'sinh_viens.id')
            ->join('lops', 'sinh_viens.id_lop', '=', 'lops.id')
            ->join('lop_hoc_phans', 'ds_sinh_viens.id_lop_hoc_phan', '=', 'lop_hoc_phans.id')
            ->where([['cau_hois.id_bai_kiem_tra', $this->idbkt], ['lop_hoc_phans.id', $this->idlophp]])
            ->select('sinh_viens.ma_so', 'sinh_viens.ho_ten', 'lops.ten_lop', 'bai_kiem_tras.id', DB::raw("SUM(tra_lois.diem) as tongdiem"))
            ->groupBy('sinh_viens.ma_so', 'sinh_viens.ho_ten', 'lops.ten_lop', 'bai_kiem_tras.id');

        return $traloi;
    }

    public function map($traloi): array
    {
        return [
            $traloi->ma_so,
            $traloi->ho_ten,
            $traloi->ten_lop,
            ($traloi->tongdiem == 0) ? '0' : $traloi->tongdiem
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
        return [
            AfterSheet::class    => function (AfterSheet $event) {
                $cellRange = 'A1:D1'; // All headers
                $event->sheet->getDelegate()->getStyle($cellRange)->getFont()->setSize(13);
                $event->sheet->mergeCells('A1:D1');
                $event->sheet->getDelegate()->getStyle('A1:D1')
                    ->getAlignment()
                    ->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
                $event->sheet->getDelegate()->getStyle('A2:D2')
                    ->getAlignment()
                    ->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
                $styleArray = [
                    'borders' => [
                        'outline' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                            'color' => ['argb' => '00000000'],
                        ],
                    ],
                ];
                $event->sheet->getStyle($cellRange)->applyFromArray($styleArray);
                $event->sheet->getStyle('A2')->applyFromArray($styleArray);
                $event->sheet->getStyle('B2')->applyFromArray($styleArray);
                $event->sheet->getStyle('C2')->applyFromArray($styleArray);
                $event->sheet->getStyle('D2')->applyFromArray($styleArray);
            },
        ];
    }
}