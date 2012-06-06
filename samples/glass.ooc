
Glass: class <X> {

    init: func (value: X) {

    }

}

#specialize Glass<Int>

main: func {
    Glass<Char> new()
    Glass<Int> new()
}


