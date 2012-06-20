% Specialization in ooc
% Amos Wenger
% June 8, 2012

# The ooc programming language

ooc is a general-purpose programming language. It was created in 2009 for an EPFL school project, and is now self-hosting, currently in v0.9.4. It produces clean, portable C code, its SDK works on Windows, OSX, Linux, Haiku, FreeBSD, and probably more.

Has been used to create games, power live streaming backend architecture (in production), write compilers, IRC servers, IRC bots, torrent clients, implement Lisp, JIT assemblers, package managers, and more.

<https://github.com/languages/ooc>

# Class definition

\input{excerpts/logger.ooc.tex}

# Modules, entry point, string formatting

\input{excerpts/logger-use.ooc.tex}

# Covers (C side)

\input{excerpts/cover-struct.c.tex}

# Covers (ooc side)

\input{excerpts/cover-struct.ooc.tex}

# Features not covered here

Well outside the scope of this presentation:

  * Operator overloading
  * Implicit conversions
  * Cover inheritance, compound covers,
    structured initializers
  * Version blocks
  * Interfaces
  * Custom memory management
  * Enums
  * Pattern matching

# Meta-programming in other languages

C only allows macros, not generic programming. While this
doesn't prevent the creation of generic containers, type
safety is not guaranteed.

C++ meta-programming is done via templates: compile-time
instanciation, type safety, significant cost in compilation time
and binary size.

JVM-based languages (Java, Scala, Groovy, etc.) have generic
classes, with type erasure because of backwards-compatibility.
Limited compile-time type-safety (can be overriden) and no
introspection possible at runtime.

# Types

A type can either be:

  * A complex type: object, interface. e.g. `String`, `Logger`, etc.
  * A primitive type: cover, cover from. e.g. `Int`, `Boolean`

Java has a similar distinction (`int` vs `Integer`).

In ooc, instead of boxing and unboxing, primitive types are allowed
as generic type parameters.

# Generics - Functions

\input{excerpts/generics-001.ooc.tex}

\input{excerpts/generics-001-with-types.ooc.tex}

# Generics - Classes

\input{excerpts/generics-container.ooc.tex}

Number of generic parameters is not limited:

\input{excerpts/generics-kv.ooc.tex}

# The problem

Non-generic code generates straightforward C code, but generic types
add to the semantics of the language and have no natural C translation.

\input{excerpts/identity-int2.c.tex}

Generic type sizes can vary: operations on generic values must work
whatever their actual size is at runtime. So must operations on arrays
of generic values.

# The solution

All types in ooc have runtime type information, returned by the
`TypeName_class()` function. This structure contains the width of the
type.

\input{excerpts/identity-generic2.c.tex}

# The solution

Calls like this one:

\input{excerpts/identity-call.ooc.tex}

are translated as:

\input{excerpts/identity-call.c.tex}

# The solution's problem

Passing the address of generic values instead of their value directly
is an extra indirection (dereference)

# Source size

\includegraphics[width=10cm]{source-size-graph}

# Performance gains

