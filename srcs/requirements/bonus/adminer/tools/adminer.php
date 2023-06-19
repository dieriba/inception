if(!count($_GET)) {
  $_POST['auth'] = [
    'server' => mariadb:3306,
    'username' => gettenv('MARIADB_ADMIN_USERNAME'),
    'password' => gettenv('MARIADB_ADMIN_PASSWORD'),
    'db'    => gettenv('MARIADB_DB_NAME')
  ];
}

include "./index.php";