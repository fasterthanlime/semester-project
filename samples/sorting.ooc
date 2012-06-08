include stdint
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
        bbtrap()
    }

    bbtrap: func {}

    print: func (f: Func (X) -> String) {
        "(" print()
        for (i in 0..size) {
            x := get(i)
            f(x) print()
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

Box1: class {
    value: Int
    init: func (=value) 
}

Box2: class {
    value: Int
    init: func (=value) 
}

// #specialize List<Box2>

/** sort an unspecialized list of ints with `size` elements
    and return the number of milliseconds it took */
unspecialized: func (size: Int) -> UInt {
    l := List<Box1> new(size)
    for (i in 0..l size) {
        l set(i, Box1 new(Random random()))
    }
    Time measure(||
        l bubbleSort!(|a, b| a value <=> b value)
    )
}

/** sort a specialized list of ints with `size` elements
    and return the number of milliseconds it took */
specialized: func (size: Int) -> UInt {
    l := List<Box2> new(size)
    for (i in 0..l size) {
        l set(i, Box2 new(Random random()))
    }
    Time measure(||
        l bubbleSort!(|a, b| a value <=> b value)
    )
}

benchmark: func {
    numRuns := 1
    "# list_size\ttime_unspecialized\ttime_specialized" println()
    for (i in 10..15) {
        size := 1 << i
        meanUnspe := 0
        meanSpe := 0
        for (i in 0..3) {
            meanUnspe += unspecialized(size) 
            meanSpe   += specialized(size)
        }
        timeUnspe := meanUnspe * (1.0 / numRuns)
        timeSpe   := meanSpe   * (1.0 / numRuns)
        "%d\t%u\t%d" printfln(size, timeUnspe, timeSpe)
    }
}

main: func {
    benchmark()
}

