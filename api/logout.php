<?php
session_start();
if(isset($_POST['logout'])){
    function logout(){
        include("./connection.php");
        if(isset($_SESSION['userId'])){
            unset($_SESSION['userId']);
            mysqli_close($connection);
            header("Location:../index.html");
            exit();
        }
        if(isset($_SESSION['doctorId'])){
            unset($_SESSION['doctorId']);
            header("Location:../index.html");
            exit();
            mysqli_close($connection);
        }
    }
    logout();
}
?>