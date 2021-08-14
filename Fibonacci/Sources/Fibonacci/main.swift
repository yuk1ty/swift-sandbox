func fibonacci(n: Int) -> Int {
    if n == 0 || n == 1 {
        return n
    } else {
        return fibonacci(n: n - 1) + fibonacci(n: n - 2)
    }
}

func fibonacci_with_guard(n: Int) -> Int {
    guard n > 1 else {
        return n
    }
    return fibonacci(n: n - 1) + fibonacci(n: n - 2)
}

assert(fibonacci(n: 7) == 13)
assert(fibonacci_with_guard(n: 7) == 13)
