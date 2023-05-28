<?php
include_once __DIR__ . '/../../models/accountModel.php';
require __DIR__ . '/../../vendor/autoload.php';
use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__ . '/../../');
$dotenv->load();

class alllandlordView
{
    public function render($alllandlord)
    {
        ?>         
<table>
  <tr>
    <th>STT</th>
    <th>Tên</th>
    <th>Email</th>
    <th>Ngày Tạo</th>
    <th>Ngày Cập Nhật</th>
    <th>Hủy</th>
  </tr>
  <?php
        // if(isset($_SESSION['user_idNum']))
        //     {
                $STT = 1;
        foreach ($alllandlord as $row) {
            ?>  
  <tr>
    <td><?php echo $STT++; ?></td>
    <td><?php echo $row['Ten']; ?></td>
    <td><?php echo $row['Email']; ?></td>
    <td><?php echo $row['dateCreate']; ?></td>
    <td><?php echo $row['updateTime']; ?></td>
    <td><a href="">Hủy</a><td>


  <?php

            // }
        }
        ?>
</table>
<?php
    }
}
class alllandlordController
{
    public function __invoke()
    {
        // $roomModel = new App\Models\roomModel();
        $accountModel = new accountModel();
        $alllandlord = $accountModel->getAllChuTro();
        $alllandlordView = new alllandlordView();

        $alllandlordView->render($alllandlord);
    }
}
?>