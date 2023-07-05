<header class="gheader position-relative z-2 header-sticky">
    <div class="ghead-topbar bg-primary d-none d-lg-block">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-xxl-4 col-xl-3">
                    <div class="topbar-info d-none d-xl-block">
                        <p class="text-white fs-sm fw-medium mb-0"></p>
                    </div>
                </div>
                <div class="col-xxl-8 col-xl-9">

                    <ul
                        class="d-flex align-items-center justify-content-center justify-content-xl-end topbar-info-right">


                        @php
                            if (Session::has('locale')) {
                                $locale = Session::get('locale', Config::get('app.locale'));
                            } else {
                                $locale = env('DEFAULT_LANGUAGE');
                            }
                            $currentLanguage = \App\Models\Language::where('code', $locale)->first();
                            
                            if ($currentLanguage == null) {
                                $currentLanguage = \App\Models\Language::where('code', 'en')->first();
                            }
                        @endphp

                        

                        @php
                            if (Session::has('currency_code')) {
                                $currency_code = Session::get('currency_code', Config::get('app.currency_code'));
                            } else {
                                $currency_code = env('DEFAULT_CURRENCY');
                            }
                            $currentCurrency = \App\Models\Currency::where('code', $currency_code)->first();
                            
                            if ($currentCurrency == null) {
                                $currentCurrency = \App\Models\Currency::where('code', 'usd')->first();
                            }
                        @endphp

                        

                        <li class="nav-item">
                            <a href="javascript:void(0)" class="btn btn-link p-0 tt-theme-toggle fw-normal">
                                <div class="tt-theme-light" data-bs-toggle="tooltip" data-bs-placement="left"
                                    data-bs-title="Dark">{{ localize('Dark') }} <i class="fas fa-moon fs-lg ms-1"></i>
                                </div>
                                <div class="tt-theme-dark" data-bs-toggle="tooltip" data-bs-placement="left"
                                    data-bs-title="Light">{{ localize('Light') }} <i class="fas fa-sun fs-lg ms-1"></i>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="gshop-navbar bg-white rounded ps-lg-5 position-relative">
            <div class="row align-items-center">
                <div class="col-xxl-2 col-xl-3 col-md-3 col-5">
                    <a href="{{ route('home') }}" class="logo"><img
                            src="{{ uploadedAsset(getSetting('navbar_logo')) }}" alt="logo" class="img-fluid"></a>
                </div>
                <div class="col-xxl-10 col-xl-9 col-md-9 col-7">
                    <div class="gshop-navbar-right d-flex align-items-center justify-content-end position-relative">
                        <div class="category-dropdown position-relative d-none d-md-inline-block">

                            <a href="javascript:void(0)"
                                class="category-dropdown-btn fw-bold d-none d-sm-inline-block">{{ localize('Occasions') }}<span
                                    class="ms-1"><i class="fa-solid fa-angle-down"></i></span></a>

                            <div class="category-dropdown-box scrollbar">
                                <ul class="category-dropdown-menu">
                                    @php
                                        $categories = [];
                                        if (getSetting('navbar_categories') != null) {
                                            $categories = \App\Models\Category::whereIn('id', json_decode(getSetting('navbar_categories')))->get();
                                        }
                                    @endphp
                                    @foreach ($categories as $navbarCat)
                                        <li>
                                            <a href="{{ route('products.index') }}?&category_id={{ $navbarCat->id }}"
                                                class="d-flex align-items-center">
                                                <div class="me-2 avatar-icon">
                                                    <img src="{{ uploadedAsset($navbarCat->collectLocalization('thumbnail_image')) }}"
                                                        alt="" class="rounded-circle h-100 w-100">
                                                </div>
                                                <span>{{ $navbarCat->collectLocalization('name') }}</span>
                                            </a>
                                        </li>
                                    @endforeach

                                </ul>
                            </div>
                        </div>
                        <nav class="gshop-navmenu ms-3 d-none d-xl-block">
                            <ul class="d-flex align-itmes-center justify-content-end">
                                <li><a href="{{ route('home') }}">{{ localize('Home') }}</a></li>
                                <li><a href="{{ route('products.index') }}">{{ localize('Bouquets') }}</a></li>
                                {{-- <li><a href="{{ route('home.campaigns') }}">{{ localize('Campaigns') }}</a> --}}
                                </li>
                                <li><a href="{{ route('home.coupons') }}">{{ localize('Coupons') }}</a>
                                </li>

                                <li class="has-submenu">
                                    <a href="javascript:void(0);">{{ localize('Pages') }}<span
                                            class="ms-1 fs-xs float-end"><i
                                                class="fa-solid fa-angle-down"></i></span></a>
                                    <ul>
                                        @php
                                            $pages = [];
                                            if (getSetting('navbar_pages') != null) {
                                                $pages = \App\Models\Page::whereIn('id', json_decode(getSetting('navbar_pages')))->get();
                                            }
                                        @endphp

                                        {{-- <li><a href="{{ route('home.blogs') }}">{{ localize('Blogs') }}</a></li> --}}
                                        <li><a
                                                href="{{ route('home.pages.aboutUs') }}">{{ localize('About Us') }}</a>
                                        </li>
                                        <li><a
                                                href="{{ route('home.pages.contactUs') }}">{{ localize('Contact Us') }}</a>
                                        </li>

                                        @foreach ($pages as $navbarPage)
                                            <li>
                                                <a href="{{ route('home.pages.show', $navbarPage->slug) }}"
                                                    class="d-flex align-items-center">
                                                    <span>{{ $navbarPage->collectLocalization('title') }}</span>
                                                </a>
                                            </li>
                                        @endforeach
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                        <div
                            class="gshop-header-icons d-none d-md-inline-flex align-items-center justify-content-end ms-3">
                            
                            <div class="gshop-header-user position-relative">
                                <button type="button" class="header-icon">
                                    <svg width="18" height="25" viewBox="0 0 22 25" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="M11.092 11.9546C12.6656 11.9546 14.0281 11.3902 15.1416 10.2766C16.2547 9.16322 16.8193 7.80093 16.8193 6.2271C16.8193 4.65382 16.2549 3.29134 15.1414 2.1776C14.0279 1.0644 12.6654 0.5 11.092 0.5C9.51825 0.5 8.156 1.0644 7.04266 2.17778C5.92931 3.29116 5.36475 4.65363 5.36475 6.2271C5.36475 7.80093 5.92931 9.1634 7.04266 10.2768C8.15636 11.39 9.51879 11.9546 11.092 11.9546ZM8.0281 3.16308C8.88239 2.30877 9.88453 1.89349 11.092 1.89349C12.2993 1.89349 13.3017 2.30877 14.1561 3.16308C15.0104 4.01757 15.4259 5.01992 15.4259 6.2271C15.4259 7.43464 15.0104 8.43681 14.1561 9.2913C13.3017 10.1458 12.2993 10.5611 11.092 10.5611C9.88489 10.5611 8.88275 10.1456 8.0281 9.2913C7.17364 8.43699 6.7582 7.43464 6.7582 6.2271C6.7582 5.01992 7.17364 4.01757 8.0281 3.16308Z"
                                            fill="#5D6374" stroke="#5D6374" stroke-width="0.2" />
                                        <path
                                            d="M21.1339 18.893C21.1012 18.4201 21.0352 17.9043 20.9379 17.3596C20.8397 16.8108 20.7133 16.292 20.562 15.8178C20.4055 15.3277 20.1931 14.8438 19.9301 14.38C19.6575 13.8986 19.3371 13.4794 18.9776 13.1345C18.6016 12.7736 18.1414 12.4835 17.6091 12.2719C17.0787 12.0614 16.4909 11.9547 15.8621 11.9547C15.6152 11.9547 15.3763 12.0564 14.9151 12.3576C14.6313 12.5433 14.2993 12.7581 13.9287 12.9956C13.6118 13.1982 13.1825 13.3879 12.6523 13.5598C12.135 13.7277 11.6098 13.8129 11.0912 13.8129C10.5729 13.8129 10.0477 13.7277 9.53001 13.5598C9.00034 13.3881 8.57088 13.1984 8.25455 12.9958C7.88747 12.7605 7.55527 12.5457 7.26718 12.3574C6.80634 12.0562 6.56753 11.9545 6.32059 11.9545C5.69163 11.9545 5.10401 12.0614 4.57378 12.2721C4.04189 12.4833 3.58143 12.7734 3.20512 13.1347C2.84561 13.4798 2.52522 13.8988 2.25281 14.38C1.99019 14.8438 1.77758 15.3276 1.62108 15.818C1.46993 16.2922 1.34351 16.8108 1.24533 17.3596C1.14788 17.9035 1.082 18.4195 1.04933 18.8935C1.01722 19.3569 1.00098 19.8393 1.00098 20.3266C1.00098 21.5934 1.40238 22.6189 2.19394 23.3752C2.97572 24.1216 4.00996 24.5 5.26808 24.5H16.9157C18.1735 24.5 19.2077 24.1216 19.9897 23.3752C20.7814 22.6194 21.1828 21.5935 21.1828 20.3264C21.1826 19.8374 21.1662 19.3551 21.1339 18.893ZM19.0123 22.3449C18.4957 22.8381 17.8099 23.0779 16.9155 23.0779H5.26808C4.37354 23.0779 3.68773 22.8381 3.17135 22.3451C2.66474 21.8613 2.41854 21.2008 2.41854 20.3266C2.41854 19.8718 2.43349 19.4229 2.46339 18.9918C2.49255 18.569 2.55216 18.1044 2.64056 17.6108C2.72786 17.1233 2.83896 16.6658 2.9711 16.2516C3.09789 15.8545 3.27082 15.4612 3.48527 15.0824C3.68995 14.7214 3.92544 14.4116 4.18529 14.1621C4.42835 13.9286 4.73471 13.7375 5.0957 13.5942C5.42956 13.4616 5.80476 13.3891 6.21208 13.3781C6.26172 13.4046 6.35012 13.4552 6.49334 13.5488C6.78475 13.7394 7.12064 13.9567 7.49197 14.1946C7.91054 14.4624 8.44981 14.7042 9.09409 14.9128C9.75277 15.1265 10.4245 15.235 11.0913 15.235C11.7581 15.235 12.4301 15.1265 13.0884 14.913C13.7333 14.704 14.2723 14.4624 14.6915 14.1943C15.0715 13.9506 15.3979 13.7395 15.6894 13.5488C15.8326 13.4553 15.921 13.4046 15.9706 13.3781C16.3781 13.3891 16.7533 13.4616 17.0874 13.5942C17.4482 13.7375 17.7545 13.9288 17.9976 14.1621C18.2574 14.4114 18.4929 14.7212 18.6976 15.0826C18.9122 15.4612 19.0854 15.8547 19.212 16.2515C19.3443 16.6662 19.4556 17.1235 19.5427 17.6106C19.6309 18.1052 19.6907 18.5699 19.7199 18.992V18.9924C19.7499 19.4218 19.7651 19.8705 19.7653 20.3266C19.7651 21.201 19.5189 21.8613 19.0123 22.3449Z"
                                            fill="#5D6374" stroke="#5D6374" stroke-width="0.2" />
                                    </svg>
                                </button>
                                <div class="user-menu-wrapper">
                                    <ul class="user-menu">
                                        @auth
                                            @if (auth()->user()->user_type == 'customer')
                                                <li><a href="{{ route('customers.dashboard') }}"><span class="me-2"><i
                                                                class="fa-solid fa-user"></i></span>{{ localize('My Account') }}</a>
                                                </li>
                                                <li><a href="{{ route('customers.orderHistory') }}"><span
                                                            class="me-2"><i
                                                                class="fa-solid fa-tags"></i></span>{{ localize('My Orders') }}</a>
                                                </li>
                                                <li><a href="{{ route('customers.wishlist') }}"><span class="me-2"><i
                                                                class="fa-solid fa-heart"></i></span>{{ localize('My Wishlist') }}</a>
                                                </li>
                                            @else
                                                <li><a href="{{ route('admin.dashboard') }}"><span class="me-2"><i
                                                                class="fa-solid fa-bars"></i></span>{{ localize('Dashboard') }}</a>
                                                </li>
                                            @endif

                                            <li><a href="{{ route('logout') }}"><span class="me-2"><i
                                                            class="fa-solid fa-arrow-right-from-bracket"></i></span>{{ localize('Sign Out') }}
                                                </a></li>
                                        @endauth


                                        @guest
                                            <li><a href="{{ route('login') }}"><span class="me-2"><i
                                                            class="fa-solid fa-arrow-right-from-bracket"></i></span>{{ localize('Sign In') }}</a>
                                            </li>
                                        @endguest


                                    </ul>
                                </div>
                            </div>
                            <div class="gshop-header-cart position-relative">
                                @php
                                    $carts = [];
                                    if (Auth::check()) {
                                        $carts = App\Models\Cart::where('user_id', Auth::user()->id)
                                            ->where('location_id', session('stock_location_id'))
                                            ->get();
                                    } else {
                                        if (isset($_COOKIE['guest_user_id'])) {
                                            $carts = App\Models\Cart::where('guest_user_id', (int) $_COOKIE['guest_user_id'])
                                                ->where('location_id', session('stock_location_id'))
                                                ->get();
                                        }
                                    }
                                @endphp


                                <button type="button" class="header-icon">
                                    <svg width="18" height="25" viewBox="0 0 22 25" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="M21.1704 23.9559L19.6264 7.01422C19.5843 6.55156 19.1908 6.19718 18.7194 6.19718H15.5355V4.78227C15.5355 2.14533 13.3583 0 10.6823 0C8.00628 0 5.82937 2.14533 5.82937 4.78227V6.19718H2.6433C2.17192 6.19718 1.77839 6.55156 1.73625 7.01422L0.186259 24.0225C0.163431 24.2735 0.248671 24.5223 0.421216 24.7082C0.593761 24.8941 0.837705 25 1.0933 25H20.2695C20.2702 25 20.2712 25 20.2719 25C20.775 25 21.1826 24.5982 21.1826 24.1027C21.1825 24.0528 21.1784 24.0036 21.1704 23.9559ZM7.65075 4.78227C7.65075 3.1349 9.01071 1.79465 10.6824 1.79465C12.3542 1.79465 13.7142 3.1349 13.7142 4.78227V6.19718H7.65075V4.78227ZM2.08948 23.2055L3.47591 7.99183H5.82937V9.59649C5.82937 10.0921 6.237 10.4938 6.74006 10.4938C7.24313 10.4938 7.65075 10.0921 7.65075 9.59649V7.99183H13.7142V9.59649C13.7142 10.0921 14.1219 10.4938 14.6249 10.4938C15.128 10.4938 15.5356 10.0921 15.5356 9.59649V7.99183H17.8869L19.2733 23.2055H2.08948Z"
                                            fill="#5D6374" />
                                    </svg>
                                    <span
                                        class="cart-counter badge bg-primary rounded-circle p-0 {{ count($carts) > 0 ? '' : 'd-none' }}">{{ count($carts) }}</span>
                                </button>
                                <div class="cart-box-wrapper">
                                    <div class="apt_cart_box theme-scrollbar">
                                        <ul class="at_scrollbar scrollbar cart-navbar-wrapper">
                                            <!--cart listing-->
                                            @include('frontend.default.pages.partials.carts.cart-navbar', [
                                                'carts' => $carts,
                                            ])
                                            <!--cart listing-->

                                        </ul>
                                        <div class="d-flex align-items-center justify-content-between mt-3">
                                            <h6 class="mb-0">{{ localize('Subtotal') }}:</h6>
                                            <span
                                                class="fw-semibold text-secondary sub-total-price">{{ formatPrice(getSubTotal($carts, false)) }}</span>
                                        </div>
                                        <div class="row align-items-center justify-content-between">
                                            <div class="col-6">
                                                <a href="{{ route('carts.index') }}"
                                                    class="btn btn-secondary btn-md mt-4 w-100"><span
                                                        class="me-2"><i
                                                            class="fa-solid fa-shopping-bag"></i></span>{{ localize('View Cart') }}</a>
                                            </div>
                                            <div class="col-6">
                                                <a href="{{ route('checkout.proceed') }}"
                                                    class="btn btn-primary btn-md mt-4 w-100"><span class="me-2"><i
                                                            class="fa-solid fa-credit-card"></i></span>{{ localize('Checkout') }}</a>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button class="gshop-offcanvas-btn offcanvas-toggle ms-3">
                            <svg width="30" height="30" viewBox="0 0 30 30" fill="none"
                                xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M3.5892 0C1.66061 0 0.0917969 1.56893 0.0917969 3.4974C0.0917969 5.42588 1.65997 6.9947 3.5892 6.9947C5.51844 6.9947 7.08661 5.42588 7.08661 3.4974C7.08661 1.56893 5.51768 0 3.5892 0Z"
                                    fill="white" />
                                <path
                                    d="M14.909 0C12.9805 0 11.4116 1.56893 11.4116 3.4974C11.4116 5.42588 12.9805 6.9947 14.909 6.9947C16.8376 6.9947 18.4068 5.42588 18.4068 3.4974C18.4068 1.56893 16.8383 0 14.909 0Z"
                                    fill="white" />
                                <path
                                    d="M26.411 6.99481C28.3391 6.99481 29.9084 5.42599 29.9084 3.49751C29.9084 1.56903 28.3404 0 26.411 0C24.4815 0 22.9136 1.56893 22.9136 3.4974C22.9136 5.42588 24.4827 6.99481 26.411 6.99481Z"
                                    fill="white" />
                                <path
                                    d="M3.49805 18.2016C5.42653 18.2016 6.99578 16.6331 6.99578 14.7043C6.99578 12.7754 5.42653 11.2066 3.49805 11.2066C1.56958 11.2066 0 12.7755 0 14.7043C0 16.6331 1.56958 18.2016 3.49805 18.2016Z"
                                    fill="white" />
                                <path
                                    d="M14.8172 18.2016C16.7454 18.2016 18.3146 16.6331 18.3146 14.7043C18.3146 12.7754 16.7467 11.2066 14.8172 11.2066C12.8881 11.2066 11.3198 12.7754 11.3198 14.7043C11.3198 16.6331 12.8888 18.2016 14.8172 18.2016Z"
                                    fill="white" />
                                <path
                                    d="M26.3205 18.2016C28.2494 18.2016 29.8179 16.6331 29.8179 14.7043C29.8179 12.7754 28.2494 11.2066 26.3205 11.2066C24.3916 11.2066 22.8218 12.7754 22.8218 14.7043C22.8218 16.6331 24.391 18.2016 26.3205 18.2016Z"
                                    fill="white" />
                                <path
                                    d="M3.57813 22.3786C1.64965 22.3786 0.0800781 23.9471 0.0800781 25.876C0.0800781 27.8041 1.64965 29.3733 3.57813 29.3733C5.50661 29.3733 7.07543 27.8049 7.07543 25.876C7.07543 23.9471 5.50661 22.3786 3.57813 22.3786Z"
                                    fill="white" />
                                <path
                                    d="M14.898 22.3786C12.9694 22.3786 11.3999 23.9471 11.3999 25.876C11.3999 27.8041 12.9688 29.3733 14.898 29.3733C16.8261 29.3733 18.3953 27.8049 18.3953 25.876C18.3953 23.9471 16.8261 22.3786 14.898 22.3786Z"
                                    fill="white" />
                                <path
                                    d="M26.4002 22.3786C24.4721 22.3786 22.9028 23.9471 22.9028 25.876C22.9028 27.8041 24.4721 29.3733 26.4002 29.3733C28.3291 29.3733 29.8976 27.8049 29.8976 25.876C29.8976 23.9471 28.3284 22.3786 26.4002 22.3786Z"
                                    fill="white" />
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
