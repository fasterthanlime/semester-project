
# Semester project

 * Student: Amos Wenger (amos@official.fm)
 * Supervisor: Philippe Suter (philippe.suter@epfl.ch)

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

### ooc vs C#/Java

## Generics in ooc (pre-specialization)

### Usage

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

