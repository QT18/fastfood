<?php
$filepath = realpath(dirname(__FILE__));
include_once($filepath . '/../lib/database.php');
include_once($filepath . '/../lib/session.php');
?>

<?php
/**
 * 
 */
class custom
{
    private $db;
    public function __construct()
    {
        $this->db = new Database();
    }

    public function insert($data)
    {
        $name = $data['fullname'];
        $email = $data['email'];

        // Check image and move to upload folder
        // $file_name = $_FILES['image']['name'];
        // $file_temp = $_FILES['image']['tmp_name'];

        // $div = explode('.', $file_name);
        // $file_ext = strtolower(end($div));
        // $unique_image = substr(md5(time()), 0, 10) . '.' . $file_ext;
        // $uploaded_image = "uploads/" . $unique_image;

        // move_uploaded_file($file_temp, $uploaded_image);
        $query = "INSERT INTO customers VALUES (NULL,'$userid')" ;
        $result = $this->db->insert($query);
        if ($result) {
            $alert = "<span class='success'>Khách hàng đã được thêm thành công</span>";
            return $alert;
        } else {
            $alert = "<span class='error'>Thêm khách hàng thất bại</span>";
            return $alert;
        }
        
    }
    public function delete($id)
    {
        $productId = Session::get('id');
        $query = "DELETE FROM users WHERE id = '$id' AND id = $id";
        $row = $this->db->delete($query);
        if ($row) {
            $alert = "<span class='success'>Khách hàng đã được Xóa thành công</span>";

            return $alert;
        }
        return false;
    }
        
    public function getAllAdmin($page = 1, $total = 8)
    {
        if ($page <= 0) {
            $page = 1;
        }
        $tmp = ($page - 1) * $total;
        $query =
            "SELECT fullname, email
            -- , categories.name as cateName, users.fullName
			--  FROM users INNER JOIN categories ON users.Id = categories.id INNER JOIN users ON products.createdBy = users.id
			--  order by users.id desc 
            from users where fullname, email
             limit $tmp,$total";
        $result = $this->db->select($query);
        return $result;
    }

    public function getAll()
    {
        $query =
            "SELECT *
			 FROM users 
            --  INNER JOIN categories ON products.cateId = categories.id INNER JOIN users ON products.createdBy = users.id
			 WHERE users.status = 1, users.fullname
             order by role_id desc ";
        $result = $this->db->select($query);
        return $result;
    }

    public function getCountPaging($row = 8)
    {
        $query = "SELECT COUNT(*) FROM users";
        $mysqli_result = $this->db->select($query);
        if ($mysqli_result) {
            $totalrow = intval((mysqli_fetch_all($mysqli_result, MYSQLI_ASSOC)[0])['COUNT(*)']);
            $result = ceil($totalrow / $row);
            return $result;
        }
        return false;
    }

    public function getCountPagingClient($cateId, $row = 8)
    {
        $query = "SELECT COUNT(*) FROM users WHERE id = $id";
        $mysqli_result = $this->db->select($query);
        if ($mysqli_result) {
            $totalrow = intval((mysqli_fetch_all($mysqli_result, MYSQLI_ASSOC)[0])['COUNT(*)']);
            $result = ceil($totalrow / $row);
            return $result;
        }
        return false;
    }

    public function getFeaturedusers()
    {
        $query =
            "SELECT *
			 FROM users
			 WHERE users.roles_id = 2
            --  order by users.soldCount DESC
             LIMIT 8";
        $result = $this->db->select($query);
        return $result;
    }

    public function getusersByCateId($page = 1, $cateId, $total = 8)
    {
        if ($page <= 0) {
            $page = 1;
        }
        $tmp = ($page - 1) * $total;
        $query =
            "SELECT *
			 FROM customers
			 WHERE status = 1 AND id = $id
             LIMIT $tmp,$total";
        $mysqli_result = $this->db->select($query);
        if ($mysqli_result) {
            $result = mysqli_fetch_all($mysqli_result, MYSQLI_ASSOC);
            return $result;
        }
        return false;
    }

    public function update($data, $files)
    {
        $fullname = $data['fullname'];
        $email = $data['email'];
        // $originalPrice = $data['originalPrice'];
        // $promotionPrice = $data['promotionPrice'];
        // $cateId = $data['cateId'];
        // $des = $data['des'];
        // $qty = $data['qty'];

        // $file_name = $_FILES['image']['name'];
        // $file_temp = $_FILES['image']['tmp_name'];

        // $div = explode('.', $file_name);
        // $file_ext = strtolower(end($div));
        // $unique_image = substr(md5(time()), 0, 10) . '.' . $file_ext;
        // $uploaded_image = "upload/" . $unique_image;

        //If user has chooose new image
        if (!empty($file_name)) {
            move_uploaded_file($file_temp, $uploaded_image);
            $query = "UPDATE users SET 
					fullname ='$fullname',
                    email ='$email',
					-- cateId = '$cateId',
					-- originalPrice = '$originalPrice',
					-- promotionPrice = '$promotionPrice',
					-- des = '$des',
					-- qty = '$qty',
					-- image = '$unique_image'
					 WHERE id = " . $data['id'] . " ";
        } else {
            $query = "UPDATE users SET 
					fullname ='$fullname',
                    email ='$email',
					-- cateId = '$cateId',
					-- originalPrice = '$originalPrice',
					-- promotionPrice = '$promotionPrice',
					-- des = '$des',
					-- qty = '$qty'
					 WHERE id = " . $data['id'] . " ";
        }
        $result = $this->db->update($query);
        if ($result) {
            $alert = "<span class='success'>Cập nhật khách hàng thành công</span>";
            return $alert;
        } else {
            $alert = "<span class='error'>Cập nhật khách hàng thất bại</span>";
            return $alert;
        }
    }

    public function getcustombyIdAdmin($id)
    {
        $query = "SELECT * FROM users where id = '$id'";
        $result = $this->db->select($query);
        return $result;
    }

    // public function getProductbyId($id)
    // {
    //     $query = "SELECT * FROM products where id = '$id' AND status = 1";
    //     $mysqli_result = $this->db->select($query);
    //     if ($mysqli_result) {
    //         $result = mysqli_fetch_all($this->db->select($query), MYSQLI_ASSOC)[0];
    //         return $result;
    //     }
    //     return false;
    // }

    // public function block($id)
    // {
    //     $query = "UPDATE products SET status = 0 where id = '$id' ";
    //     $result = $this->db->z($query);
    //     if ($result) {
    //         return true;
    //     } else {
    //         return false;
    //     }
    // }

    // public function active($id)
    // {
    //     $query = "UPDATE products SET status = 1 where id = '$id' ";
    //     $result = $this->db->delete($query);
    //     if ($result) {
    //         return true;
    //     } else {
    //         return false;
    //     }
    // }

    // public function updateQty($id, $qty)
    // {
    //     $query = "UPDATE products SET qty = qty - $qty, soldCount = soldCount + $qty WHERE id = $id";
    //     $mysqli_result = $this->db->update($query);
    //     if ($mysqli_result) {
    //         return true;
    //     }
    //     return false;
    // }

}
?>