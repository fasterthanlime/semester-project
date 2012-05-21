
standardIdentity: func <T> (v: T) -> T { v }

manualIdentity: func (s: String) -> String { s }

inlineIdentity: inline func <T> (v: T) -> T { v }

main: func {

    test1()
    test2()
    test3()

}

test1: func {
    standardIdentity("Hi world") println()
}

test2: func {
    manualIdentity("Hi world") println()
}

test3: func {
    inlineIdentity("Hi world") println()
}

