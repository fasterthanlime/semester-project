
Glass: class <X> {

    init: func (value: X) {
        X name println()
    }

}

#specialize Glass<Int>

main: func {
    Glass<Char> new('c')
    Glass<Int> new(42 as Int)
}


