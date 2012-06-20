Logger: class {
    level: Level
    out: Stream

    init: func (=out) {
        level = Level INFO
    }

    log: func (msg, level = Level INFO) {
        if (level <= this level) 
            format(msg)
    }
}
