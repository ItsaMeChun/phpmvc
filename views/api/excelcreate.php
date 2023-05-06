<?php
require_once __DIR__ . '/../../vendor/autoload.php';
require_once __DIR__ . '/../../models/contractModel.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\Border;

if(isset($_GET['contract_id'])){
$contractModel = new contractModel();
$result = $contractModel->findContractById($_GET['contract_id']);

// create new PHPExcel object
$spreadsheet = new Spreadsheet();

// set default font
$spreadsheet->getDefaultStyle()->getFont()->setName('Arial');
$spreadsheet->getDefaultStyle()->getFont()->setSize(10);

// add title
$spreadsheet->getActiveSheet()->setCellValue('A1', 'RENTAL CONTRACT');

// set title font and style
$titleStyle = array(
    'font' => array(
        'bold' => true,
        'size' => 14,
    ),
    'alignment' => array(
        'horizontal' => Alignment::HORIZONTAL_CENTER,
    ),
);
$spreadsheet->getActiveSheet()->getStyle('A1')->applyFromArray($titleStyle);

// add contract details
$spreadsheet->getActiveSheet()->mergeCells('A3:B3')->setCellValue('A3', 'Contract No.: ');
$spreadsheet->getActiveSheet()->mergeCells('C3:D3')->setCellValue('C3', 'Date: ');
$spreadsheet->getActiveSheet()->mergeCells('E3:G3')->setCellValue('E3', 'Room Details: ');

// set contract details font and style
$contractDetailsStyle = array(
    'font' => array(
        'bold' => true,
        'size' => 12,
    ),
);
$spreadsheet->getActiveSheet()->getStyle('A3:G3')->applyFromArray($contractDetailsStyle);
// add room details
$spreadsheet->getActiveSheet()->mergeCells('A4:B4')->setCellValue('A4', 'Room No.: ');
$spreadsheet->getActiveSheet()->mergeCells('C4:D4')->setCellValue('C4', 'Floor: ');
$spreadsheet->getActiveSheet()->mergeCells('E4:G4')->setCellValue('E4', 'Area: ');

// add landlord details
$spreadsheet->getActiveSheet()->mergeCells('A6:B6')->setCellValue('A6', 'Landlord: ');
$spreadsheet->getActiveSheet()->mergeCells('C6:G6')->setCellValue('C6', 'Address: ');

// add tenant details
$spreadsheet->getActiveSheet()->mergeCells('A8:B8')->setCellValue('A8', 'Tenant: ');
$spreadsheet->getActiveSheet()->mergeCells('C8:G8')->setCellValue('C8', 'Address: ');

// add payment details
$spreadsheet->getActiveSheet()->mergeCells('A10:G10')->setCellValue('A10', 'Payment Details');

// add header row for payment table
$spreadsheet->getActiveSheet()->setCellValue('A12', 'Payment No.')
                              ->setCellValue('B12', 'Date')
                              ->setCellValue('C12', 'Rent')
                              ->setCellValue('D12', 'Deposit')
                              ->setCellValue('E12', 'Other Fees')
                              ->setCellValue('F12', 'Total')
                              ->setCellValue('G12', 'Payment Method');

// add data to payment table
$row = 13;
while ($payment = $result->fetch_assoc()) {
    $spreadsheet->getActiveSheet()->setCellValue('A'.$row, $payment['id']);
    $spreadsheet->getActiveSheet()->setCellValue('B'.$row, $payment['ngaylaphoadon']);
    $spreadsheet->getActiveSheet()->setCellValue('C'.$row, $payment['thanhtien']);
    $spreadsheet->getActiveSheet()->setCellValue('D'.$row, $payment['deposit']);
    $spreadsheet->getActiveSheet()->setCellValue('E'.$row, $payment['other_fees']);
    $spreadsheet->getActiveSheet()->setCellValue('F'.$row, $payment['total']);
    $spreadsheet->getActiveSheet()->setCellValue('G'.$row, $payment['MaPhuongThuc']);
    $row++;
}

// set payment table header font and style
$headerStyle = array(
    'font' => array(
        'bold' => true,
        'size' => 10,
        'name' => 'Arial',
        'color' => array('rgb' => 'FFFFFF'),
    ),
    'fill' => array(
        'type' => Fill::FILL_SOLID,
        'startcolor' => array('rgb' => '336699'),
    ),
    'borders' => array(
        'allBorders' => array(
            'borderStyle' => Border::BORDER_THIN,
            'color' => array('rgb' => '000000'),
        ),
    ),
    'alignment' => array(
        'horizontal' => Alignment::HORIZONTAL_CENTER,
        'vertical' => Alignment::VERTICAL_CENTER,
    ),
);

$spreadsheet->getActiveSheet()->getStyle('A12:G12')->applyFromArray($headerStyle);

// set active sheet index to the first sheet, so Excel opens this as the first sheet
$spreadsheet->setActiveSheetIndex(0);

// export the spreadsheet to an Excel file
$writer = new Xlsx($spreadsheet);
$idContract = "12345"; // replace with the actual contract ID
$dayContract = date("Y-m-d"); // replace with the actual date of the contract
$fileName = "contract_$idContract" . "_$dayContract.xlsx";

// Set headers to force download
header('Content-Type: application/octet-stream');
header('Content-Disposition: attachment;filename="' . $fileName . '"');
header('Cache-Control: max-age=0');

// Write file to PHP output buffer
$writer->save('php://output');

// Write PHP output buffer to file on user's computer
file_put_contents($fileName, ob_get_contents());

// Prompt user to download the file
readfile($fileName);

// Delete the file from the server
unlink($fileName);



}