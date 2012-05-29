int identity__universal(Class *T, uint8_t *ret, uint8_t *value) {
    if (T == Int_class()) {
        if(ret) {
            *((int*) ret) = identity__int(*((int*) value));
        }
    } else {
        identity(T, ret, value);
    }
}
