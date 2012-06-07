
Jar: class <X> {
    cookie: X

    //ostracize: func (=cookie) { }

    ostracize: func (cookie: X) {
        this cookie = cookie
    }

    getCookie: func -> X { cookie }
}

#specialize Jar<Char> // binks

main: func {
    j := Jar<Int> new()
    j ostracize(99)
    printf("j's cookie = %d\n", j getCookie())

    k := Jar<Char> new()
    k ostracize('c')
    printf("k's cookie = %d\n", k getCookie())
}

