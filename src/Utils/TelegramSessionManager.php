<?php

declare(strict_types=1);

namespace App\Utils;

use App\Models\TelegramSession;

final class TelegramSessionManager
{
    public static function generateRandomLink()
    {
        $i = 0;
        for ($i = 0; $i < 10; $i++) {
            $token = Tools::genRandomChar(16);
            $Elink = TelegramSession::where('session_content', '=', $token)->first();
            if ($Elink === null) {
                return $token;
            }
        }

        return "couldn't alloc token";
    }

    public static function generateLoginRandomLink()
    {
        $i = 0;
        for ($i = 0; $i < 10; $i++) {
            $token = Tools::genRandomChar(16);
            $number = random_int(100000, 999999);
            $Elink = TelegramSession::where('session_content', 'LIKE', $token . '|%')->orWhere('session_content', 'LIKE', '%|' . $number)->first();
            if ($Elink === null) {
                return $token . '|' . $number;
            }
        }

        return "couldn't alloc token";
    }

    public static function addBindSession($user)
    {
        $Elink = TelegramSession::where('type', '=', 0)->where('user_id', '=', $user->id)->first();
        if ($Elink !== null) {
            $Elink->datetime = \time();
            $Elink->session_content = self::generateRandomLink();
            $Elink->save();
            return $Elink->session_content;
        }

        $NLink = new TelegramSession();
        $NLink->type = 0;
        $NLink->user_id = $user->id;
        $NLink->datetime = \time();
        $NLink->session_content = self::generateRandomLink();
        $NLink->save();

        return $NLink->session_content;
    }

    public static function verifyBindSession($token)
    {
        $Elink = TelegramSession::where('type', '=', 0)->where('session_content', $token)->where('datetime', '>', \time() - 600)->orderBy('datetime', 'desc')->first();
        if ($Elink !== null) {
            $uid = $Elink->user_id;
            $Elink->delete();
            return $uid;
        }
        return 0;
    }

    public static function addLoginSession()
    {
        $NLink = new TelegramSession();
        $NLink->type = 1;
        $NLink->user_id = 0;
        $NLink->datetime = \time();
        $NLink->session_content = self::generateLoginRandomLink();
        $NLink->save();

        return $NLink->session_content;
    }

    public static function verifyLoginSession($token, $uid)
    {
        $Elink = TelegramSession::where('type', '=', 1)->where('user_id', 0)->where('session_content', 'LIKE', $token . '|%')->where('datetime', '>', \time() - 90)->orderBy('datetime', 'desc')->first();
        if ($Elink !== null) {
            $Elink->user_id = $uid;
            $Elink->save();
            return $uid;
        }
        return 0;
    }

    public static function verifyLoginNumber($token, $uid)
    {
        $Elink = TelegramSession::where('type', '=', 1)->where('user_id', 0)->where('session_content', 'LIKE', '%|' . $token)->where('datetime', '>', \time() - 90)->orderBy('datetime', 'desc')->first();
        if ($Elink !== null) {
            $Elink->user_id = $uid;
            $Elink->save();
            return $uid;
        }
        return 0;
    }

    public static function step2VerifyLoginSession($token, $number)
    {
        $Elink = TelegramSession::where('type', '=', 1)->where('session_content', $token . '|' . $number)->where('datetime', '>', \time() - 90)->orderBy('datetime', 'desc')->first();
        if ($Elink !== null) {
            $uid = $Elink->user_id;
            $Elink->delete();
            return $uid;
        }
        return 0;
    }

    public static function checkLoginSession($token, $number)
    {
        $Elink = TelegramSession::where('type', '=', 1)->where('session_content', $token . '|' . $number)->orderBy('datetime', 'desc')->first();
        if ($Elink !== null) {
            if ($Elink->datetime < \time() - 90) {
                return -1;
            }
            return $Elink->user_id;
        }
        return 0;
    }
}
