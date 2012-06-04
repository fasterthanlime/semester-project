
Jar: class <X> {
    cookie: X

    //init: func (=cookie)

    //doStuff: func (.cookie) {
    doStuff: func {
        a: X
        a = cookie
    }
}

#specialize Jar<Char> // binks

