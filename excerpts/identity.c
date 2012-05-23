void identity(Class *T, uint8_t *ret, uint8_t *value) {
    if(ret) {
        memcpy(ret, value, T->size);
    }
}
