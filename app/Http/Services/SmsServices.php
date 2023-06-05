<?php

namespace App\Http\Services;

use Exception;
use Illuminate\Support\Facades\Http;

class SmsServices
{
    # send sms with vonage
    public function sendSMS($to, $text)
    {

            try {
                $url = "https://rest.nexmo.com/sms/json";
                $data = array(
                    "from" => "Flowerly",
                    "text" => $text,
                    "to" => $to,
                    "api_key" => "8fba9eb7",
                    "api_secret" => "eDGtmXg7mq9fhj17");
                    $ch = curl_init($url);
                    curl_setopt($ch, CURLOPT_POST, true);
                    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                    $response = curl_exec($ch);
                    
                    if ($response === false) {
                        echo "Error: " . curl_error($ch);
                    }
                    curl_close($ch);
            } catch (Exception $e) {
                // dd($e);
            }
    }

    # phone verification
    public function phoneVerificationSms($to, $code)
    {
        $sms = 'Your verification code for Flowerly is ' . $code . '.';
        $this->sendSMS($to, $sms);
    }

    # forgot password
    public function forgotPasswordSms($to, $code)
    {
        $sms = 'Your password reset code for your Flowerly account is ' . $code . '.';
        $this->sendSMS($to, $sms);
    }
}