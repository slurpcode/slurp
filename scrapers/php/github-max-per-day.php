<?php
/**
 * Fetching the max contributions per day from github
 *
 * PHP version 7
 *
 * @file
 * This file can be used to fetch number of maximum contributions per day
 * from github account page
 *
 * @category CLI_Script
 * @author   "Aleksandar Jakovljevic aleksandarjakovljevic@gmail.com"
 * @license  https://www.gnu.org/licenses/gpl-3.0.html GNU GENERAL PUBLIC LICENSE
 * @link     https://github.com/slurpcode/slurp
 * @Package  scrappers
 */

require_once 'base/common.php';

sleep(90);

$url = 'https://github.com/' . $argv[1];
$content = get_content($url);

$matches = [];
preg_match_all('/data-count="(.*?)"/m', $content, $matches);
$result = '';
if (!empty($matches[1]) && is_array($matches[1])) {
    rsort($matches[1]);
    $result = array_shift($matches[1]);
}
echo $result . "\n";
