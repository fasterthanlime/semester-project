
List: class <X> {
    data: X*
    size: SizeT

    init: func (=size) {
        data = gc_malloc(X size * size)
    }

    get: func (index: Int) -> X {
        data[index]
    }

    set: func (index: Int, element: X) {
        data[index] = element
    }
}

Letter: cover from Char { }

#specialize List<Letter>

test1: func {
    l := List<Char> new(3) 
    l set(0, 'f')
    l set(1, 'a')
    l set(2, 'q')

    for (i in 0..l size) {
        printf("%c", l get(i))
    }
    println()
}

test2: func {
    l := List<Letter> new(3) 
    l set(0, 'f' as Letter)
    l set(1, 'a' as Letter)
    l set(2, 'q' as Letter)

    for (i in 0..l size) {
        printf("%c", l get(i))
    }
    println()
}

main: func {
    test1()
    test2()
}
