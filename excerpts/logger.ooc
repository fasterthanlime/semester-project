Logger: class extends Formatter {
    level: Level
    out: Stream

    init: func (=out) {
        level = Level INFO
    }

    log: func (msg: String, level: Level) {
        if (level <= this level) 
            out print(format(msg))
    }
}
