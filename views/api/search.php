<?php
require_once __DIR__ . '/../../models/motelModel.php';

// Get the search query from the request parameter
$query = $_GET['query'];

// Perform your search logic here and return the results
// Replace this with your actual search implementation
$results = performSearch($query);

// Return the results as JSON
header('Content-Type: application/json');
echo json_encode($results);

// Function to perform the search query (replace this with your actual search logic)
function performSearch($query) {
  $model = new motelModel();
  $result = $model->search($query);

  return $result;
}
?>
