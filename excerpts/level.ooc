Level: enum {
    FINEST, FINER, FINE, CONFIG, INFO, WARNING, SEVERE
    names := static ["finest", "finer", "fine", "config",
                     "info", "warning", "severe"]

    toString: func -> String {
        names[this]
    }
}
