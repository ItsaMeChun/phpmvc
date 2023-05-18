<?php
include_once __DIR__ . '/../../models/contractModel.php';
require __DIR__ . '/../../vendor/autoload.php';
use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__ . '/../../');
$dotenv->load();

class allhistorybillView
{
    public function render($allhistorybill)
    {
        ?>         
<table>
  <tr>
    <th>STT</th>
    <th>Email</th>
    <th>Nhà Trọ</th>
    <th>Phòng Trọ</th>
    <th>Ngày Nhận Phòng</th>
    <th>Ngày Trả Phòng</th>
    <th>Ngày Lập Hóa Đơn</th>
    <th>Tổng Tiền</th>
    <th>Hủy</th>
  </tr>
  <?php
        // if(isset($_SESSION['user_idNum']))
        //     {
                $STT = 1;
        foreach ($allhistorybill as $row) {
            ?>  
  <tr>
    <td><?php echo $STT++; ?></td>
    <td><?php echo $row['Email']; ?></td>
    <td><?php echo $row['DiaChi']; ?></td>
    <td><?php echo $row['SoPhong']; ?></td>
    <td><?php echo $row['ngaynhanphong']; ?></td>
    <td><?php echo $row['ngaytraphong']; ?></td>
    <td><?php echo $row['ngaylaphoadon']; ?></td>
    <td><?php echo $row['thanhtien']; ?> VNĐ</td>
    <td><a href="">Hủy</a><td>


  <?php

            // }
        }
        ?>
</table>
<?php
    }
}
class allhistorybillController
{
    public function __invoke()
    {
        // $roomModel = new App\Models\roomModel();
        $contractModel = new contractModel();
        $allhistorybill = $contractModel->allhistoryContract();
        $allhistoryView = new allhistorybillView();

        $allhistoryView->render($allhistorybill);
    }
}
?>