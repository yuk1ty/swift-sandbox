let a = 1
let b = 2
assert(a + b == 3)

let c = 1.0
let d = 2.0
assert(c + d == 3.0)

//this can't be compiled because Swift prohibits implicitly type conversion
//let e: Int = 1
//let f: Double = 2.0
//assert(e + f == 3)
//with explicit type conversion, this can be compiled
let e: Int = 1
let f: Double = 2.0
assert(e + Int(f) == 3)
