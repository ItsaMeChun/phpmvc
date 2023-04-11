<?php 
    include_once(__DIR__ . '/../models/motelModel.php');
    include_once(__DIR__ . '/../models/roomModel.php');

    class detailsMotel
    {
        public function render($details)
        {
        ?>
      <div class="container">
        <h2 class="title__section">
          Chi tiết nhà trọ
        </h2>
        <?php
            foreach($details as $row){
        ?>
          <div class="details__product">
              <div class="details__product__left">
                <div class="details__product__left__img">
                  <img src="https://akkogear.com.vn/wp-content/uploads/2022/08/ban-phim-co-akko-3068b-plus-black-gold-03.jpg" alt="">
                </div>
              </div>
              <div class="details__product__right">
                  <h3 class="details__product__right__title">
                    <?php echo $row['DiaChi'] ?>
                  </h3>
                    <?php $id = $_GET['idNhaTro'];?>
                    <a href="../views/createroom.php?idNhaTro=<?php echo $id;?>">
                      <button type="submit" name="submit" class="btn btn--add">
                      <i class='bx bx-shopping-bag' ></i>
                      Thêm phòng trọ
                      </button>
                    </a>
                    <a href="../views/configuremotel.php?idNhaTro=<?php echo $id;?>">
                      <button type="submit" name="submit" class="btn btn--add">
                      <i class='bx bx-shopping-bag' ></i>
                      Chỉnh sửa nhà trọ
                      </button>
                    </a>
                    <!-- <a href="" id="delete-link">
                      <button type="button" class="btn btn--add" onclick="confirmDelete()">
                          <i class='bx bx-shopping-bag'></i>
                          Xóa nhà trọ
                      </button>
                    </a> -->
              </div>
            </div>
              <div class="description">
                <h4 class="heading">Mô tả</h4>
                <p class="desc">
                  <?php echo nl2br($row['MoTaNhaTro']);?>
                </p>
              </div>
              <?php }?>
            </div>
        </div>
      </div>
      <!-- <script>
        function confirmDelete(id) {
            if (confirm("Bạn có muốn xóa?")) {
                window.location.href = "phpmvc/controllers/deletemotelController.php?idNhaTro=" + id;
            }
        }
      </script> -->

<?php
        }
      }
    class roomDetails
    {
      public function render($room)
      {?>
        <div class="container">
          <div class="product">
            <h3 class="heading">
              <i class="bx bx-cart-alt"></i>
              Phòng trọ của bạn
            </h3>
            <div class="product__container">
              <?php
              if(is_null($room)){
                echo 'Bạn chưa có nhà trọ';?>
              </div>
              <?php
                return;
              }
              // else{
                foreach($room as $item){ ?>
                  <div class="product__item">
                    <div class="product__item__img">
                      <a href="../views/indetails.php?idNhaTro=<?php echo $_GET['idNhaTro']; ?>&&idPhongTro=<?php echo $item['MaPhongTro'];?>">
                        <img src="https://akkogear.com.vn/wp-content/uploads/2022/08/ban-phim-co-akko-3068b-plus-black-gold-03.jpg" alt="">
                      </a>
                    </div>
                    <h4 class="product__item__title">
                      <a href="../page/indetails.php?idNhaTro=<?php echo $_GET['idNhaTro'];?>&&idPhongTro=<?php echo $item['MaPhongTro'];?>">
                        <?php echo $item['SoPhong'];?>
                      </a>
                    </h4>
                    <a href="categoryName" class="product__item__action">
                      <i class='bx bx-category' ></i>
                      Xem list sản phẩm
                  </a>
              </div>
          <?php
          } ?>
          </div>
<?php
      }
    }
class detailsMotelController
{
    public function __invoke()
    {
        $id = $_GET['idNhaTro'];
        $room = new motelModel();
        $details = $room->getDetails($id);
        $view = new detailsMotel();
        $view->render($details);
    }
}
class room
{
  public function __invoke()
  {
    $id = $_GET['idNhaTro'];
    $getRoom = new RoomModel();
    $yes = $getRoom->getRoom($id);
    $room = new roomDetails();
    $room->render($yes);
  }
}