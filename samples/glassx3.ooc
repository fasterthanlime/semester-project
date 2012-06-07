
Glass: class <X> {

    init: func (value: X) {
        X name println()
        match X {
            case c: Char   => "%c" printfln(c)
            case i: Int    => "%d" printfln(i)
            case o: Object => "%p" printfln(o)
        }
    }

}

#specialize Glass<Int>

main: func {
    Glass<Char> new('c')
    Glass<Int> new(42 as Int)
    Glass<Object> new(null)
}


