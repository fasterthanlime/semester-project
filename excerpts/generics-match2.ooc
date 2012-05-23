repr: func <T> (value: T) {
    match value {
        case c: Char   => "Char(%c)" format(c)
        case i: Int    => "Int(%d)" format(i)
        case s: String => "String(%s)" format(s)
        case o: Object => o class name
        case           => "Unknown"
    }
}
