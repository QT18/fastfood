<?php
include '../lib/session.php';
include '../classes/user.php';
Session::checkSession('admin');
$role_id = Session::get('role_id');
if ($role_id == 1) {
    $users = new user();
    $usersUpdate = mysqli_fetch_assoc($users->getByIdAdmin($_GET['id']));
    if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {
        $result = $users->update($_POST, $_FILES);
        $usersUpdate = mysqli_fetch_assoc($users->getByIdAdmin($_GET['id']));
    }
} else {
    header("Location:../index.php");
}
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
    <title>Chỉnh sửa danh mục</title>
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
            <li><a href="categoriesList.php" class="active">Quản lý danh mục</a></li>
            <li><a href="orderlist.php">Quản lý Đơn hàng</a></li>
            <li><a href="customer.php" class="active">Quản lý Khách hàng</a></li>

        </ul>
    </nav>
    <div class="title">
        <h1>Chỉnh sửa khách hàng</h1>
    </div>
    <div class="container">
        <?php
        if (isset($result)) {
            echo $result;
        }
        ?>
        <div class="form-add">
            <form action="edit_category.php?id=<?= $usersUpdate['id'] ?>" method="post">
                <input type="text" hidden name="id" style="display: none;" value="<?= (isset($_GET['id']) ? $_GET['id'] : $usersUpdate['id']) ?>">
                <label for="name">Tên khách hàng</label>
                <input type="text" id="name" name="name" placeholder="Tên danh mục.." value="<?= $usersUpdate['name'] ?>">

                <input type="submit" value="Lưu" name="submit">
            </form>
        </div>
    </div>
    </div>
    
    <footer>
        <p class="copyright">FASTFOOD</p>
    </footer>
</body>

</html>