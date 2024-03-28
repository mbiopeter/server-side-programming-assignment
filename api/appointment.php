<?php
session_start();
if(isset($_POST['appointment'])){
    function appointment(){
        include('connection.php');
        $userId = $_SESSION['userId'];
        $departmentId = $_POST['department'];
        $doctorId = $_POST['doctor'];
        $message = $_POST['message'];
        $date = $_POST['date'];
        //$departmentId = mysqli_real_escape_string($connection, $_POST['department']);
        //$doctorId = mysqli_real_escape_string($connection, $_POST['doctor']);
        //$message = mysqli_real_escape_string($connection, $_POST['message']);
        if(!empty($departmentId) AND !empty($doctorId) AND !empty($message)){
            $query = "SELECT * FROM appointment WHERE departmentId = $departmentId AND doctorsId = $doctorId AND userId = $userId AND date = $date";
            $execute = mysqli_query($connection, $query);
            if(mysqli_num_rows($execute) < 1){
                $query = "INSERT INTO appointment(userId,date,departmentId,doctorsId,message,status) VALUES($userId,'$date',$departmentId,$doctorId,'$message','Pending')";
                $execute = mysqli_query($connection, $query);
                if ($execute){
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
        else{
            header("Location:../main.php");
            exit();
        }
    }
    appointment();
}
if(isset($_POST["RemoveAppointment"])){
    function remove(){
        include("./connection.php");
        $appointmentId = $_POST["appointmentId"];
        $query = "DELETE FROM appointment WHERE id = $appointmentId";
        $execute = mysqli_query($connection, $query);
        if($execute){
            header("Location:../main.php");
            exit();
        }
        else{
            header("Location:../main.php");
            exit();
        }
    }
    remove();
}
if(isset($_POST['AcceptAppointment'])){
    function accept(){
        include("./connection.php");
        $appointmentId = $_POST["appointmentId"];
        $query = "UPDATE appointment SET status = 'Accepted' WHERE Id = '$appointmentId'";
        $execute = mysqli_query($connection, $query);
        if($execute){
            header("Location:../main.php");
            exit();
        }
        else{
            header("Location:../main.php");
            exit();
        }
    }
    accept();
}
if(isset($_POST['RejectAppointment'])){
    function reject(){
        include("./connection.php");
        $appointmentId = $_POST["appointmentId"];
        $query = "UPDATE appointment SET status = 'Rejected' WHERE Id = '$appointmentId'";
        $execute = mysqli_query($connection, $query);
        if($execute){
            header("Location:../main.php");
            exit();
        }
        else{
            header("Location:../main.php");
            exit();
        }
    }
    reject();
}
?>