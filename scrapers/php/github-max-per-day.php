<?php

include('base/common.php');

sleep(90);

$url = 'https://github.com/' . $argv[1];
$content = get_content($url);

$matches = [];
preg_match_all('/data-count="(.*?)"/m', $content, $matches);
$result = '';
if(!empty($matches[1]) && is_array($matches[1])) {
    rsort($matches[1]);
    $result = array_shift($matches[1]);
}
echo $result . "\n";
