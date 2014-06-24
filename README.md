# Polak

Polak is a toy programming language build on top of Ruby language.

## Installation

First, check if you have Ruby installed, version 2.0 and above is **recommended**, but should work also with 1.9.

Run:

    bundle

To run interpreter, run:

    ruby interpreter.rb

To run evaluator, run:

    bundle exec rake console

To run all tests (specs), run:

    bundle exec rspec spec

## Examples

### Data types

    >> 2
    #=> 2

    >> prawda
    #=> true

    >> falsz
    #=> false

### Arithmetic operations

    >> 2 + 2
    #=> 4

    >> 2 - 2
    #=> 0

    >> 2 / 2
    #=> 1

    >> 2 * 2
    #=> 4

    >> .
    #=> nic

### Variable assignments

    >> niech x = 2
    #=> {:x=>>2<}

    0.1.0 >> niech x = 3
    Nie mogę przypisać zmiennej bo jest przypisana wczesniej, użyj niech! aby przypisać
    #=> SyntaxError

    0.1.0 >> niech! x = 4
    #=> {:x=>>4<}

### Boolean operators

    >> (1 == 2) i (1 == 3)
    #=> false

    >> (1 == 2) i (1 == 1)
    #=> false

    >> (1 == 1) i (2 == 2)
    #=> true

### Conditionals

    >> jezeli (1 == 2) to { 1 } albo { 2 }
    #=> 2

    >> jezeli (1 == 1) to { 1 } albo { 1 }
    #=> 1

### Function calling

    >> niech y = f(x) { x * x }

    >> y(2)
    #=> 4

    >> niech silnia = f(n) { jezeli (n == 1) to { 1 } albo { n * (silnia(n - 1)) } }
    #=> {:formal=>["n"], :body=>>jezeli (n == 1) to { 1 } albo { n * silnia(n - 1) }<, :environment=>{}, :silnia=>{:formal=>["n"], :body=>>jezeli (n == 1) to { 1 } albo { n * silnia(n - 1) }<, :environment=>{:formal=>["n"], :body=>>jezeli (n == 1) to { 1 } albo { n * silnia(n - 1) }<, :environment=>{}}}}
    
    >> silnia(1)
    #=> 1

    >> silnia(2)
    #=> 2

    >> silnia(3)
    #=> 6

    >> silnia(4)
    #=> 24

    >> niech suma = f(x,y) { x + y }
    #=> {:suma=>{:formal=>["x", "y"], :body=>>x + y<, :environment=>{}}}
    
    >> suma(1,2)
    #=> 3

    >> niech odwroc = f(l) { jezeli (Lista.koniec?(l)) to { . } albo { Lista(odwroc(Lista.ogon(l)),Lista.glowa(l)) } }
    #=> {:odwroc=>{:formal=>["l"], :body=>>jezeli (Lista.koniec?) to { nic } albo { Lista(odwroc(l),l) }<, :environment=>{}}}

    >> odwroc(Lista(1,.))
    #=> Lista(nic,1)
    
    >> odwroc(Lista(1,Lista(2,Lista(3,.))))
    #=> Lista(Lista(Lista(nic,3),2),1)

### Data structures

    >> Lista(1,2)
    #=> 2

### Build in functions

    >> Lista.glowa(Lista(1,2))
    #=> 1

    >> Lista.ogon(Lista(1,2))
    #=> 2

    >> Lista.koniec?(.)
    #=> true

    >> niech x = 2
    #=> {:x=>>2<}

    >> niech y = 4
    #=> {:x=>>2<, :y=>>4<}

    >> Lista.glowa(Lista(x,y))
    #=> 2

    >> Lista(1,Lista(2,.))
    #=> Lista(1,Lista(2,nic))

## Changelog

### Version 0.1.0

- Number is the only data type
- Basic arithmetic operetion on integers
- Conditional
- Function and variable assignment
- Functions definitions and calling
- Recursive functions

## LICENSE

Copyright (c) 2013 Michał Darda <michaldarda@gmail.com>, see LICENCE.md
