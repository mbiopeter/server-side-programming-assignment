<?php
session_start();
if(isset($_POST['contact'])){
    function contact(){
        include("./connection.php");
        $userId = $_SESSION['userId'];
        $subject = $_POST['subject'];
        $message = $_POST['message'];
        //$subject = mysqli_real_escape_string($connection, $_POST['subject']);
        //$message = mysqli_real_escape_string($connection, $_POST['message']);
        if(!empty($subject) AND !empty($message)){
            $query = "SELECT * FROM contact WHERE userId = $userId AND subject ='$subject' AND message = '$message'";
            $execute = mysqli_query($connection, $query);
            if(mysqli_num_rows($execute) < 1){
                $query = "INSERT INTO contact(userid,message,subject) VALUES ('$userId', '$message', '$subject')";
                $execute = mysqli_query($connection,$query);
                header("Location:../main.php");
                exit();             
            }
            else{
                header("Location:../main.php");
                exit();
            }
        }
        else{
            header("Location:../main.php");
            exit();
        }
    }
    contact();
}

?>