@stack('footer_start')

<footer class="main-footer">
    <div class="pull-right hidden-xs">
        <!-- <b>{{ trans('footer.version') }}</b> {{ version('short') }} -->
        <b>AKUSOFT-V2 |</b> Copyright 2019
    </div>
    <strong>{{ trans('footer.powered') }}</strong>: <a href="{{ trans('footer.link') }}" target="_blank">{{ trans('footer.software') }}</a>
</footer>

@stack('footer_end')
