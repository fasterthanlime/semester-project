typedef uint8_t *Any;

void identity(Class *T, Any value, Any ret) {
    if (ret) {
        memcpy(ret, value, T->size)
    }
}
