<?php
include_once __DIR__ . '/../../models/reviewsModel.php';

if (isset($_GET['idPhongTro']) && isset($_GET['start'])) {
    $reviewsModel = new reviewsModel();
    $idPhongTro = $_GET['idPhongTro'];
    $start = $_GET['start'];
    $limit = 5;
    $reviews = $reviewsModel->getLimitedReviews($idPhongTro, $start, $limit);
    $hasMore = count($reviews) === $limit;

    $response = array(
        'success' => true,
        'comments' => $reviews,
        'hasMore' => $hasMore
    );

    echo json_encode($response);
} else {
    $response = array(
        'success' => false
    );

    echo json_encode($response);
}
?>
