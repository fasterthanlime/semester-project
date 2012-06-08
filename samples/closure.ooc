

Jar: class <Xaneon> {
    _cookie: Xaneon

    cookie: func ~set (=_cookie)

    withCookie: func (falafel: Func (Xaneon)) {
        falafel(_cookie)
    }
}

#specialize Jar<Char> // binks

main: func {
    j := Jar<Int> new()
    j cookie(99)
    j withCookie(|c|
        printf("j's cookie = %d\n", c)
    )

    k := Jar<Char> new()
    k cookie('c')
    k withCookie(|c|
        printf("k's cookie = %d\n", c)
    )
}

