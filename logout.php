<?php
/**
 * Created by PhpStorm.
 * User: Ross
 * Date: 2020/10/03
 * Time: 21:47
 */

// Initialize the session
session_start();

// Unset all of the session variables
$_SESSION = array();

// Destroy the session.
session_destroy();

// Redirect to login page
header("location: login.php");
exit;