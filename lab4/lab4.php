<html>
    <body>
        <?php
            if (isset($_POST['N'])) {
                for ($i = 0; $i < (int)$_POST['N']; $i++) {
                    $upperLower = rand(0,1); // makes it uppercase or lowercase randomly 
                    if ($upperLower == 0) {
                        $character = rand(65,90); //uppercase
                    } else {
                        $character = rand(97,122); // lowercase
                    }
                    echo chr($character);  // print lowercase out
                }
            }
        ?>
        <form action="lab4.php" method="post">
        <input type="vaule" name="N" value="<?php echo isset($_POST['N']) ? $_POST['N'] : 1 ?>" />
        <input type="submit" />
        </form>
    </body>
</html>