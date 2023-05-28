<?php
include_once __DIR__ . '/../../models/accountModel.php';
require __DIR__ . '/../../vendor/autoload.php';
use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__ . '/../../');
$dotenv->load();

class allUserView
{
    public function render($allUser)
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
        foreach ($allUser as $row) {
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
class allUserController
{
    public function __invoke()
    {
        $accountModel = new accountModel();
        $allUser = $accountModel->getAllUser();
        $allUserView = new allUserView();

        $allUserView->render($allUser);
    }
}
?>