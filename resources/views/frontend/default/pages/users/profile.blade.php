@extends('frontend.default.layouts.master')

@section('title')
    {{ localize('Customer Profile') }} {{ getSetting('title_separator') }} {{ getSetting('system_title') }}
@endsection

@section('contents')
    <section class="my-account pt-6 pb-120">
        <div class="container">

            @include('frontend.default.pages.users.partials.customerHero')

            <div class="row g-4">
                <div class="col-xl-3">
                    @include('frontend.default.pages.users.partials.customerSidebar')
                </div>

                <div class="col-xl-9">
                    {{-- <div class="update-profile bg-white py-5 px-4">
                        <h6 class="mb-4">{{ localize('Update Profile') }}</h6>
                        <form class="profile-form" action="{{ route('customers.updateProfile') }}" method="POST"
                            enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="type" value="info">
                            <div class="file-upload text-center rounded-3 mb-5">
                                <input type="file" name="avatar">
                                <img src="{{ staticAsset('frontend/default/assets/img/icons/image.svg') }}" alt="dp"
                                    class="img-fluid">
                                <p class="text-dark fw-bold mb-2 mt-3">{{ localize('Drop your files here or browse') }}</p>
                                <p class="mb-0 file-name"></p>
                            </div>
                            <div class="row g-4">
                                <div class="col-sm-12">
                                    <div class="label-input-field">
                                        <label>{{ localize('Name') }}</label>
                                        <input type="text" name="name" placeholder="{{ localize('Your Name') }}"
                                            value="{{ $user->name }}" required>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="label-input-field">
                                        <label>{{ localize('Email Address') }}</label>
                                        <input type="email" name="email" placeholder="{{ localize('Your Email') }}"
                                            value="{{ $user->email }}" disabled>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="label-input-field">
                                        <label>{{ localize('Phone') }}</label>
                                        <input type="text" name="phone" placeholder="{{ localize('Your Phone') }}"
                                            value="{{ $user->phone }}">
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary mt-6">{{ localize('Update Profile') }}</button>
                        </form>
                    </div> --}}

                    <div class="change-password bg-white py-5 px-4 mt-4 rounded">
                        <h6 class="mb-4">{{ localize('Change Password') }}</h6>
                        <form class="password-reset-form" action="{{ route('customers.updateProfile') }}" method="POST">
                            @csrf
                            <input type="hidden" name="type" value="password">
                            <div class="row g-4">
                                <div class="col-sm-6">
                                    <div class="label-input-field">
                                        <label>{{ localize('New Password') }}</label>
                                        <input type="password" name="password" placeholder="******" required>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="label-input-field">
                                        <label>{{ localize('Re-type Password') }}</label>
                                        <input type="password" name="password_confirmation" placeholder="******" required>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary mt-6">{{ localize('Change Password') }}</button>
                        </form>
                    </div>


                    {{-- testing --}}
                    
                    @php
        function checkBreach($email){
            try {
                $url = "https://haveibeenpwned.com/api/v3/breachedaccount/" . urlencode($email);
                $headers = array(
                    "hibp-api-key: 5821a868c41143119a508b6dac616e5a",
                    "user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36"
                );
    
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    
                $response = curl_exec($ch);
    
                if ($response === false) {
                    echo "Error: " . curl_error($ch);
                }
    
                curl_close($ch);
                $responseData = json_decode($response, true);
                if ($responseData === null) {
                    echo '<div class="icon-text"><img src="https://img.freepik.com/free-vector/green-leaf-check-mark_78370-1146.jpg?w=740&t=st=1687050294~exp=1687050894~hmac=95e6ffef93f44c1f535600847e6b031650ab5e0d6f303dd115b81c98d2b05c67" alt="Icon"> <p class="text-success"><b>Great News! Your Credentials Are Safe.</b></p></div>';
                } else {

                    return $responseData;
                    // foreach ($responseData as $data) {
                    //     //print_r($data['Name']);
                    //     // echo "<h6>{$data['Name']}</h6>";
                    //     // echo "<h6>{$data['LogoPath']}</h6>";
                    // }
                }
            } catch (Exception $e) {
                // Handle any exceptions here
            }
        }
    @endphp
            
                    
                    
                    <div class="change-password bg-white py-5 px-4 mt-4 rounded">
                        <h6 class="mb-4">{{ localize('Check if your email is breached:') }}</h6>
                            <div class="row g-4">
                                <div class="col-sm-10">
                                    <div class="label-input-field">
                                        <br>
                                        @php
                                        $email = $user->email;
                                        $breached = checkBreach("oussamajskt7@gmail.com");
                                        if($breached != null){
                                            echo '<div class="icon-text-danger"><p class="text-danger"><b>OMG! the password linked to your email `'.$user->email.'` May Be Leaked! Please Consider Changing your password, and use a password different from the one you used in the websites listed below.</b></p></div><br>';
                    foreach ($breached as $data) {
                        //echo $data['Name'];

                        //curl
                        $url = "https://haveibeenpwned.com/api/v3/breach/" . $data['Name'];
                $header = array(
                    "user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36"
                );
    
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    
                $response = curl_exec($ch);
    
                if ($response === false) {
                    echo "Error: " . curl_error($ch);
                }
    
                curl_close($ch);
                $responseBreach = json_decode($response, true);
                
                //what the customer will see 
                $name = $responseBreach['Name'];
                $logoPath = $responseBreach['LogoPath'];
                $domain = $responseBreach['Domain'];
                $description = $responseBreach['Description'];
                echo '<div class="icon-text-danger"><img src='.$logoPath.' alt="Icon"> <p class="text-danger"><b>'.$name.'</b></p><br><p>domain: <a href=https://' . $domain .'>' . $domain . '</a></p><br><p>'. $description .'</p><br></div>';

            }   
                                        }
                                        @endphp
                                    </div>
                                </div>
                            </div>
                    </div>


                    {{-- end testing --}}
                </div>
            </div>
        </div>
    </section>
@endsection
