<?php
session_start();
    if(isset($_POST['signin'])){
        function signin(){
            include('./connection.php');
            $email = $_POST['email'];
            $password = $_POST['password'];
            //$subject = mysqli_real_escape_string($connection, $_POST['email']);
            //$subject = mysqli_real_escape_string($connection, $_POST['password']);
            if(!empty($email) AND !empty($password)){
                //check if the credential exists in the db
                $query = "SELECT * FROM users WHERE email = '$email' AND password = '$password'";
                $execute = mysqli_query($connection,$query);
                if(mysqli_num_rows($execute) > 0){
                    $row = mysqli_fetch_array($execute);
                    if(isset($_SESSION['doctorId'])){
                        unset($_SESSION['doctorId']);
                    }
                    $_SESSION['userId'] = $row['id'];
                    header("Location:../main.php");
                    exit();
                }
                else{
                   //check if the user is a doctor
                   $query = "SELECT * FROM doctors WHERE email = '$email' AND password = '$password'";
                   $execute = mysqli_query($connection,$query);
                    if(mysqli_num_rows($execute) > 0){
                        $row = mysqli_fetch_array($execute);
                        if(isset($_SESSION['userId'])){
                            unset($_SESSION['userId']);
                        }
                        $_SESSION['doctorId'] = $row['id'];
                        header("Location:../main.php");
                        exit();
                    }   
                    else{
                        header("Location:../main.php");
                        exit();                       
                    }             
                }
            }
            else{
                header("Location:../index.html");
                exit();
            }
        }
        signin();
    }
?>