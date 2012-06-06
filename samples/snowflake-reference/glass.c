#include <./glass.h>
#include <sdk/lang/Exception.h>
#include <sdk/lang/BufferIterator.h>
#include <sdk/lang/System.h>
#include <sdk/lang/Character.h>
#include <sdk/lang/VarArgs.h>
#include <sdk/lang/string.h>
#include <sdk/lang/Iterators.h>
#include <sdk/lang/Memory.h>
#include <sdk/lang/Buffer.h>
#include <sdk/lang/Numbers.h>
#include <sdk/lang/Abstractions.h>
#include <sdk/lang/Format.h>
#include <sdk/lang/IO.h>


void glass__Glass___defaults__(glass__Glass* this) { return (void) ((lang_core__ObjectClass *)((lang_core__Object *)this)->class)->__defaults__((lang_core__Object*)this); }
glass__Glass* glass__Glass_new(lang_core__Class* X, uint8_t* value) {
    
    glass__Glass* this = ((glass__Glass*) (lang_core__Class_alloc__class((lang_core__Class*) glass__Glass_class())));
    this->X = X;
    glass__Glass___defaults__(this);
    glass__Glass_init((glass__Glass*) this, (uint8_t*) value);
    return this;
}
void glass__Glass___load__() {
    lang_core__Class___load__();
}

void glass__Glass____specialized1___defaults__(glass__Glass* this) { return (void) ((lang_core__ObjectClass *)((lang_core__Object *)this)->class)->__defaults__((lang_core__Object*)this); }
glass__Glass____specialized1* glass__Glass____specialized1_new(lang_Numbers__SSizeT value) {
    
    glass__Glass____specialized1* this = ((glass__Glass____specialized1*) (lang_core__Class_alloc__class((lang_core__Class*) glass__Glass____specialized1_class())));
    this->X = (lang_core__Class *) lang_Numbers__SSizeT_class();
    glass__Glass____specialized1___defaults__(this);
    glass__Glass____specialized1_init((glass__Glass____specialized1*) this, value);
    return this;
}
void glass__Glass____specialized1___load__() {
    lang_core__Class___load__();
}

void glass__Glass_init(glass__Glass* this, uint8_t* value) {
    printf("non-specialized: %c\n", *((char*) value));
}

void glass__Glass___defaults___impl(glass__Glass* this) {
    lang_core__Class___defaults___impl((lang_core__Class*) this);
}

void glass__Glass____specialized1_init(glass__Glass____specialized1* this, lang_Numbers__SSizeT value) {
    printf("specialized: %d\n", value);
}

void glass__Glass____specialized1___defaults___impl(glass__Glass____specialized1* this) {
    lang_core__Class___defaults___impl((lang_core__Class*) this);
}

glass__GlassClass *glass__Glass_class(){
    static int __done__ = 0;
    static glass__GlassClass class = 
    {
        {
            {
                {
                    { NULL }, 
                     (lang_Numbers__SizeT) 0,
                     (lang_Numbers__SizeT) 0,
                     (lang_string__String*) 0,
                     (lang_core__Class*) 0,
                },
                 (void*) glass__Glass___defaults___impl,
                 (void*) lang_core__Object___destroy___impl,
                 (void*) glass__Glass___load__,
            },
             (void*) lang_core__Class_forCover,
        },
         (void*) glass__Glass_new,
    };
    lang_core__Class *classPtr = (lang_core__Class *) &class;
    if(!__done__++){
        classPtr->instanceSize = sizeof(glass__Glass);
        classPtr->size = sizeof(void*);
        classPtr->super = (lang_core__Class*) lang_core__Object_class();
        classPtr->name = (void*) lang_string__makeStringLiteral("Glass", 5);
    }
    return &class;
}

glass__GlassClass *glass__Glass____specialized1_class(){
    static int __done__ = 0;
    static glass__GlassClass class = 
    {
        {
            {
                {
                    { NULL }, 
                     (lang_Numbers__SizeT) 0,
                     (lang_Numbers__SizeT) 0,
                     (lang_string__String*) 0,
                     (lang_core__Class*) 0,
                },
                 (void*) glass__Glass____specialized1___defaults___impl,
                 (void*) lang_core__Object___destroy___impl,
                 (void*) glass__Glass____specialized1___load__,
            },
             (void*) lang_core__Class_forCover,
        },
         (void*) glass__Glass____specialized1_new,
    };
    lang_core__Class *classPtr = (lang_core__Class *) &class;
    if(!__done__++){
        classPtr->instanceSize = sizeof(glass__Glass____specialized1);
        classPtr->size = sizeof(void*);
        classPtr->super = (lang_core__Class*) lang_core__Object_class();
        classPtr->name = (void*) lang_string__makeStringLiteral("Glass", 5);
    }
    return &class;
}
void glass_load() {
    static int __done__ = 0;
    if (!__done__++){
        lang_Exception_load();
        lang_BufferIterator_load();
        lang_System_load();
        lang_Character_load();
        lang_VarArgs_load();
        lang_core_load();
        lang_string_load();
        lang_Iterators_load();
        lang_Memory_load();
        lang_Buffer_load();
        lang_Numbers_load();
        lang_Abstractions_load();
        lang_Format_load();
        lang_IO_load();
        glass__Glass___load__();
    }
}


lang_Numbers__Int main() {
    GC_INIT();
    glass_load();
    lang_Character__Char __genArg2 = 'c';
    glass__Glass_new((lang_core__Class*)lang_Character__Char_class(), (uint8_t*) &(__genArg2));
    lang_Numbers__SSizeT __genArg117 = 42;
    glass__Glass____specialized1_new(__genArg117);
    return ((lang_Numbers__Int) (0));
}
