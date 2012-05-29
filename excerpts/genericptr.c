
void array_set (Class *T, uint8_t *ret, uint8_t *data, int index, uint8_t *value) {
    memcpy(data + (index * T->size), value, T->size);
    if (ret) {
        memcpy(ret, data + (index * T->size), T->size);
    }
}

