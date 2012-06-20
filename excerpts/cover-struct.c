// In uv-private.h
struct uv_loop_s {
    long timestamp;
};

// In uv.h
typedef struct uv_loop_s uv_loop_t;

UV_EXTERN uv_loop_t* uv_default_loop(void);
UV_EXTERN uv_run(uv_loop_t*);

