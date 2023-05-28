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
    <!-- <li>
        <i class='bx bx-search' ></i>
        <input type="text" placeholder="Search...">
        <span class="tooltip">Search</span>
    </li> -->
    <li>
    <script>
    window.env = {
        URL: "<?php echo base64_encode($_ENV['ADMIN_URL']); ?>",
    }
    function directToURL(url) {
        const form = document.createElement('form');
        form.method = 'POST';
        if(!url) url = '';
        form.action = atob(env.URL) + url;

        document.body.appendChild(form);
        form.submit();
    }
    </script>

    <a href="#" onclick="directToURL();">
        <i class='bx bx-grid-alt'></i>
        <span class="links_name">Dashboard</span>
    </a>
    <span class="tooltip">Dashboard</span>

    </li>
    <li>
    <a href="#" onclick="directToURL('user.php')">
        <i class='bx bx-user' ></i>
        <span class="links_name">User</span>
    </a>
    <span class="tooltip">User</span>
    </li>

    <li>
        <a href="#" onclick="directToURL('landlords.php')">
            <i class='bx bx-body' ></i>
            <span class="links_name">Landlord</span>
        </a>
        <span class="tooltip">Room</span>
        </li>
        <li>
        <a href="#" onclick="directToURL('room.php')">
            <i class='bx bx-stats' ></i>
            <span class="links_name">Room</span>
        </a>
        <span class="tooltip">Revenue</span>
        </li>
        <li>
        <a href="#" onclick="directToURL('bill.php');">
            <i class='bx bx-cart-alt' ></i>
            <span class="links_name">Bill</span>
        </a>
        <span class="tooltip">Bill</span>
        </li>
        <!-- <li>
        <a href="#">
            <i class='bx bx-cog' ></i>
            <span class="links_name">Setting</span>
        </a>
        <span class="tooltip">Setting</span>
        </li> -->
    <li class="profile">
        <div class="profile-details">
        <img src="https://firebasestorage.googleapis.com/v0/b/project-motel.appspot.com/o/1684378867662.jpg?alt=media&token=5b45c1ba-1dd9-40bc-a836-4676c834bba2" alt="profileImg">
        <div class="name_job">
            <div class="name">Long báo</div>
            <div class="job">HVN Employee</div>
        </div>
        </div>
        <a href="<?php echo $_ENV['URL']; ?>">
            <i class='bx bx-log-out' id="log_out" ></i>
        </a>
    </li>
    </ul>
</div>
