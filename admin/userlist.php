<?php
include '../lib/session.php';
include '../classes/user.php';
Session::checkSession('admin');
$role_id = Session::get('role_id');
if ($role_id == 1) {
    header("location: http://localhost:81/doan2/admin/userlist.php");
} else {
    header("location: http://localhost:81/doan2/index.php");
}

if ($_SERVER['REQUEST_METHOD'] == 'get') {
    $user = new user();
    if (isset($_GET['block'])) {
        $result = $user->block($_get['id']);
        if ($result) {
            echo '<script type="text/javascript">alert("Khóa khách hàng thành công!");</script>';
        } else {
            echo '<script type="text/javascript">alert("Khóa khách hàng thất bại!");</script>';
        }
    } else if (isset($_GET['active'])) {
        $result = $user->active($_GET['id']);
        if ($result) {
            echo '<script type="text/javascript">alert("Kích hoạt khách hàng thành công!");</script>';
        } else {
            echo '<script type="text/javascript">alert("Kích hoạt khách hàng thất bại!");</script>';
        }
    } else {
        echo '<script type="text/javascript">alert("Có lỗi xảy ra!");</script>';
        die();
    }
}

$user = new user();
$list = $user->getAllAdmin((isset($_GET['page']) ? $_GET['page'] : 1));
$pageCount = $user->getCountPaging();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
            <li><a href="productlist.php" >Quản lý khách hàng</a></li>
            <li><a href="categoriesList.php">Quản lý Danh mục</a></li>
            <li><a href="orderlist.php">Quản lý Đơn hàng</a></li>
            <li><a href="customer.php" class="active">Quản lý Khách hàng</a></li>
        </ul>
    </nav>
    <div class="title">
        <h1>Danh sách khách hàng</h1>
    </div>
    <div class="addNew">
        <a href="add_user.php">Thêm mới</a>
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
                            <a href="edit_user.php?id=<?= $value['id'] ?>">Xem/Sửa</a>
                            <?php
                            if ($value['status']) { ?>
                                <form action="user.php" method="get">
                                    <input type="text" name="id" hidden value="<?= $value['id'] ?>" style="display: none;">
                                    <input type="submit" value="Khóa" name="block">
                                </form>
                            <?php } else { ?>
                                <form action="user.php" method="get">
                                    <input type="text" name="userId" hidden value="<?= $value['id'] ?>" style="display: none;">
                                    <input type="submit" value="Mở" name="active">
                                </form>
                            <?php } ?>
                        </td>

                    </tr>
                <?php } ?>
            </table>
        <?php } else { ?>
            <h3>Chưa có khách hàng nào...</h3>
        <?php } ?>
        
    </div>
    </div>
    <footer>
        <p class="copyright">FASTFOOD</p>
    </footer>
</body>

</html>