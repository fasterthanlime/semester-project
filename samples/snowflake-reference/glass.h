#ifndef ___glass___
#define ___glass___

#include <./glass-fwd.h>
#include <sdk/lang/core.h>

struct _glass__Glass {
    struct _lang_core__Object __super__;
    lang_core__Class* X;
};


struct _glass__GlassClass {
    struct _lang_core__ClassClass __super__;
    glass__Glass* (*new)(lang_core__Class*, uint8_t*);
};

#endif
