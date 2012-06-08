import math/Random, os/Time

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

    prount: func {}

    print: func (f: Func (X) -> String) {
        "(" print()
        for (i in 0..size) {
            f(get(i)) print()
            if (i < size - 1) ", " print()
            prount()
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

#specialize List<Int>

demo: func {
    l := List<Int> new(10)
    for (i in 0..l size) {
        l set(i, Random randInt(0, 200))
    }
    l print(|i| "%d" format(i))
    l bubbleSort!(|a, b| a <=> b)
    l print(|i| "%d" format(i))
}

benchmark: func {
    l := List<Int> new(10_000)
    for (i in 0..l size) {
        l set(i, Random random())
    }
    millis := Time measure(||
        l bubbleSort!(|a, b| a <=> b)
    )
    "Sorting took %d milliseconds" printfln(millis)
}

main: func {
    // demo()
    benchmark()
}

