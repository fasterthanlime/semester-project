
Glass: class <X> {

    init: func (value: X) {

    }

}

#specialize Glass<Int>

main: func {
    Glass<Char> new('c')
    Glass<Int> new(42)
}


