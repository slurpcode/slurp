<?php

/**
 * Fetching the energy points from Khan Academy profile
 *
 * PHP version 7
 *
 * @file
 * This file can be used to fetch the energy points
 * from Khan Academy user profile
 * usage: php khan.php khanAcademyUsername
 *
 * @category CLI_Script
 * @author   "Aleksandar Jakovljevic aleksandarjakovljevic@gmail.com"
 * @license  https://www.gnu.org/licenses/gpl-3.0.html GNU GENERAL PUBLIC LICENSE
 * @link     https://github.com/slurpcode/slurp
 * @Package  scrapers
 */

include('base/common.php');

/**
 * @return string Timestamp in miliseconds
 */
function millitime()
{
    $microtime = microtime();
    $comps = explode(' ', $microtime);

    // Note: Using a string here to prevent loss of precision
    // in case of "overflow" (PHP converts it to a double)
    return sprintf('%d%03d', $comps[1], $comps[0] * 1000);
}

/**
 * @param $dashParameter
 * @param $user
 * @return bool|string
 */
function getFullUserProfile($dashParameter, $user)
{
    $url = "https://www.khanacademy.org/api/internal/graphql/getFullUserProfile?lang=en&_=" . $dashParameter;

    $curl = curl_init();

    curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS => '{
            "operationName": "getFullUserProfile",
            "variables": {
                "username": "' . $user . '"
            },
            "query": "query getFullUserProfile($kaid: String, $username: String) {\\n  user(kaid: $kaid, username: $username) {\\n    id\\n    kaid\\n    key\\n    userId\\n    email\\n    username\\n    profileRoot\\n    gaUserId\\n    qualarooId\\n    isPhantom\\n    isDeveloper: hasPermission(name: \\"can_do_what_only_admins_can_do\\")\\n    isCurator: hasPermission(name: \\"can_curate_tags\\", scope: ANY_ON_CURRENT_LOCALE)\\n    isCreator: hasPermission(name: \\"has_creator_role\\", scope: ANY_ON_CURRENT_LOCALE)\\n    isPublisher: hasPermission(name: \\"can_publish\\", scope: ANY_ON_CURRENT_LOCALE)\\n    isModerator: hasPermission(name: \\"can_moderate_users\\", scope: GLOBAL)\\n    isParent\\n    isSatStudent\\n    isTeacher\\n    isDataCollectible\\n    isChild\\n    isOrphan\\n    isCoachingLoggedInUser\\n    canModifyCoaches\\n    nickname\\n    hideVisual\\n    joined\\n    points\\n    countVideosCompleted\\n    publicBadges {\\n      badgeCategory\\n      description\\n      isOwned\\n      isRetired\\n      name\\n      points\\n      absoluteUrl\\n      hideContext\\n      icons {\\n        smallUrl\\n        compactUrl\\n        emailUrl\\n        largeUrl\\n        __typename\\n      }\\n      relativeUrl\\n      safeExtendedDescription\\n      slug\\n      translatedDescription\\n      translatedSafeExtendedDescription\\n      __typename\\n    }\\n    bio\\n    background {\\n      name\\n      imageSrc\\n      __typename\\n    }\\n    soundOn\\n    muteVideos\\n    prefersReducedMotion\\n    noColorInVideos\\n    autocontinueOn\\n    avatar {\\n      name\\n      imageSrc\\n      __typename\\n    }\\n    hasChangedAvatar\\n    newNotificationCount\\n    canHellban: hasPermission(name: \\"can_ban_users\\", scope: GLOBAL)\\n    canMessageUsers: hasPermission(name: \\"can_send_moderator_messages\\", scope: GLOBAL)\\n    discussionBanned\\n    isSelf: isActor\\n    hasStudents: hasCoachees\\n    hasClasses\\n    hasChildren\\n    hasCoach\\n    badgeCounts\\n    homepageUrl\\n    isMidsignupPhantom\\n    includesDistrictOwnedData\\n    preferredKaLocale {\\n      id\\n      kaLocale\\n      status\\n      __typename\\n    }\\n    underAgeGate {\\n      parentEmail\\n      daysUntilCutoff\\n      approvalGivenAt\\n      __typename\\n    }\\n    authEmails\\n    signupDataIfUnverified {\\n      email\\n      emailBounced\\n      __typename\\n    }\\n    pendingEmailVerifications {\\n      email\\n      unverifiedAuthEmailToken\\n      __typename\\n    }\\n    tosAccepted\\n    shouldShowAgeCheck\\n    __typename\\n  }\\n  actorIsImpersonatingUser\\n}\\n"
        }',
        CURLOPT_HTTPHEADER => array(
            'authority: www.khanacademy.org',
            'pragma: no-cache',
            'cache-control: no-cache',
            'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="90", "Google Chrome";v="90"',
            'accept: */*',
            'sec-ch-ua-mobile: ?0',
            'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36',
            'content-type: application/json',
            'origin: https://www.khanacademy.org',
            'sec-fetch-site: same-origin',
            'sec-fetch-mode: cors',
            'sec-fetch-dest: empty',
            'referer: https://www.khanacademy.org/profile/' . $user . '/',
            'accept-language: en-GB,en;q=0.9,sr-RS;q=0.8,sr;q=0.7,en-US;q=0.6'
        ),
    ));

    $response = curl_exec($curl);

    curl_close($curl);
    return $response;
}

/**
 * @param $user
 * @return mixed|string
 */
function getEnergyPoints($user)
{
    $url = "https://www.khanacademy.org/profile/" . $user . "/";
    $content = get_content($url);
    preg_match('/\"x-ka-static-version\":\"([^\"]*)\"/m', $content, $matches);
    $staticVersion = $matches[1];
    $millisecondsTime = millitime();
    $dashParameter = $staticVersion . '_' . $millisecondsTime;

    $fullUserProfile = getFullUserProfile($dashParameter, $user);
    $fullUserProfileDecoded = json_decode($fullUserProfile, true);

    return isset($fullUserProfileDecoded['data']['user']['points']) ?
        $fullUserProfileDecoded['data']['user']['points'] : '';
}

sleep(90);

$points = getEnergyPoints($argv[1]);

echo $points . PHP_EOL;
