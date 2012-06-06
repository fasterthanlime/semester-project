#ifndef ___glass_fwd___
#define ___glass_fwd___

struct _glass__Glass;
typedef struct _glass__Glass glass__Glass;
/* specialized stuff ahead! */
typedef struct _glass__Glass glass__Glass____specialized1;
/* done with specialized stuff */
struct _glass__GlassClass;
typedef struct _glass__GlassClass glass__GlassClass;

#include <sdk/lang/Exception-fwd.h>
#include <sdk/lang/BufferIterator-fwd.h>
#include <sdk/lang/System-fwd.h>
#include <sdk/lang/Character-fwd.h>
#include <sdk/lang/VarArgs-fwd.h>
#include <sdk/lang/core-fwd.h>
#include <sdk/lang/string-fwd.h>
#include <sdk/lang/Iterators-fwd.h>
#include <sdk/lang/Memory-fwd.h>
#include <sdk/lang/Buffer-fwd.h>
#include <sdk/lang/Numbers-fwd.h>
#include <sdk/lang/Abstractions-fwd.h>
#include <sdk/lang/Format-fwd.h>
#include <sdk/lang/IO-fwd.h>
glass__GlassClass *glass__Glass_class();
glass__GlassClass *glass__Glass____specialized1_class();
glass__Glass* glass__Glass_new(lang_core__Class* X, uint8_t* value);
void glass__Glass_init(glass__Glass* this, uint8_t* value);
void glass__Glass___defaults__(glass__Glass* this);
void glass__Glass___defaults___impl(glass__Glass* this);
void glass__Glass___load__();

void glass__Glass____specialized1_init(glass__Glass* this, lang_Numbers__SSizeT value);
void glass__Glass____specialized1___defaults__(glass__Glass* this);
void glass__Glass____specialized1___defaults___impl(glass__Glass* this);
void glass__Glass____specialized1___load__();

void glass_load();
lang_Numbers__Int main();

#endif
