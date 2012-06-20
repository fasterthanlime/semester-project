Loop_s: cover from uv_loop_s {
    timestamp: Long
}

Loop: cover from Loop_s* {
    default: static extern(uv_default_loop) func -> This
    run: extern(uv_run) func
}

// example
loop := Loop default()
loop run()
