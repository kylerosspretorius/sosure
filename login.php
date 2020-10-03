<?php

include('config.php');

session_start();

// Check if the user is already logged in, if yes then redirect him to specific page or default
if(isset($_SESSION["user_id"])){
    if(isset($_SESSION["default_landing"])) {
        header('Location: '. $_SESSION["default_landing"]);
        exit;
    }
}


if (isset($_POST['login'])) {

    $username = $_POST['username'];
    $password = $_POST['password'];

    $query = $connection->prepare("SELECT u.ID, u.display_name, u.password, r.default_landing, u.role_id FROM users u, roles r WHERE u.username=:username AND u.role_id = r.id");
    $query->bindParam("username", $username, PDO::PARAM_STR);
    $query->execute();

    $result = $query->fetch(PDO::FETCH_ASSOC);

    if (!$result) {
        echo '<p class="error">Username password combination is wrong!</p>';
    } else {
        if (password_verify($password, $result['password'])) {
            $_SESSION['user_id'] = $result['ID'];
            $_SESSION['default_landing'] = $result['default_landing'];
			$_SESSION['role_id'] = $result['role_id'];
            $_SESSION['display_name'] = $result['display_name'];
            echo '<p class="success">Congratulations, you are logged in!</p>';
            sleep(1);
            header('Location: '. $_SESSION["default_landing"]);
            exit;

        } else {
            echo '<p class="error">Username password combination is wrong!</p>';
        }
    }
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="css/main.css">
</head>

<body>
<div id="wrap">
    <div class="container">
        <div class="row">

            <form method="post" action="" name="signin-form">
                <div class="form-element">
                    <label>Username</label>
                    <input type="text" name="username" pattern="[a-zA-Z0-9]+" required />
                </div>
                <div class="form-element">
                    <label>Password</label>
                    <input type="password" name="password" required />
                </div>
                <button type="submit" name="login" value="login">Log In</button>
            </form>

        </div>
    </div>
</div>
</body>

</html>