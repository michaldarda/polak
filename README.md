# Polak

Polak is a toy programming language build on top of Ruby language.

# Installation

First, check if you have Ruby installed, version 2.0 and above is **recommended**, but should work also with 1.9.

Run

    bundle

To run interpreter, run:

    ruby interpreter.rb

To run evaluator, run:

    bundle exec rake console

To run all tests (specs), run

    bundle exec rspec spec

# Examples

    # Data types

    Numbers:

    0.1.0 >> 2
    2
    #=> 2

    0.1.0 >> prawda
    true
    #=> true

    0.1.0 >> falsz
    false
    #=> false

    # Arithmetic operations
    0.1.0 >> 2 + 2
    4
    #=> 4

    0.1.0 >> 2 - 2
    0
    #=> 0

    0.1.0 >> 2 / 2
    1
    #=> 1

    0.1.0 >> 2 * 2
    4
    #=> 4

    # Variable assignments

    0.1.0 >> niech x = 2
    {:x=>>2<}
    #=> 2
    0.1.0 >> niech x = 3
    Nie mogę przypisać zmiennej bo jest przypisana wczesniej, użyj niech! aby przypisać
    SyntaxError
    0.1.0 >> niech! x = 4
    {:x=>>4<}
    #=> 4

    # Boolean operators

    0.1.0 >> (1 == 2) i (1 == 3)
    false
    #=> false
    0.1.0 >> (1 == 2) i (1 == 1)
    false
    #=> false
    0.1.0 >> (1 == 1) i (2 == 2)
    true
    #=> true

    # Conditionals

    0.1.0 >> jezeli (1 == 2) to { 1 } albo { 2 }
    2
    #=> 2
    0.1.0 >> jezeli (1 == 1) to { 1 } albo { 1 }
    1
    #=> 1

    # Function calling

    0.1.0 >> niech y = f(x) { x * x }

    0.1.0 >> y(2)
    4
    #=> 4

    niech silnia = f(n) { jezeli (n == 1) to { 1 } albo { n * silnia(n - 1) } }
s
    # Data structures

    0.1.0 >> Lista(1,2)
    Lista(1,2)
    #=> 2

    0.1.0 >> Lista(1,Lista(1,2))
    Lista(1,Lista(1,2))

    # Build in functions

    0.1.0 >> Lista.glowa(Lista(1,2))
    1
    #=> 1

    0.1.0 >> Lista.ogon(Lista(1,2))
    2
    #=> 2

    0.1.0 >> niech x = 2
    {:x=>>2<}
    #=> 2
    0.1.0 >> niech y = 4
    {:x=>>2<, :y=>>4<}
    #=> 4
    0.1.0 >> Lista.glowa(Lista(x,y))
    2
    #=> 2

# Changelog

### Version 0.1.0

- Number is the only data type
- Basic arithmetic operetion on integers
- Conditional
- Function and variable assignment
- Functions definitions and calling
- Recursive functions

# LICENSE

Copyright (c) 2013 Michał Darda <michaldarda@gmail.com>, see LICENCE.md
