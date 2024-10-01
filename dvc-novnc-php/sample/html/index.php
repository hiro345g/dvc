<?php
function hello($message)
{
    echo "Hello, php-apache!, $message";
}
?>
<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <title>php-apache</title>
</head>

<body>
    <h1><?php print("php-apache"); ?></h1>
    <p><?php hello("こんにちは"); ?></p>
    <?php phpinfo(); ?>
</body>

</html>