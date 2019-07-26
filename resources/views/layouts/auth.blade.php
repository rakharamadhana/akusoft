<html lang="{{ app()->getLocale() }}">
    @include('partials.auth.head')

    <body class="hold-transition login-page">
        @stack('body_start')

        <div class="login-box">
            @stack('login_box_start')

            <div class="login-box-body">
                <div class="login-logo">
                    <!-- <img src="{{ asset('public/img/akaunting-logo-white.png') }}" alt="Akaunting" /> -->
                    <h2>AKUSOFT V2</h2>    
                </div>
                <!-- /.login-logo -->

                <p class="login-box-msg">Aplikasi Keuangan UMKM Sederhana</p>

                <!-- <p class="login-box-msg">@yield('message')</p> -->

                @include('flash::message')

                @stack('login_content_start')

                @yield('content')

                @stack('login_content_end')
            </div>
            <!-- /.login-box-body -->

            <div class="login-box-footer">
                AKUSOFT V2 | 2019
                <!-- {{ trans('footer.powered') }} <a href="{{ trans('footer.link') }}" target="_blank">{{ trans('footer.software') }}</a> -->
            </div>
            <!-- /.login-box-footer -->

            @stack('login_box_end')
        </div>

        @stack('body_end')
    </body>
</html>
