
import structs/ArrayList

main: func {

    s := ArrayList<Int> new()
    s add(0xdeadbeef). add(0). add(0). add(0)

    "Correct" println()
    for (i in 0..s size) {
        "%x" printfln(s get(i))
    }

    s T = Octet // that is so, so wrong.

    "Incorrect" println()
    for (i in 0..s size) {
        "%x" printfln(s get(i))
    }

}


