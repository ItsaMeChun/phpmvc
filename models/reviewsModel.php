<?php

include_once __DIR__ . '/../libs/database.php';

class reviewsModel
{
    public $MaPhongTro;
    public $MaAccount;
    public $content;
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getAllReviews($MaPhongTro)
    {
        $query = "SELECT * FROM reviews
                  LEFT JOIN account ON account.MaAccount = reviews.MaAccount
                  LEFT JOIN khachtro ON khachtro.MaAccount = account.MaAccount
                  LEFT JOIN phongtro ON reviews.MaPhongTro = phongtro.MaPhongTro 
                  WHERE reviews.MaPhongTro = {$MaPhongTro}";
        $result = $this->db->select($query);
        if (!$result) {
            return array();
        }

        $reviews = [];
        while ($row = $result->fetch_assoc()) {
            $reviews[] = $row;
        }

        return $reviews;
    }

    public function getLimitedReviews($MaPhongTro, $start, $limit)
    {
        $query = "SELECT * FROM reviews
                  LEFT JOIN account ON account.MaAccount = reviews.MaAccount
                  LEFT JOIN khachtro ON khachtro.MaAccount = account.MaAccount
                  LEFT JOIN phongtro ON reviews.MaPhongTro = phongtro.MaPhongTro 
                  WHERE reviews.MaPhongTro = {$MaPhongTro}
                  LIMIT {$start}, {$limit}";
        $result = $this->db->select($query);
        if (!$result) {
            return array();
        }

        $reviews = [];
        while ($row = $result->fetch_assoc()) {
            $reviews[] = $row;
        }

        return $reviews;
    }

    public function addReviews($MaPhongTro, $MaAccount, $content)
    {
        $query = "INSERT INTO reviews (MaPhongTro, MaAccount, content, submit_date)
                  VALUES('{$MaPhongTro}', '{$MaAccount}', '{$content}', NOW())";
        $result = $this->db->insert($query);
        if (!$result) {
            return false;
        }
        return true;
    }
}
?>
