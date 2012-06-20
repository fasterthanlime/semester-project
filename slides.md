% Specialization in ooc
% Amos Wenger
% June 8, 2012

# The ooc programming language

ooc is a general-purpose programming language. It was created in 2009 for an EPFL school project, and is now self-hosting, currently in v0.9.4

Has been used to create games, power live streaming backend architecture (in production), write compilers, IRC servers, IRC bots, torrent clients, implement Lisp, JIT assemblers, package managers, and more.

<https://github.com/languages/ooc>

# Class definition

\input{excerpts/logger.ooc.tex}

# Modules, entry point, string formatting

\input{excerpts/logger-use.ooc.tex}

# Enums

\input{excerpts/level.ooc.tex}

# Covers (C side)

\input{excerpts/cover-struct.c.tex}

# Covers (ooc side)

\input{excerpts/cover-struct.ooc.tex}

# C++

  * C++ doesn't compile to C anymore
  * C++ has more features
  * C++ has templates

# JVM

  * Java runs on a VM (mostly)
  * Java tries to stay away from platform-specific code
  * Java has type erasure in Generic
  * Scala also limited by the JVM, no reification

# Identity specialized

\input{excerpts/identity-int.c.tex}

# Source size

\includegraphics[width=10cm]{source-size-graph}

# Performance gains

