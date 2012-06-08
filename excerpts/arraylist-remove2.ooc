removeAt: func (index: SSizeT) -> T {
    element := data[index]
    data[index.._size - 1] = data[index + 1.._size]
    element
}
