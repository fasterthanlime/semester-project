import math/Random

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

    swap: func (i, j: Int) {
        tmp := get(i)
        (data[i], data[j]) = (get(j), tmp)
    }

    print: func (f: Func (X) -> String) {
        "(" print()
        for (i in 0..size) {
            f(get(i)) print()
            if (i < size - 1) ", " print()
        }
        ")" println()
    }

    bubbleSort!: func (compare: Func (X, X) -> Int) {
        sorted := false
        while (!sorted) {
            sorted = true
            for (i in 0..size - 1) {
                if (compare(get(i), get(i + 1)) > 0) {
                    sorted = false
                    swap(i, i + 1)
                }
            }
        }
    }
}

test1: func {
    l := List<Int> new(10)
    for (i in 0..l size) {
        l set(i, Random randInt(0, 200))
    }
    l print(|i| "%d" format(i))
    l bubbleSort!(|a, b| a <=> b)
    l print(|i| "%d" format(i))
}

main: func {
    test1()
}

