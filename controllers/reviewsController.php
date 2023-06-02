<?php
include_once __DIR__ . '/../models/reviewsModel.php';

class reviewView
{
    public function renders($reviews, $start, $limit)
    {
        ?>
        <div class="container">
            <ul class="comment-list">
                <?php
                if (isset($reviews)) {
                    foreach ($reviews as $index => $row) {
                        ?>
                        <li class="no-border item idx<?php echo $start + $index; ?>">
                            <div class="cmt-top">
                                <p class="cmt-top-name">
                                    <?php echo $row['Email']; ?> - <?php echo $row['Ten']; ?>
                                </p>
                            </div>
                            <div class="cmt-content">
                                <p class="cmt-txt"><?php echo $row['content']; ?></p>
                            </div>
                            <div class="cmt-command">
                                <span class="cmtd dot-circle-ava"><?php echo $row['submit_date']; ?></span>
                            </div>
                        </li>
                        <?php
                    }
                } else {
                    echo '<li class="no-border">No comments found.</li>';
                }
                ?>
            </ul>
            <?php
            if (count($reviews) >= $limit) { // Display the load more button only if there are more reviews to load
                ?>
                <div class="load-more">
                    <button class="btn-load-more" data-start="<?php echo $start + count($reviews); ?>" onclick="loadMoreComments()">Load More</button>
                </div>
                <?php
            }
            ?>
        </div>
        <?php
    }
}

class reviewsController
{
    public function __invoke()
    {
        $reviewsModel = new reviewsModel();
        $start = 0;
        $limit = 5; // Set the desired limit for the number of reviews
        $reviews = $reviewsModel->getLimitedReviews($_GET['idPhongTro'], $start, $limit); // Use the getLimitedReviews() method instead
        $reviewsView = new reviewView();
        $reviewsView->renders($reviews, $start, $limit);
    }
}
?>

<script>
    function loadMoreComments() {
        var loadMoreButton = document.querySelector('.btn-load-more');
        var start = parseInt(loadMoreButton.getAttribute('data-start'));

        var xhr = new XMLHttpRequest();
        xhr.open('GET', '<?php $_ENV['API_URL'] ?>loadmorecomments.php?idPhongTro=<?php echo $_GET['idPhongTro']; ?>&start=' + start, true);
        xhr.onload = function() {
            if (xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                if (response.success) {
                    var reviewsContainer = document.querySelector('.comment-list');
                    response.comments.forEach(function(comment) {
                        var li = document.createElement('li');
                        li.classList.add('no-border', 'item', 'idx' + start);
                        li.innerHTML = '<div class="cmt-top">' +
                            '<p class="cmt-top-name">' + comment.Email + ' - ' + comment.Ten + '</p>' +
                            '</div>' +
                            '<div class="cmt-content">' +
                            '<p class="cmt-txt">' + comment.content + '</p>' +
                            '</div>' +
                            '<div class="cmt-command">' +
                            '<span class="cmtd dot-circle-ava">' + comment.submit_date + '</span>' +
                            '</div>';
                        reviewsContainer.appendChild(li);
                        start++;
                    });

                    if (!response.hasMore) {
                        loadMoreButton.style.display = 'none';
                    } else {
                        loadMoreButton.setAttribute('data-start', start);
                    }
                }
            }
        };
        xhr.send();
    }
</script>
