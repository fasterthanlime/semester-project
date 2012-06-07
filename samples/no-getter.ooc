
Jar: class <Z> {
    cookie: Z

    init: func (=cookie)
}

#specialize Jar<Int>

main: func {
    j := Jar<Int> new(42 as Int)
    printf("j's cookie = %d\n", j cookie)

    k := Jar new("Folks")
    printf("k's cookie = %s\n", k cookie)
}


