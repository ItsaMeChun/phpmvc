<?php 
    require __DIR__ . '/../../../vendor/autoload.php';
    use Dotenv\Dotenv;
    $dotenv = Dotenv::createImmutable(__DIR__ . '/../../../');
    $dotenv->load();
?>

<div class="sidebar">
    <div class="logo-details">
    <i class='bx bxl-c-plus-plus icon'></i>
        <div class="logo_name">Admin</div>
        <i class='bx bx-menu' id="btn" ></i>
    </div>
    <ul class="nav-list">
    <li>
        <i class='bx bx-search' ></i>
        <input type="text" placeholder="Search...">
        <span class="tooltip">Search</span>
    </li>
    <li>
    <script>
    window.env = {
        URL: "<?php echo base64_encode($_ENV['ADMIN_URL']); ?>",
    }
    function direct() {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = atob(env.URL);

        document.body.appendChild(form);
        form.submit();
    }
    function directToUser() {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = atob(env.URL) + "landlords.php";

        document.body.appendChild(form);
        form.submit();
    }
    </script>

    <a href="#" onclick="direct();">
        <i class='bx bx-grid-alt'></i>
        <span class="links_name">Dashboard</span>
    </a>
    <span class="tooltip">Dashboard</span>

    </li>
    <li>
    <a href="#" onclick="directToUser()">
        <i class='bx bx-user' ></i>
        <span class="links_name">User</span>
    </a>
    <span class="tooltip">User</span>
    </li>
    <li>
    <a href="{{ route('admin.revenue') }}">
        <i class='bx bx-stats' ></i>
        <span class="links_name">Revenue</span>
    </a>
    <span class="tooltip">Revenue</span>
    </li>
    <li>
    <a href="{{ route('admin.order') }}">
        <i class='bx bx-cart-alt' ></i>
        <span class="links_name">Order</span>
    </a>
    <span class="tooltip">Order</span>
    </li>
    <li>
    <a href="#">
        <i class='bx bx-cog' ></i>
        <span class="links_name">Setting</span>
    </a>
    <span class="tooltip">Setting</span>
    </li>
    <li class="profile">
        <div class="profile-details">
        <!--<img src="profile.jpg" alt="profileImg">-->
        <div class="name_job">
            <div class="name">Prem Shahi</div>
            <div class="job">Web designer</div>
        </div>
        </div>
        <a href="<?php echo $_ENV['URL']; ?>">
            <i class='bx bx-log-out' id="log_out" ></i>
        </a>
    </li>
    </ul>
</div>
