<?php

    include('base/common.php');

    function get_energy_points($user){
        $url = "https://www.khanacademy.org/profile/$user/";
        $content = get_content($url);
        preg_match('/points":(\\d+),"prefersReducedMotion/', $content, $matches);
        return ($matches[1] ? $matches[1] : 'Not found').PHP_EOL;
    }

    echo get_energy_points('XSLTGod');
