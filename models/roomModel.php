<?php

include_once __DIR__ . '/../libs/database.php';
include_once __DIR__ . '/../models/pictureModel.php';

class roomModel
{
    public $id;
    public $idMotel;
    public $description;
    public $price;
    public $area;
    public $roomNumber;
    private $db;
    private $limitPage = 8; // change this number to show how many rooms you need in one page

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getAdminRoom()
    {
        $query = 'SELECT DISTINCT phongtro.*, picture.url, nhatro.DiaChi, account.Email
        FROM phongtro
        LEFT JOIN nhatro ON nhatro.MaNhaTro = phongtro.MaNhaTro
        Left join chutro on  nhatro.MaChuTro =chutro.MaChuTro
        Left join account on account.MaAccount = chutro.MaAccount
        LEFT JOIN hopdongthue ON hopdongthue.MaPhongTro = phongtro.MaPhongTro
        LEFT JOIN (
            SELECT MaPhongTro, url
            FROM (
                SELECT MaPhongTro, url
                FROM picture
                ORDER BY RAND()
            ) randomized_picture
            GROUP BY MaPhongTro
        ) picture ON phongtro.MaPhongTro = picture.MaPhongTro';
        $result = $this->db->select($query);
        if (!$result) {
            echo 'Database Error: ' . $this->db->error;
            exit;
        }
        $rooms = [];
        while ($row = $result->fetch_assoc()) {
            $rooms[] = $row;
        }

        return $rooms;
    }

    public function getAllRooms($page)
    {
        $limit = $this->limitPage; // Number of rooms per page
        $offset = ($page - 1) * $limit; // Offset for pagination

        $query = "SELECT DISTINCT phongtro.*, picture.url, nhatro.DiaChi
                FROM phongtro
                LEFT JOIN nhatro ON nhatro.MaNhaTro = phongtro.MaNhaTro
                LEFT JOIN hopdongthue ON hopdongthue.MaPhongTro = phongtro.MaPhongTro
                LEFT JOIN (
                    SELECT MaPhongTro, url
                    FROM (
                        SELECT MaPhongTro, url
                        FROM picture
                        ORDER BY RAND()
                    ) randomized_picture
                    GROUP BY MaPhongTro, url  -- Include 'url' in the GROUP BY clause
                ) picture ON phongtro.MaPhongTro = picture.MaPhongTro
                LIMIT {$limit} OFFSET {$offset}";
        $result = $this->db->select($query);
        if (!$result) {
            // echo 'Database Error: ' . $this->db->error;
            exit;
        }

        $rooms = [];
        while ($row = $result->fetch_assoc()) {
            $rooms[] = $row;
        }

        return $rooms;
    }

    public function getRoom($id)
    {
        $query = "SELECT phongtro.*, picture.id, picture.url, nhatro.DiaChi as DiaChiNhaTro
                FROM phongtro
                LEFT JOIN (
                    SELECT id, url, MaPhongTro
                    FROM picture
                    ORDER BY RAND() > 0 DESC
                    LIMIT 1
                ) AS picture ON phongtro.MaPhongTro = picture.MaPhongTro
                LEFT JOIN nhatro ON phongtro.MaNhaTro = nhatro.MaNhaTro
                WHERE nhatro.MaNhaTro = '{$id}'
                GROUP BY phongtro.MaPhongTro, picture.id, picture.url, nhatro.DiaChi
                ORDER BY phongtro.MaPhongTro ASC";
        $result = $this->db->selectWithoutDebug($query);
        if (!$result) {
            return null;
        }

        return $result;
    }

    public function renderPagination($currentPage)
    {
        $limit = $this->limitPage; // Number of rooms per page

        $query = 'SELECT COUNT(DISTINCT MaPhongTro) AS total FROM phongtro';
        $result = $this->db->select($query);
        $row = $result->fetch_assoc();
        $totalRooms = $row['total'];

        $totalPages = ceil($totalRooms / $limit);

        $pagination = '<div class="pagination">';

        // First page link
        $pagination .= '<a href="?page=1">First</a>';

        // Previous page button
        if ($currentPage > 1) {
            $pagination .= '<a href="?page=' . ($currentPage - 1) . '" class="prev">&lt;</a>';
        }

        // Pages
        if ($totalPages <= 5) {
            for ($i = 1; $i <= $totalPages; $i++) {
                $active = ($i == $currentPage) ? 'active' : '';
                $pagination .= '<a href="?page=' . $i . '" class="' . $active . '">' . $i . '</a>';
            }
        } else {
            if ($currentPage <= 3) {
                for ($i = 1; $i <= 3; $i++) {
                    $active = ($i == $currentPage) ? 'active' : '';
                    $pagination .= '<a href="?page=' . $i . '" class="' . $active . '">' . $i . '</a>';
                }
                $pagination .= '<span class="dots">...</span>';
            } elseif ($currentPage >= ($totalPages - 2)) {
                $pagination .= '<span class="dots">...</span>';
                for ($i = $totalPages - 2; $i <= $totalPages; $i++) {
                    $active = ($i == $currentPage) ? 'active' : '';
                    $pagination .= '<a href="?page=' . $i . '" class="' . $active . '">' . $i . '</a>';
                }
            } else {
                $pagination .= '<span class="dots">...</span>';
                for ($i = $currentPage - 1; $i <= $currentPage + 1; $i++) {
                    $active = ($i == $currentPage) ? 'active' : '';
                    $pagination .= '<a href="?page=' . $i . '" class="' . $active . '">' . $i . '</a>';
                }
                $pagination .= '<span class="dots">...</span>';
            }
        }

        // Next page button
        if ($currentPage < $totalPages) {
            $pagination .= '<a href="?page=' . ($currentPage + 1) . '" class="next">&gt;</a>';
        }

        // Last page link
        $pagination .= '<a href="?page=' . $totalPages . '">Last</a>';

        $pagination .= '</div>';

        return $pagination;
    }
    public function getRoomDebug($id)
    {
        $query = "SELECT phongtro.*, picture.url, COUNT(reviews.MaReviews) AS LuotBinhLuan
                FROM phongtro
                LEFT JOIN reviews ON reviews.MaPhongTro = phongtro.MaPhongTro
                LEFT JOIN picture ON phongtro.MaPhongTro = picture.MaPhongTro
                WHERE phongtro.MaPhongTro = {$id}
                GROUP BY phongtro.MaPhongTro, picture.url
                ORDER BY RAND()
                LIMIT 1";
        $result = $this->db->select($query);
        if (!$result) {
            return null;
        }

        return $result;
    }

    public function getRoomInfo($id)
    {
        $query = "SELECT * FROM phongtro where MaPhongTro = {$id}";
        $result = $this->db->select($query);
        if (!$result) {
            return null;
        }

        return $result;
    }

    public function addRoom($idMotel, $description, $price, $area, $roomNumber)
    {
        $query = "INSERT INTO phongtro (MaNhaTro, MoTaPhongTro, GiaThue, DienTich, SoPhong)
              VALUES({$idMotel}, '{$description}', '{$price}', '{$area}', '{$roomNumber}')";
        $result = $this->db->insert($query);
        if ($result) {
            return true;
        }

        return false;
    }

    public function updateRoom($id, $description, $price, $area, $roomNumber)
    {
        $query = "UPDATE phongtro SET
    MoTaPhongtro = '{$description}', GiaThue = '{$price}', DienTich = '{$area}`', SoPhong = '{$roomNumber}'
    WHERE MaPhongTro = {$id}";
        $result = $this->db->update($query);
        if (!$result) {
            return false;
        }

        return true;
    }

    public function findRoom($searchValue)
    {
        $query = "SELECT pt.MaPhongTro, pt.MaNhaTro, pt.MoTaPhongTro, pt.GiaThue, pt.DienTich, pt.SoPhong 
              FROM phongtro pt
              JOIN nhatro nt ON pt.MaNhaTro = nt.MaNhaTro
              WHERE nt.DiaChi LIKE '%{$searchValue}%'";
        $result = $this->db->select($query);
        if (!$result) {
            return false;
        }

        return $result;
    }

    public function getRoomWithName($id)
    {
        $query = "SELECT phongtro.*, chutro.MaChuTro, chutro.Ten
        FROM phongtro
        JOIN nhatro ON phongtro.MaNhaTro = nhatro.MaNhaTro
        JOIN chutro ON nhatro.MaChuTro = chutro.MaChuTro
        WHERE phongtro.MaPhongTro = {$id}";
        $result = $this->db->select($query);
        if (!$result) {
            return false;
        }

        return $result;
    }
}
