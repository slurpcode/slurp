<?php
require 'base/common.php';

function Get_Energy_points($user)
{
    $url = "https://www.khanacademy.org/profile/$user/";
    $content = get_content($url);
    preg_match('/points":(\\d+),"prefersReducedMotion/', $content, $matches);
    return ($matches[1] ? $matches[1] : 'Not found').PHP_EOL;
}

echo Get_Energy_points('XSLTGod'); // Put username...
