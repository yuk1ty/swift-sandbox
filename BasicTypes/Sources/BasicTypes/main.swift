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

//Basic Optinal type usage
let optionalInt = Optional(1)

//the same as Rust's if-let syntax
if let expected = optionalInt {
    assert(expected == 1)
}

//default operator
let maybeOne: Int? = 1
let maybeNil: Int? = nil
assert(maybeOne ?? 3 == 1)
assert(maybeNil ?? 3 == 3)

//forcibly unwrapping
let maybeTwo: Int? = 2
assert(maybeOne! + maybeTwo! == 3)

//optional chain
let optionalDouble = Optional(1.0)
let optionalIsInifinite = optionalDouble?.isInfinite
assert(optionalIsInifinite == false)

let before = Optional(1)
let after = before.map({ b in String(describing: before!) })
assert(after == Optional("1"))

let optionalType: Optional<Int> = Optional(1)
let syntaxSugerCheck: Int? = Optional(1)
assert(optionalType == syntaxSugerCheck)

//If the array is empty, type inference doesn't work.
//Isn't type inference of Swift Hindley-Milner?
var ans1: [Int] = []
//1..<4 generates CountableRange type.
for v in 1..<4 {
    //if we use the append function, the variable must be mutable. Wow!
    ans1.append(v)
}
assert(ans1 == [1, 2, 3])

var ans2: [Int] = []
//1...4 generates CountableClosedRange type
for v in 1...4 {
    ans2.append(v)
}
assert(ans2 == [1, 2, 3, 4])
