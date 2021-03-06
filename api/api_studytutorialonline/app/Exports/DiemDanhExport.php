<?php

namespace App\Exports;

use App\Models\SinhVien;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithCustomStartCell;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;
use Maatwebsite\Excel\Concerns\Exportable;

class DiemDanhExport implements
    FromQuery,
    WithHeadings,
    WithCustomStartCell,
    WithMapping,
    WithColumnFormatting,
    ShouldAutoSize,
    WithEvents
{
    use Exportable;

    public function __construct(int $lop)
    {
        $this->lop = $lop;
    }

    public function query()
    {
        $sinhvien = SinhVien::query()->where('id_lop', $this->lop);
        return $sinhvien;
    }

    public function map($sinhvien): array
    {
        return [
            $sinhvien->ma_so,
            $sinhvien->email,
            $sinhvien->ho_ten,
            $sinhvien->ngay_sinh,
            $sinhvien->sdt,
            $sinhvien->lop->ten_lop
        ];
    }

    public function startCell(): string
    {
        return 'A1';
    }

    public function columnFormats(): array
    {
        return [
            'D' => NumberFormat::FORMAT_DATE_DDMMYYYY,
            'E' => "0### ### ####",
        ];
    }


    public function headings(): array
    {
        return [
            ['Danh sách điểm danh sinh viên'],
            [
                'MSSV',
                'Email',
                'Họ Tên',
                'Ngày Sinh',
                'SĐT',
                'Lớp'
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
                $cellRange = 'A1:F1'; // All headers
                $event->sheet->getDelegate()->getStyle($cellRange)->getFont()->setSize(13);
                $event->sheet->mergeCells('A1:F1');
                $event->sheet->getDelegate()->getStyle('A1:F1')
                    ->getAlignment()
                    ->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
                $event->sheet->getDelegate()->getStyle('A2:F2')
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
                $event->sheet->getStyle('E2')->applyFromArray($styleArray);
                $event->sheet->getStyle('F2')->applyFromArray($styleArray);
            },
        ];
    }
}