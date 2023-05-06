<?php
include_once __DIR__ . '/../models/contractModel.php';
require __DIR__ . '/../vendor/autoload.php';
use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__ . '/../');
$dotenv->load();
class mycontractView
{
    public function render($data)
    {?>
                <div class="container">
                <table class="table" style="margin:auto;outline:auto">
                    <tr>
                        <th style="padding: 30px; outline: auto">
                            Phòng trọ
                        </th>
                        <th style="padding: 30px; outline: auto">
                            Chủ trọ
                        </th>
                        <th style="padding: 30px; outline: auto">
                            Khách trọ
                        </th>
                        <th style="padding: 30px; outline: auto">
                            Thành tiền
                        </th>
                        <th style="padding: 30px; outline: auto">
                            Số tháng thuê
                        </th>
                        <th style="padding: 30px; outline: auto">
                            Ngày lập hóa đơn
                        </th>
                        <th style="padding: 30px; outline: auto">
                            Ngày nhận phòng
                        </th>
                        <th style="padding: 30px; outline: auto">
                            Ngày trả phòng
                        </th>
                        <th style="padding: 30px; outline: auto">
                            Sđt
                        </th>
                        <th style="padding: 30px; outline: auto">
                            Chức năng
                        </th>
                    </tr>
                    <?php
                    if (!empty($data)) {
                        foreach ($data as $item) { ?>
                    <tr>
                        <th style="padding: 30px; outline: auto">
                            <?php echo $item['MaPhongTro']; ?>
                        </th>
                        <th style="padding: 30px; outline: auto">
                            <?php echo $item['MaChuTro']; ?>
                        </th>
                        <th style="padding: 30px; outline: auto">
                            <?php echo $item['MaKhachTro']; ?>
                        </th>
                        <th style="padding: 30px; outline: auto">
                            <?php echo $item['thanhtien']; ?>
                        </th>
                        <th style="padding: 30px; outline: auto">
                            <?php echo $item['sothangthue']; ?>
                        </th>
                        <th style="padding: 30px; outline: auto">
                            <?php echo $item['ngaylaphoadon']; ?>
                        </th>
                        <th style="padding: 30px; outline: auto">
                            <?php echo $item['ngaynhanphong']; ?>
                        </th>
                        <th style="padding: 30px; outline: auto">
                            <?php echo $item['ngaytraphong']; ?>
                        </th>
                        <th style="padding: 30px; outline: auto">
                            <?php echo $item['sdt']; ?>
                        </th>
                        <th style="padding: 30px; outline: auto">
                            <a href="<?php echo $_ENV['URL']; ?>#">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="20px" height="20px">
                                    <path d="M0 64C0 28.7 28.7 0 64 0H224V128c0 17.7 14.3 32 32 32H384V285.7l-86.8 86.8c-10.3 10.3-17.5 23.1-21 37.2l-18.7 74.9c-2.3 9.2-1.8 18.8 1.3 27.5H64c-35.3 0-64-28.7-64-64V64zm384 64H256V0L384 128zM549.8 235.7l14.4 14.4c15.6 15.6 15.6 40.9 0 56.6l-29.4 29.4-71-71 29.4-29.4c15.6-15.6 40.9-15.6 56.6 0zM311.9 417L441.1 287.8l71 71L382.9 487.9c-4.1 4.1-9.2 7-14.9 8.4l-60.1 15c-5.5 1.4-11.2-.2-15.2-4.2s-5.6-9.7-4.2-15.2l15-60.1c1.4-5.6 4.3-10.8 8.4-14.9z"/>
                                </svg>
                            </a>
                            <a href="<?php echo $_ENV['API_URL']; ?>excelCreate" class="delete-image" data-id="">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="20px" height="20px">
                                    <path d="M135.2 17.7C140.6 6.8 151.7 0 163.8 0H284.2c12.1 0 23.2 6.8 28.6 17.7L320 32h96c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 96 0 81.7 0 64S14.3 32 32 32h96l7.2-14.3zM32 128H416V448c0 35.3-28.7 64-64 64H96c-35.3 0-64-28.7-64-64V128zm96 64c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16s16-7.2 16-16V208c0-8.8-7.2-16-16-16zm96 0c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16s16-7.2 16-16V208c0-8.8-7.2-16-16-16zm96 0c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16s16-7.2 16-16V208c0-8.8-7.2-16-16-16z"/>
                                </svg>
                            </a>
                        </th>
                    </tr>
                <?php } ?>
                <?php }?>
                </table>
            </div>
        </div
    <?php
    }
}
class mycontractController
{
    public function __invoke()
    {
        $contractModel = new contractModel();
        $userId = $_SESSION['user_idNum'];
        $result = $contractModel->myContract($userId);
        $motel = new mycontractView();
        $motel->render($result);
    }
}
