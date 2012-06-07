import structs/ArrayList

#specialize ArrayList<Char>

test1: func {
    ar := ArrayList<Int> new()
    ar add(1). add(2). add(3)

    for (i in 0..ar size) {
        printf("%d", ar get(i))
    }
}

test2: func {
    ar := ArrayList<Char> new()
    ar add('a'). add('b'). add('c')

    for (i in 0..ar size) {
        printf("%c", ar get(i))
    }
}

main: func {
    test1()
    test2()
}

