<?php
// get the data from the POST message
$post_data = json_decode(file_get_contents('php://input'), true);
$data = $post_data['filedata'];
$filename = $post_data['filename'];
// the directory "data" must be writable by the server
echo "data in php file: ";
echo $data;
$home='/home/narcjfsi/tasks.narclab.com';//getenv("HOME");
$relpath="manifests/{$filename}"; 
$path=$home."/".$relpath;
echo "writing file to ";
echo $path;
// write the file to disk
file_put_contents($path, $data);
?>