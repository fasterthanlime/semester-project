
Cup: class <Kaylos> {

    _cookie: Kaylos
    data: Kaylos*

    copy: func (value: Kaylos) {
        data = bbtrap()
        data[0] = bbtrap()
    }

    bbtrap: func -> Kaylos { _cookie }

}

#specialize Cup<Char>

main: func {
    c := Cup<Char> new()
    c copy('b')
}


