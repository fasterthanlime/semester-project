import os/Time

main: func {
    logger := Logger new(stdout)
    logger log("Started at " + Time currentTimeMillis())

    work()

    time := Time currentTimeMillis()
    logger log("Finished at %d" format(time))
}

