<?php

include '../lib/session.php';
include '../classes/custom.php';
Session::checkSession('admin');
$role_id = Session::get('role_id');
if ($role_id == 1) {
    # code...
} else {
    header("Location:../index.php");
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $product = new product();
    if (isset($_POST['block'])) {
        $result = $product->block($_POST['id']);
        if ($result) {
            echo '<script type="text/javascript">alert("Khóa sản phẩm thành công!");</script>';
        } else {
            echo '<script type="text/javascript">alert("Khóa sản phẩm thất bại!");</script>';
        }
    } else if (isset($_POST['active'])) {
        $result = $product->active($_POST['id']);
        if ($result) {
            echo '<script type="text/javascript">alert("Kích hoạt sản phẩm thành công!");</script>';
        } else {
            echo '<script type="text/javascript">alert("Kích hoạt sản phẩm thất bại!");</script>';
        }
    } else if (isset($_POST['detelet'])) {
        $result = $product->delete($_POST['id']);
        if ($result) {
            echo '<script type="text/javascript">alert("Xóa sản phẩm thành công!");</script>';
        } else {
            echo '<script type="text/javascript">alert("Xóa sản phẩm thất bại!");</script>';
        }
    } else {
        echo '<script type="text/javascript">alert("Có lỗi xảy ra!");</script>';
        die();
    }
}

$custom = new custom();
$list = $custom->getAllAdmin((isset($_GET['page']) ? $_GET['page'] : 1));
$pageCount = $custom->getCountPaging();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Liên kết CSS Bootstrap bằng CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <script src="https://use.fontawesome.com/2145adbb48.js"></script>
    <script src="https://kit.fontawesome.com/a42aeb5b72.js" crossorigin="anonymous"></script>
    <title>Danh sách khách hàng</title>
</head>

<body>
    <nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">
            <i class="fas fa-bars"></i>
        </label>
        <label class="logo">ADMIN</label>
        <ul>
            <li><a href="productlist.php">Quản lý Sản phẩm</a></li>
            <li><a href="categoriesList.php">Quản lý Danh mục</a></li>
            <li><a href="orderlist.php">Quản lý Đơn hàng</a></li>
            <li><a href="customer.php" class="active">Quản lý Khách hàng</a></li>
        </ul>
    </nav>
    <!-- <div class="title">
        <h1>Danh sách khách hàng</h1>
    </div> -->
    <div class="addNew">
        <a href="add_customer.php">Thêm mới</a>
    </div>
    <div class="container">
        <?php $count = 1;
        if ($list) { ?>
            <table class="list">
                <tr>
                    <th>STT</th>
                    <th>Tên khách hàng</th>
                    <th>Email</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
                <?php foreach ($list as $key => $value) { ?>
                    <tr>
                        <td><?= $count++ ?></td>
                        <td><?= $value['fullName'] ?></td>
                        <td><?= $value['email'] ?></td>
                        <td><?= ($value['status']) ? "Active" : "Block" ?></td>
                        <td>
                            <a href="edit_customer.php?id=<?= $value['id'] ?>">Xem/Sửa</a>
                            </a>
                            <?php
                                if (isset($_GET['id'])) {
        $customer = new customer();
        $result = $customer->delete($_GET['id']);
        if ($result) {
            echo '<script type="text/javascript">alert("Xóa khách hàng thành công!"); history.back();</script>';
            } else {
            echo '<script type="text/javascript">alert("Xóa khách hàng thất bại!"); history.back();</script>';
        }
        }?>
        <td>
            <a href="delete.php?id=<?= $value['id'] ?>">Xóa</a>  
                        </td>
                    </td>
                    </tr>
                <?php } ?>
            </table>
        <?php } else { ?>
            <h3>Chưa có khách hàng nào...</h3>
        <?php } ?>
        <div class="pagination">
            <a href="customer.php?page=<?= (isset($_GET['page'])) ? (($_GET['page'] <= 1) ? 1 : $_GET['page'] - 1) : 1 ?>">&laquo;</a>
            <?php
            for ($i = 1; $i <= $pageCount; $i++) {
                if (isset($_GET['page'])) {
                    if ($i == $_GET['page']) { ?>
                        <a class="active" href="customer.php?page=<?= $i ?>"><?= $i ?></a>
                    <?php } else { ?>
                        <a href="customer.php?page=<?= $i ?>"><?= $i ?></a>
                    <?php  }
                } else {
                    if ($i == 1) { ?>
                        <a class="active" href="customer.php?page=<?= $i ?>"><?= $i ?></a>
                    <?php  } else { ?>
                        <a href="customer.php?page=<?= $i ?>"><?= $i ?></a>
                    <?php   } ?>
                <?php  } ?>
            <?php }
            ?>
            <a href="customer.php?page=<?= (isset($_GET['page'])) ? $_GET['page'] + 1 : 2 ?>">&raquo;</a>
        </div>
    </div>
    </div>
    <footer>
        <p class="copyright">FASTFOOD</p>
    </footer>
</body>


</html>