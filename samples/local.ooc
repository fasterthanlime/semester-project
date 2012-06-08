
Cup: class <Kaylos> {

    copy: func (value: Kaylos) {
        local: Kaylos
        local = value
        value = local
    }

}

#specialize Cup<Char>

main: func {
    c := Cup<Char> new()
    c copy('a')
}


