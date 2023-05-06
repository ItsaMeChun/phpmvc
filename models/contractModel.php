<?php

include_once __DIR__ . '/../libs/database.php';
include_once __DIR__ . '/../models/motelModel.php';
include_once __DIR__ . '/../models/roomModel.php';

class contractModel
{
    public $price;
    public $dateCreate;
    public $month;
    public $visible;
    public $dateTerminate;
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function foundContract($id)
    {
        $query = "SELECT Max(id) from hopdongthue where MaPhongTro='{$id}' AND visible='1' AND Date(ngaytraphong) > Date(now()) LIMIT 1";
        $result = $this->db->select($query);
        // if ($result && $row = mysqli_fetch_assoc($result)) { //! sai cu phap
        if ($result && $result->fetch_assoc()) {
            return true;
        }

        return false;
    }

    public function createContract($idRoom, $idOwner, $idGuest, $price, $dateCreate, $month, $method, $sdt)
    {
        $ngaynhan = date('Y-m-d', strtotime($dateCreate . ' + 3 days'));
        $ngaytra = $ngaynhan;
        $monthbill = $month;

        $query = "INSERT INTO `hopdongthue`(`MaPhongTro`, `MaChuTro`, `MaKhachTro`, `thanhtien`, `ngaylaphoadon`, `sothangthue`, `ngaynhanphong` , `ngaytraphong`, `MaPhuongThuc`, `sdt`)
        VALUES ('{$idRoom}', '{$idOwner}', '{$idGuest}', '{$price}', '{$dateCreate}', '{$month}','{$ngaynhan}', DATE_ADD('{$ngaytra}', INTERVAL +{$monthbill} MONTH), '{$method}', '{$sdt}')";
        $result = $this->db->insert($query);
        if (!$result) {
            return false;
        }

        return true;
    }

    public function myContract($idUser)
    {
        $query = "SELECT * FROM `hopdongthue` WHERE MaChuTro = $idUser";
        $result = $this->db->select($query);
        if (!$result) {
            return false;
        }
        $contract = [];
        while($row = $result->fetch_assoc()) {
            $contract[] = $row;
        }
        return $contract;
    }

    public function findContractById($id) {
        $query = "SELECT * FROM `hopdongthue` WHERE id = $id";
        $result = $this->db->select($query);
        if(!$result) {
            return false;
        }
        return $result;
    }
}
