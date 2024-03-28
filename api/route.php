<?php
session_start();
//check if the user is loged in
if(!isset($_SESSION['userId']) && !isset($_SESSION['doctorId'])){
    //redirect back to login page
    header('Location: index.html');
    exit();
}
?>