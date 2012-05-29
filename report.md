## Abstract

The purpose of this project is to optimize the performance of generics in the
ooc programming language via the implementation of specialization in rock, its
main compiler.

## The ooc programming language

ooc is a general-purpose programming language I designed in early 2009, in
order to be able to write an EPFL assignment in an object-oriented language
rather directly in C.

The first ooc-to-C compiler implementation was done in Java, and didn't feature
any compile-time checks. Many iterations later, the ooc compiler is now
self-hosting (written in ooc itself) and has been successfully tested on a
wide array of platforms, from Windows, to Linux, to OSX, FreeBSD and OpenBSD.

The ooc language is very versatile, and lends itself easily to the same kind
of experiments one would use C in: for example, a fork of the ooc SDK was made
compilable for the TI-89 calculator. There have also been successful attempts
to use ooc on Haiku OS, the modern clone of BeOS.

### ooc vs C++

ooc is in some ways comparable to C++. The original meaning of ooc was *object-
oriented C*, which is similar in spirit to C++'s *c with classes*. However,
there are a few marked differences.

The first and foremost difference is that ooc intends to remain a
source-to-source language: even though we might consider alternative backends,
such as LLVM, the JVM, etc., in spirit, ooc is a language that remains usable
because even though it is not widespread, it produces readable C output that
is familiar to a whole generation of programmers.

ooc also tries to be leaner than C++: it has less features, while still
remaining general enough to be relevant for most tasks. Another distinctive
difference is in the implementation of generics versus templates.

### ooc vs C#/Java

As far as class-oriented languages go, C# and Java are arguably the two most
remarkable running on VMs. The fact that ooc's initial implementation does not
run in a virtual machine is a deliberate decision: while a VM allows JIT
optimizations, and wider facilities to debug an application, I saw it as a
challenge to work on AOT optimizations instead, and make the output portable
enough that a whole VM wouldn't be required to run it.

Note that even though (obviously) binary executables produced by the C compiler
are not portable, the C source is: that is, rock (the ooc compiler) will produce
the same C code on Linux, Windows, and OSX: that code will contain the necessary
preprocessor directives for it to compile and run on the platforms cited above.
Platform-specific code can be written in ooc thanks to version blocks.

As far as debugging, profiling, and general insight into a program goes, in
practice I have found that classical instrumentation tools such as gdb,
valgrind, gcov, gprof, etc. all worked very well. Since #line instructions are
outputted, it is even possible to step through ooc code in gdb, for instance.

## Generics in ooc (pre-specialization)

### Generic functions

This is the canonical generic function, `identity`: it simply returns exactly
what has been passed to it.

\input{excerpts/generics-001.ooc.tex}

There is no type erasure in ooc, which means generic type arguments can be explored
at runtime, like this:

\input{excerpts/generics-002.ooc.tex}

A limited amount of matching can be done on the type of a generic argument:

\input{excerpts/generics-match.ooc.tex}

More advanced matching can also be done on the generic argument itself, alleviating the need for explicit casts.

\input{excerpts/generics-match2.ooc.tex}

### Generic classes

Classes can be generic too. A simple generic container could be implemented
like this:

\input{excerpts/generics-container.ooc.tex}

Any class can be made generic, but in practice, they are used mostly for collections:

\input{excerpts/generics-collection.ooc.tex}

Classes and functions can have any number of generic parameters:

\input{excerpts/generics-kv.ooc.tex}

### Basic types

The reason the `repr` function above cannot be simply handled with a virtual
method call is that, in ooc, not everything is an object. Types like `Int`
and `Octet` are covers from C type:

\input{excerpts/covers.ooc.tex}

Will print:

```
  int size = 4 bytes
octet size = 1 bytes
```

As in Java, all objects in ooc are references. ooc has single inheritance,
and ultimately every object inherits from the `Object` class

\input{excerpts/classes.ooc.tex}

Will print:

```
reference size = 4 bytes
 instance size = 5 bytes
```

...if the C compiler does packing. Otherwise, the char will probably get aligned
to 4 bytes, and the instance size will be 8.

### Implementation

Since generic arguments can be either basic types or object types, the code
generated can handle arguments of any size. C has no explicit support for
variable-sized types [^1], the implementation uses pointers to a memory
area, and memory copy operations instead of assignment.

[^1]: That's not entirely accurate: C99 supports VLAs (Variable-Length Arrays),
    which are allocated on the stack (like local variables of basic types in ooc),
    but their limitations render them worthless in our case: you can't return
    VLAs, and furthermore, keeping track of stack allocated memory is tricky.

Here's an example of the C code generated for the above `identity` function:

\input{excerpts/identity.c.tex}

And a call to identity, such as the following:

\input{excerpts/identity-call.ooc.tex}

Would be translated in C as:

\input{excerpts/identity-call.c.tex}

Similarly, when declaring variables of a generic type (inside a generic
class, for example), they are allocated on the heap. Although the memory
is eventually reclaimed by the garbage collector [^2], 

[^2]: rock uses the Boehm garbage collector: <http://www.hpl.hp.com/personal/Hans_Boehm/gc/>

### Conversion

When generic variables are used in a match, or explicitly cast to a non-generic
type[^3], some pointer trickery is required in the generated C code. For example,
a casting a generic parameter named value of type T to an integer type would look
like this:

\input{excerpts/pointer-dance.c.tex}

[^3]: Note that explicit casts from generic types to non-generic types
      are unsafe and generally regarded as bad practice. Using a match
      is a much safer way to deal with generic values.

### Performance problems

The current implementation of generics suffers from a few performance problems.
Because of the generality of the machine code that is eventually produced, there
is a significant amount of lost opportunity for optimization.

For example, if we knew - at compile time - the generic types that were later
going to be used, we could use much faster primitives for memory allocation and
copy.

For this semester project, we will focus on the performance of the ooc library
'inception-engine', an open-source game engine that mimics the dynamic nature
of the well-known Source engine.

<!-- ![Screenshot of the inception engine in action](images/inception.png) -->

## Specialization implementation

The basic idea behind specialization is to turn a subset of generic instances
into template instances, statically compiled to type-specific code. For example,
the identity function as described above, when used with an integer argument,
would compile down to this specialized code:

\input{excerpts/identity-int.c.tex}

### The perils of specialization

There are a few gotchas that are pertaining to specialization: first, due to the
dynamic nature of generics in ooc, we have to maintain access to the generic types'
classes in the scope. Which explains the first line in the C code above. If not
used, an optimizing C compiler will simply remove the declaration. However, if it
is being used (for run-time type introspection, for example to display a tree of
type names and their various attributes), it will be available just as well as in
the un-specialized version.

Another thing to consider is the scope of the specialization: which classes and
methods to specialize, and which to leave unspecialized. While heuristics could
be developed to find out the most cost-efficient combinations, for this project
we will simply annotate by hand the methods we feel would gain to be specialized.
That said, auto-specialization would be an interesting topic for further research.

And finally, in the context of C code generation, specialization is tricky because
the specialized and the unspecialized versions of a given can method have different
signatures, implying that they cannot be called the same way (ABI compatibility
is not maintained). However, in the event that we need to maintain the same signature,
a shim is easy to make, for example:

\input{excerpts/identity-shim.c.tex}

Note that, ironically, in order to generate a shim like the above, we have to
re

### AST transformations

### Resulting code

## Performance improvement

### Code size

### Memory usage

### Runtime

## Conclusion



