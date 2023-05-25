<?php
require __DIR__ . '/../../vendor/autoload.php';
use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__ . '/../../');
$dotenv->load();
if (isset($_GET['login']) && $_GET['login'] == 'logout') {
    session_destroy();
    header('Location:' . $_ENV['URL']);
    exit;
} // use to logout account
?>
<header class="header">
  <div class="header__menu__toggle">
    <i class='bx bx-menu-alt-left' ></i>
  </div>
  <h4 class="header__logo">
  <a href="<?php echo isset($_SESSION['user_role']) && $_SESSION['user_role'] == 0 ? $_ENV['URL'] . 'homepage' : $_ENV['URL']; ?>">
    <!-- L<span>ONG</span> N<span>HONG</span> -->
    <img src="assets/images/StayScore.jpg" style="width:110px;"></img>
  </a>
  </h4>
  <style>
    .header__search {
      position: relative;
      width: 100%;
    }

    .search-results {
      position: absolute;
      top: 100%;
      left: 0;
      z-index: 999;
      width: 100%;
      max-height: 200px;
      overflow-y: auto;
      padding: 10px;
      background-color: #fff;
      border: 1px solid #ccc;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      display: none; /* Add this to initially hide the search results */
    }

    .search-results.show {
      display: block; /* Add this to display the search results with white background */
    }

    .result-item {
      display: flex;
      align-items: center;
      margin-bottom: 10px;
    }

    .result-item img {
      width: 50px;
      height: 50px;
      margin-right: 10px;
    }

    .result-item a {
      color: #000000;
      text-decoration: none;
      font-weight: bold;
    }
  </style>
  <div class="header__search">
    <i class="bx bx-search icon-search header__search__icon"></i>
    <input type="text" spellcheck="false"
          placeholder="Tìm kiếm nhà trọ bạn cần"
          class="header__search__input" id="search-input">
    <div id="search-results" class="search-results"></div>
  </div>
  <script>
    const searchInput = document.getElementById('search-input');
    const searchResults = document.getElementById('search-results');

    function executeSearchQuery() {
      const query = searchInput.value;

      if (query !== '') {
        searchResults.innerHTML = '';

        const xhr = new XMLHttpRequest();
        xhr.open('GET', `<?php echo $_ENV['API_URL']; ?>search?query=${query}`, true);
        xhr.onreadystatechange = function () {
          if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            const results = JSON.parse(xhr.responseText);
            if (results.length > 0) {
              searchResults.innerHTML = ''; // Clear previous results

              results.forEach(result => {
                const resultElement = document.createElement('div');
                resultElement.classList.add('result-item');

                const imageElement = document.createElement('img');
                if(!result.url) {
                  imageElement.src = 'https://viatravelers.com/wp-content/uploads/2021/01/single-hotel-room.jpg';
                  imageElement.alt = 'Image';
                  resultElement.appendChild(imageElement);
                } else {
                  imageElement.src = result.url;
                  imageElement.alt = 'Image';
                  resultElement.appendChild(imageElement);
                }

                const resultLink = document.createElement('a');
                resultLink.href = `<?php echo $_ENV['URL']; ?>indetails?idPhongTro=${result.MaPhongTro}&idNhaTro=${result.MaNhaTro}`;
                resultLink.textContent = result.DiaChi + ' | ' + result.SoPhong;
                resultElement.appendChild(resultLink);

                searchResults.appendChild(resultElement);
              });

              searchResults.classList.add('show');
            } else {
              searchResults.innerHTML = '<span>You fucking donkey!</span>';
              searchResults.classList.add('show');
            }
          }
        };
        xhr.send();
      } else {
        searchResults.innerHTML = '';
        searchResults.classList.remove('show');
      }
    }
    searchInput.addEventListener('input', executeSearchQuery);
  </script>
  <div class="header__action">
    <?php if (isset($_SESSION['user_role']) && $_SESSION['user_role'] == 1) { ?>
    <button class="btn btn--cart header__action__btn">
      <a href="<?php echo $_ENV['URL']; ?>history">
        Lịch Sử
      </a>
    </button>
    <button class="btn btn--cart header__action__btn">
      <a href="<?php echo $_ENV['URL']; ?>transaction">
        Đặt Phòng
      </a>
    </button>
    <button class="btn btn--cart header__action__btn">
      <a href="<?php echo $_ENV['URL']; ?>userpage">
        Đánh Giá
      </a>
    </button>
    <?php } elseif (isset($_SESSION['user_role']) && $_SESSION['user_role'] == 0) {?>
      <button class="btn btn--cart header__action__btn">
        <a href="<?php echo $_ENV['URL']; ?>landlordpage">
          Đánh Giá
        </a>
      </button>
    <?} 
    else { ?>

    <?php } ?>

    <?php if (isset($_SESSION['user_name'])) { ?>
      <button class="btn btn--cart header__action__btn">
      <a href="?login=logout">
        <i class="bx bxs-user"></i>
        Đăng xuất
      </a>
    </button>
      <!-- <a href="">
        <i class="bx bxs-user"></i>
        Xác nhận tài khoản
      </a> -->
    <?php } ?>
    <button class="btn btn--primary header__action__btn">
      <?php if (isset($_SESSION['user_name'])) { ?>
        <a href="#">
          <i class="bx bxs-user"></i> <?php echo $_SESSION['user_name']; ?>
        </a>
      <?php } else { ?>
        <a href="<?php echo $_ENV['URL']; ?>login">
          <i class="bx bxs-user"></i> Đăng nhập
        </a>
      <?php } ?>
  </button>
  </div>
</header>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
