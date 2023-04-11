<?php
    include_once('../libs/database.php');
    include_once('../models/roomModel.php');

class motelModel
{
    private $db;
    public $idMotel;
    public $addressMotel;
    public $description;
    public $idOwner;
    public function __construct()
    {
        $this->db = new Database();
    }
    public function getAllMotels($idOwner){
        $query = "SELECT * FROM nhatro where MaChuTro = $idOwner";
        $result = $this->db->select($query);
        if (!$result) {
            echo "Database Error: " . $this->db->error;
            exit;
        }
          $motels = array();
          while ($row = $result->fetch_assoc()) {
            $motels[] = $row;
          }
          return $motels;
    }
    public function addMotel($addressMotel, $description, $idOwner)
    {
        $query = "INSERT INTO nhatro (DiaChi, MoTaNhaTro, MaChuTro) VALUES ('$addressMotel', '$description', $idOwner)";
        $result = $this->db->insert($query);
        if($result) return true;
        return false;
    }
    public function getDetails($idMotel)
    {
        $query = "SELECT * FROM nhatro where MaNhaTro = $idMotel";
        $result = $this->db->select($query);
        if (!$result) {
            echo "Database Error: ". $this->db->error;
            exit;
          }
          $motels = array();
          while ($row = $result->fetch_assoc()) {
            $motels[] = $row;
          }
          return $motels;
    }
    public function updateDetails($idMotel, $addressMotel, $description)
    {
        $query = "UPDATE `nhatro` SET `DiaChi`='$addressMotel',`MoTaNhaTro`='$description' WHERE `MaNhaTro`='$idMotel'";
        $result = $this->db->update($query);
        if($result) return $result;
        return false;
    }
    public function delete($idMotel)
    {
        $roomModel = new RoomModel();
        $roomModel->getRoom($idMotel);
        if(!$roomModel)
        {
            $query = "DELETE FROM nhatro where MaNhaTro = $idMotel";
            $result = $this->db->delete($query);
            if(!$result) return false;
            return true;
        }
        return false;
    }
}
?>