@extends('layouts.auth')

@section('title', trans('auth.register'))
@section('message', trans('auth.register_to'))

@section('content')

<center><h4>{{ trans('auth.register_title') }}</h4></center>
<form role="form" method="POST" action="{{ url('auth/register') }}" class="form-loading-button">
    {{ csrf_field() }}
    
    <div class="form-group has-feedback{{ $errors->has('name') ? ' has-error' : '' }}">
        <input name="name" type="text" class="form-control" placeholder="{{ trans('general.name') }}" required autofocus>
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
        @if ($errors->has('name'))
            <span class="help-block">
                <strong>{{ $errors->first('name') }}</strong>
            </span>
        @endif
    </div>
    
    <div class="form-group has-feedback{{ $errors->has('email') ? ' has-error' : '' }}">
        <input name="email" type="email" class="form-control" placeholder="{{ trans('general.email') }}" required autofocus>
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
        @if ($errors->has('email'))
            <span class="help-block">
                <strong>{{ $errors->first('email') }}</strong>
            </span>
        @endif
    </div>

    <div class="form-group has-feedback{{ $errors->has('company_name') ? ' has-error' : '' }}">
        <input name="company_name" type="text" class="form-control" placeholder="Nama Perusahaan" required autofocus>
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
        @if ($errors->has('company_name'))
            <span class="help-block">
                <strong>{{ $errors->first('company_name') }}</strong>
            </span>
        @endif
    </div>
    
    <div class="form-group has-feedback{{ $errors->has('password') ? ' has-error' : '' }}">
        <input name="password" type="password" class="form-control" placeholder="{{ trans('auth.password.current') }}" required>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        @if ($errors->has('password'))
            <span class="help-block">
                <strong>{{ $errors->first('password') }}</strong>
            </span>
        @endif
    </div>

    <div class="form-group has-feedback{{ $errors->has('password') ? ' has-error' : '' }}">
        <input name="password_confirmation" type="password" class="form-control" placeholder="{{ trans('auth.password.current_confirm') }}" required>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        @if ($errors->has('password'))
            <span class="help-block">
                <strong>{{ $errors->first('password') }}</strong>
            </span>
        @endif
    </div>

    <div class="row">
        <div class="col-sm-4">
            <button type="submit" class="btn btn-success btn-block btn-flat button-submit" data-loading-text="{{ trans('general.loading') }}">{{ trans('auth.register') }}</button>
        </div>
        <!-- /.col -->
    </div>
</form>

<center>
<a href="{{ url('auth/login') }}">{{ trans('auth.login_now') }}</a><br>
<a href="{{ url('auth/forgot') }}">{{ trans('auth.forgot_password') }}</a><br>
</center>
@endsection

@push('js')
<!-- iCheck -->
<script src="{{ asset('vendor/almasaeed2010/adminlte/plugins/iCheck/icheck.min.js') }}"></script>
@endpush

@push('css')
<!-- iCheck -->
<link rel="stylesheet" href="{{ asset('vendor/almasaeed2010/adminlte/plugins/iCheck/square/green.css') }}">
@endpush

@push('scripts')
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
            increaseArea: '20%' // optional
        });
    });
</script>
@endpush
