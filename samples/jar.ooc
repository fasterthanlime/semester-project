
Jar: class <X> {
    _cookie: X

    cookie: func -> X { _cookie }
    cookie: func ~set (=_cookie)
}

#specialize Jar<Char> // binks

main: func {
    j := Jar<Int> new()
    j cookie(99)
    printf("j's cookie = %d\n", j cookie())

    k := Jar<Char> new()
    k cookie('c')
    printf("k's cookie = %d\n", k cookie())
}

