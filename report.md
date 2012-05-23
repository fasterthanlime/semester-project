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

### Usage

This is the canonical generic function, `identity`: it simply returns exactly
what has been passed to it.

\input{excerpts/generics-001.ooc.tex}

There is no type erasure in ooc, which means generic type arguments can be explored
at runtime, like this:

\input{excerpts/generics-002.ooc.tex}

Classes can be generic too. A simple generic container could be implemented
like this:

\input{excerpts/generics-container.ooc.tex}

### Implementation

### Performance problems

## Specialization implementation

### AST transformations

### Resulting code

## Performance improvement

### Code size

### Memory usage

### Runtime

## Conclusion

