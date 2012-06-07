
Util: class <X> {

    investigate: static func {
        "investigate" println()
    }

}

Spoon: class extends Object {
}

#specialize Util<Char>
#specialize Util<Int>
#specialize Util<Object>

main: func {
    Util<Char> investigate()
    Util<Int> investigate()
    Util<Spoon> investigate()
}


