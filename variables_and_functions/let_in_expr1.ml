(* One common idiom is to use a series of nested let/in expressions to build up the components of a larger computation. 
https://discuss.ocaml.org/t/unexpected-comments-behavior/14832
*)
let area_of_ring outer_radius inner_radius = 
    let pi = Float.pi in
    let area_of_circle r = pi *.r *.r in
    area_of_circle outer_radius -. area_of_circle inner_radius
