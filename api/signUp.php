<?php
session_start();
    if(isset($_POST['signup'])){
        function signup(){
            include('./connection.php');
            $email = $_POST['email'];
            $passwordOne = $_POST['passwordOne'];
            $passwordTwo = $_POST['passwordTwo'];
            $phone = $_POST['phone'];
            $name = $_POST['name'];
            //$email = mysqli_real_escape_string($connection, $_POST['email']);
            //$passwordOne = mysqli_real_escape_string($connection, $_POST['passwordOne']);
            //$passwordTwo = mysqli_real_escape_string($connection, $_POST['passwordTwo']);
            //$phone = mysqli_real_escape_string($connection, $_POST['phone']);
            //$name = mysqli_real_escape_string($connection, $_POST['name']);

            if(!empty($email) AND !empty($passwordOne) AND !empty($passwordTwo) AND !empty($phone) AND !empty($name)){
                if($passwordOne === $passwordTwo){
                    $query = "SELECT * FROM users WHERE email = '$email' OR phone = '$phone'";
                    $execute = mysqli_query($connection, $query);
                    if(mysqli_num_rows($execute) < 1){
                        $query = "INSERT INTO users(name,email,password,phone) VALUES('$name', '$email', '$passwordOne',$phone)";
                        $execute = mysqli_query($connection, $query);
                        if($execute){
                            $query = "SELECT * FROM users WHERE email = '$email' OR phone = $phone";
                            $execute = mysqli_query($connection, $query);
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
                                header("Location:../signup.html");
                                exit();                                 
                            }                       
                        }
                        else{
                            echo $name;
                            echo $email;
                            echo $passwordOne;
                            echo $phone;
                            header("Location:../signup.html");
                            exit();                           
                        }
                    }
                    else{
                        header("Location:../signup.html");
                        exit();
                    }
                }
                else{
                    header("Location:.../signup.html");
                    exit();
                }
            }
            else{
                header("Location:.../signup.html");
                exit();                
            }
        }
        signup();
    }
?>