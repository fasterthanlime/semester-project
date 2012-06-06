
Jar: class <X> {
    cookie: X

    doStuff: func (.cookie) {

    }
}

#specialize Jar<Char> // binks

main: func {
    j := Jar<Int> new()
    j doStuff(42)
}

