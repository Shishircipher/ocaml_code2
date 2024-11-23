Variables and functions are fundamental ideas that show up in virtually all programming languages. OCaml has a different take on these concepts than most languages you’re likely to have encountered, so this chapter will cover OCaml’s approach to variables and functions in some detail, starting with the basics of how to define a variable, and ending with the intricacies of functions with labeled and optional arguments.

### Variables
At its simplest, a variable is an identifier whose meaning is bound to a particular value. In OCaml these bindings are often introduced using the let keyword. We can type a so-called top-level let binding with the following syntax. Note that variable names must start with a lowercase letter or an underscore. 

```let <variable> = <expr>```

As we’ll see when we get to the module system in Chapter 4, Files Modules And Programs, this same syntax is used for let bindings at the top level of a module.

Every variable binding has a scope, which is the portion of the code that can refer to that binding. When using utop, the scope of a top-level let binding is everything that follows it in the session. When it shows up in a module, the scope is the remainder of that module.    

Here’s a simple example.

```open Base;;
let x = 3;;

let y = 4;;

let z = x + y;;
```
let can also be used to create a variable binding whose scope is limited to a particular expression, using the following syntax.
```let <variable> = <expr1> in <expr2>```

This first evaluates expr1 and then evaluates expr2 with variable bound to whatever value was produced by the evaluation of expr1. Here’s how it looks in practice.

```let languages = "OCaml,Perl,C++,C";;

let dashed_languages =
  let language_list = String.split languages ~on:',' in
  String.concat ~sep:"-" language_list;;
```
Note that the scope of language_list is just the expression String.concat ~sep:"-" language_list and is not available at the toplevel, as we can see if we try to access it now. [let bindings/local]
```language_list;;
```
A let binding in an inner scope can shadow, or hide, the definition from an outer scope. So, for example, we could have written the dashed_languages example as follows.
```let languages = "OCaml,Perl,C++,C";;

let dashed_languages =
  let languages = String.split languages ~on:',' in
  String.concat ~sep:"-" languages;;
```
One common idiom is to use a series of nested let/in expressions to build up the components of a larger computation. Thus, we might write. 
```
let area_of_ring inner_radius outer_radius =
  let pi = Float.pi in
  let area_of_circle r = pi *. r *. r in
  area_of_circle outer_radius -. area_of_circle inner_radius;;

area_of_ring 1. 3.;;
```
 
