<?php
/**
 * Created by PhpStorm.
 * User: Kyle
 * Date: 2020/10/03
 * Time: 15:32
 */
    session_start();

    if(isset($_SESSION['user_id'])) {
        if($_SESSION['role_id'] == 3) {
            $username = (!isset($_SESSION['display_name'])) ? 'User' : $_SESSION['display_name'];
        ?><!DOCTYPE html>
            <html lang="en">
                <head>
                    <link rel="stylesheet" href="css/main.css">
                </head>
                <body>
                    <div class="success defaultstyling">
                        <p>Greetings <strong><?php echo $username; ?></strong>,</p>
                        <p>Congratulations, you are viewing the <h3>Super Admin Page!</h3></p>
                        <a class="button" href="logout.php">Logout</a>
                    </div>
                </body>
            </html>
        <?php
		} else {
			if(isset($_SESSION["default_landing"])) {
				header('Location: '. $_SESSION["default_landing"]);
				exit;
			}
		}
	} else {
		header('Location: login.php');
		exit;
	}

?>