<?php
include_once __DIR__ . '/../../models/roomModel.php';
require __DIR__ . '/../../vendor/autoload.php';
use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__ . '/../../');
$dotenv->load();

class allroomView
{
    public function render($allroom)
    {
        ?>         
<table>
  <tr>
    <th>STT</th>
    <th>Email Chủ Trọ</th>
    <th>Nhà Trọ</th>
    <th>Phòng Trọ</th>
    <th>Hủy</th>
  </tr>
  <?php
        // if(isset($_SESSION['user_idNum']))
        //     {
                $STT = 1;
        foreach ($allroom as $row) {
            ?>  
  <tr>
    <td><?php echo $STT++; ?></td>
    <td><?php echo $row['Email']; ?></td>
    <td><?php echo $row['DiaChi']; ?></td>
    <td><?php echo $row['SoPhong']; ?></td>
    <td><a href="">Hủy</a><td>


  <?php

            // }
        }
        ?>
</table>
<?php
    }
}
class allroomController
{
    public function __invoke()
    {
        // $roomModel = new App\Models\roomModel();
        $roomModel = new roomModel();
        $allroom = $roomModel->getAdminRoom();
        $allroomView = new allroomView();

        $allroomView->render($allroom);
    }
}
?>