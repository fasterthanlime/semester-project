
Tuple: class <G, H> {
    _car: G
    _cdr: H

    car: func -> G { _car }
    cdr: func -> H { _cdr }

    init: func (=_car, =_cdr)
}

Vector3: cover {
    x, y, z: Float
    
    init: func@ (=x, =y, =z)

    repr: func -> String {
        "(%.2f, %.2f, %.2f)" format(x, y, z)
    }
}

#specialize Tuple<String, Char>
#specialize Tuple<String, Int>
#specialize Tuple<String, Vector3>

test1: func {
    t := Tuple<String, Char> new("initial", 'a')
    "%s = %c" printfln(t car(), t cdr())
}

test2: func {
    t := Tuple<String, Int> new("age", 21 as Int)
    "%s = %d" printfln(t car(), t cdr())
}

test3: func {
    t := Tuple<String, Vector3> new("size", Vector3 new(0.4, 0.25, 1.93))
    "%s = %s" printfln(t car(), t cdr() repr())
}

test4: func {
    t := Tuple<String, String> new("name", "John Doe")
    "%s = %s" printfln(t car(), t cdr())
}

main: func {
    test1()
    test2()
    test3()
    test4()
}
