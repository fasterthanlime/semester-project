removeAt: func (index: SSizeT) -> T {
    element := data[index]
    memmove(data + (index * T size), data + ((index + 1) * T size), (_size - index) * T size)
    _size -= 1
    element
}
