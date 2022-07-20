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
            ->where([['ct_bai_kiem_tras.id_bai_kiem_tra', $this->idbkt], ['sinh_viens.id_lop', $this->idlop], ['ct_bai_kiem_tras.trang_thai', '=', '1']])
            ->orWhere([['ct_bai_kiem_tras.id_bai_kiem_tra', $this->idbkt], ['sinh_viens.id_lop', $this->idlop], ['ct_bai_kiem_tras.trang_thai', '=', '2']])
            ->orWhere([['ct_bai_kiem_tras.id_bai_kiem_tra', $this->idbkt], ['sinh_viens.id_lop', $this->idlop], ['ct_bai_kiem_tras.trang_thai', '=', '3']])
            ->select('sinh_viens.ma_so', 'sinh_viens.ho_ten', 'lops.ten_lop', 'ct_bai_kiem_tras.trang_thai')
            ->orderBy('ct_bai_kiem_tras.trang_thai');
        return $data;
    }

    public function check(int $data)
    {
        if ($data == 1) {
            return 'Nộp đúng giờ';
        } else if ($data == 2) {
            return 'Nộp trễ';
        } else if ($data == 3) {
            return 'Chưa nộp bài';
        }
    }

    public function map($data): array
    {

        return [
            $data->ma_so,
            $data->ho_ten,
            $data->ten_lop,
            $this->check($data->trang_thai)
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
            ['Danh sách trạng thái sinh viên làm kiểm tra'],
            [
                'MSSV',
                'Họ Tên',
                'Lớp',
                'Trạng Thái'
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