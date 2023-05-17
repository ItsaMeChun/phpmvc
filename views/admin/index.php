
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Admin</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script type="text/javascript" src="js/Chart.min.js"></script>    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script> 
    <link rel="stylesheet" href="assets/boxicons-2.0.7/css/boxicons.min.css">
   
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>


    <!-- <link rel="stylesheet" href="../../assets/sass/admin.scss">
    <link rel="stylesheet" href="../../assets/css/admin.min.css"> -->
    <link rel="stylesheet" href="../assets/css/admin.css">
    <link rel="stylesheet" href="../../assets/css/admin.css">
</head>
<style>
    /* Google Font Link */
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
    .sidebar .logo-details .icon{opacity: 0; transition: all 0.5s ease;}
    .chartdiv {padding: 20px;display: flex;}
    .sidebar .logo-details .logo_name{color: #fff; font-size: 20px; font-weight: 600; opacity: 0; transition: all 0.5s ease;}
    .sidebar.open .logo-details .icon,.sidebar.open .logo-details .logo_name{opacity: 1;}
    .sidebar .logo-details #btn{position: absolute; text-align: center; top: 50%; right: 0; transform: translateY(-50%); 
    font-size: 22px; transition: all 0.4s ease; cursor: pointer; transition: all 0.5s ease;}
    .sidebar.open .logo-details #btn{
    text-align: right;
    }
    .sidebar li .tooltip{position: absolute; top: -20px; left: calc(100% + 15px); z-index: 3; background: #fff;box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3); 
    padding: 6px 12px; border-radius: 4px; font-size: 15px; font-weight: 400; opacity: 0; white-space: nowrap; pointer-events: none; transition: 0s;}
    .sidebar li:hover .tooltip{opacity: 1; pointer-events: auto; transition: all 0.4s ease; top: 50%; transform: translateY(-50%);}
    .sidebar.open li .tooltip{display: none;}
    .sidebar li a .links_name{color: #fff; font-size: 15px; font-weight: 400; white-space: nowrap; opacity: 0; pointer-events: none; transition: 0.4s;}
    .sidebar.open li a .links_name{opacity: 1; pointer-events: auto;}
    .sidebar li i{height: 50px; line-height: 50px; font-size: 18px; border-radius: 12px;}
    .sidebar li.profile{position: fixed; height: 60px; width: 78px; left: 0; bottom: -8px; 
    padding: 10px 14px; background: #1d1b31; transition: all 0.5s ease; overflow: hidden;}
    .sidebar.open li.profile{width: 250px;}
    .sidebar li .profile-details{display: flex; align-items: center; flex-wrap: nowrap;}
    .sidebar li img{height: 45px; width: 45px; object-fit: cover; border-radius: 6px; margin-right: 10px;}
    .sidebar li.profile .name, .sidebar li.profile .job{font-size: 15px; font-weight: 400; color: #fff; white-space: nowrap;}
    .sidebar li.profile .job{font-size: 12px;}
    .home-section{position: relative; background: #E4E9F7; min-height: 100vh; top: 0;left: 78px;
         width: calc(100% - 78px); transition: all 0.5s ease; z-index: 2;}
    .sidebar.open ~ .home-section{left: 250px; width: calc(100% - 250px);}
    .home-section .text{display: inline-block; color: #11101d; font-size: 25px; font-weight: 500; margin: 18px}    
    .sidebar.open .profile #log_out{width: 50px; background: none;}
    .sidebar .profile #log_out{position: absolute; top: 50%; right: 0; transform: translateY(-50%); background: #1d1b31;width: 100%; 
        height: 60px; line-height: 60px; border-radius: 0px; transition: all 0.5s ease;}
    @media (max-width: 420px) {.sidebar li .tooltip{display: none;}}
    .min-text {margin: 18px;}
    th {padding-right: 10px;}
    td {padding-right: 10px;}
    .relative.z-0.inline-flex.shadow-sm.rounded-md {display: none;}
    .table_chart {width: 100%; display: flex; text-align: center; padding: 10px;}
    .box {flex: 1;border: 2px solid #000; margin: 10px; height: 100px; border-radius: 10px;display:flex;}
    .box>p {height: -webkit-fill-available;display: block;width: -webkit-fill-available;position: relative;text-align: center;top: 35%;}
</style>
<body>
    <?php
        include __DIR__.'/assets/sidebar.php';
    ?>
    <section class="home-section">
    <!-- //** Phần Admin */ -->
    <?php 
        include_once __DIR__ . '/../../models/contractModel.php';
        $contract = new contractModel();
        $total=$contract->totalContract();
        $book=$contract->bookroomContract();
        $end=$contract->endroomContract();
    ?>
    <div class='table_chart'> 
        <div class="box" style="background: #ffa03d;"><p>Tổng tiền: <?php
            foreach($total as $row){
                echo number_format($row['Tong'],0,",",".");
            }
        ?> VNĐ</p></div>
        <div class="box" style="background: #478fff;"><p>Đặt phòng: <?php
            foreach($book as $row){
                echo number_format($row['Dat'],0,",",".");
            }; ?></p></div>
        <div class="box" style="background: #00ff90;"><p>Hủy phòng: <?php
            foreach($end as $row){
                echo number_format($row['Huy'],0,",",".");
            }?>
        </p></div>
    </div>
    <div class='chartdiv'>
        <canvas id="myChart" style="width:100%;max-width:600px;height:600px;margin:10px 50px"></canvas>
        <canvas id="Chart" style="width:100%;max-width:600px;margin:10px 50px;"></canvas>
    </div>
    <!-- <div id="chart-container">
        <canvas id="graph"></canvas>
    </div> -->

    <!-- //** */ -->
    </section>
  
    <script>

        // var xValues = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
        $(document).ready(function () {
            showGraph();
        });

        function showGraph(){
            // $.post("../../charjs.php",
            $.post("../charjs.php",
                function (data){
                    console.log(data);
                    var total = []; 
                var formStatusVar = [];
                    for (var i in data) {
                        total.push(data[i].idMonth);
                        formStatusVar.push(data[i].total);
                    }

                    var options = {
                        legend: {
                            display: true
                        },
                        scales: {
                            xAxes: [{
                                display: true
                            }],
                        yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        },
                        title: {
                            display: true,
                            text: "Doanh Thu theo tháng"
                        }
                    };
                    var barColors = ["#79CDCD", "#F4A460","#FFFACD","#EEE0E5","#00BFFF","#B0C4DE","#00FFFF",
                    "#00FF7F","#00FF00","#7FFF00","#FFFF00","#FF3030","#FF8C00","#FF0000"];
                    var myChart = {
                        labels: total,
                        datasets: [
                            {
                                label: 'Doanh thu ',
                                backgroundColor: barColors,
                                borderColor: '#46d5f1',
                                hoverBackgroundColor: '#0ec2b6',
                                hoverBorderColor: '#42f5ef',
                                // data: total,
                                data: formStatusVar,
                                
                            }
                        ]
                    };

                    var bar = $("#myChart"); 
                    var barGraph = new Chart(bar, {
                        type: 'bar',
                        data: myChart,
                        options: options,
                    });
                });

        //
        $.post("../charjs.php",
                function (data){
                    console.log(data);
                    
                    var total = []; 
                var formStatusVar = [];
                    for (var i in data) {
                        total.push(data[i].idMonth);
                        formStatusVar.push(data[i].total);
                        
                    }

                    var options = {
                        legend: {
                            display: true
                        },
                        scales: {
                            xAxes: [{
                                display: true
                            }],
                        yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        },
                        title: {
                            display: true,
                            text: "Doanh Thu theo tháng"
                        }
                    };
                    var barColors = ["#79CDCD", "#F4A460","#FFFACD","#EEE0E5","#00BFFF","#B0C4DE","#00FFFF",
                    "#00FF7F","#00FF00","#7FFF00","#FFFF00","#FF3030","#FF8C00","#FF0000"];
                    var myChart = {
                        labels: total,
                        datasets: [
                            {
                                label: 'Doanh thu ',
                                backgroundColor: barColors,
                                borderColor: '#46d5f1',
                                hoverBackgroundColor: '#0ec2b6',
                                hoverBorderColor: '#42f5ef',
                                // data: total,
                                data: formStatusVar,
                                
                            }
                        ]
                    };

                    var bar = $("#Chart"); 
                    var barGraph = new Chart(bar, {
                        type: 'pie',
                        data: myChart,
                        options: options,
                    });
                });
        }

    let sidebar = document.querySelector(".sidebar");
    let closeBtn = document.querySelector("#btn");
    let searchBtn = document.querySelector(".bx-search");

    closeBtn.addEventListener("click", ()=>{
        sidebar.classList.toggle("open");
        menuBtnChange();//calling the function(optional)
    });

    searchBtn.addEventListener("click", ()=>{ // Sidebar open when you click on the search iocn
        sidebar.classList.toggle("open");
        menuBtnChange(); //calling the function(optional)
    });

    // following are the code to change sidebar button(optional)
    function menuBtnChange() {
    if(sidebar.classList.contains("open")){
        closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
    }else {
        closeBtn.classList.replace("bx-menu-alt-right","bx-menu");//replacing the iocns class
    }
    }
    // SELECT LAST_DAY(ngaylaphoadon) month_ending, SUM(thanhtien) sales, COUNT(*) id FROM hopdongthue WHERE ( ngaylaphoadon >= LAST_DAY(NOW()) + INTERVAL 1 DAY - INTERVAL 1 MONTH AND ngaylaphoadon < LAST_DAY(NOW()) + INTERVAL 1 DAY) OR ( ngaylaphoadon >= LAST_DAY(NOW()) + INTERVAL 1 DAY - INTERVAL 13 MONTH AND ngaylaphoadon < LAST_DAY(NOW()) + INTERVAL 1 DAY - INTERVAL 12 MONTH) GROUP BY LAST_DAY(ngaylaphoadon) ORDER BY LAST_DAY(ngaylaphoadon);
    // SELECT SUM(IF(month = 'Jan', total, 0)) AS 'Jan', SUM(IF(month = 'Feb', total, 0)) AS 'Feb', SUM(IF(month = 'Mar', total, 0)) AS 'Mar', SUM(IF(month = 'Apr', total, 0)) AS 'Apr', SUM(IF(month = 'May', total, 0)) AS 'May', SUM(IF(month = 'Jun', total, 0)) AS 'Jun', SUM(IF(month = 'Jul', total, 0)) AS 'Jul', SUM(IF(month = 'Aug', total, 0)) AS 'Aug', SUM(IF(month = 'Sep', total, 0)) AS 'Sep', SUM(IF(month = 'Oct', total, 0)) AS 'Oct', SUM(IF(month = 'Nov', total, 0)) AS 'Nov', SUM(IF(month = 'Dec', total, 0)) AS 'Dec', SUM(total) AS total_yearly FROM ( SELECT DATE_FORMAT(ngaylaphoadon, "%b") AS month, SUM(thanhtien) as total FROM `hopdongthue` WHERE ngaylaphoadon <= NOW() and ngaylaphoadon >= Date_add(Now(),interval - 12 month) GROUP BY DATE_FORMAT(ngaylaphoadon, "%m-%Y")) as sub;
    </script>

</body>
</html>