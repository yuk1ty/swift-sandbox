enum List<T: Equatable> {
    indirect case cons(head: T, tail: List<T>)
    case `nil`
}

extension List: Equatable {
    static func ==(lhs: List, rhs: List) -> Bool {
        switch (lhs, rhs) {
        case (.`nil`, .`nil`):
            return true
        case (.cons(let h, let t), .cons(let h1, let t1)):
            return h == h1 && t == t1
        default:
            return false
        }
    }
}


extension List {
    var isEmpty: Bool {
        return self == .`nil`
    }
    
    var head: T? {
        switch self {
        case .`nil`:
            return nil
        case .cons(let h, _):
            return h
        }
    }
    
    var tail: List<T>? {
        switch self{
        case .`nil`:
            return nil
        case .cons(_, let t):
            return t
        }
    }
    
    var len: Int {
        switch self {
        case .`nil`:
            return 0
        case .cons(_, let t):
            return 1 + t.len
        }
    }
    
    var first: T? {
        return self.head
    }
    
    var last: T? {
        switch self {
        case .`nil`:
            return nil
        case .cons(let h, .`nil`):
            return h
        case .cons(_, let t):
            return t.last
        }
    }
    
    func add(adden: T) -> List<T> {
        switch self {
        case .`nil`:
            return .cons(head: adden, tail: .`nil`)
        case .cons(let h, let t):
            return .cons(head: h, tail: t.add(adden: adden))
        }
    }
    
    func append(another: List<T>) -> List<T> {
        switch self {
        case .`nil`:
            return another
        case .cons(let h, let t):
            return .cons(head: h, tail: t.append(another: another))
        }
    }
    
    // Higher order functions
    func foldr<U>(acc: U, f: (T, U) -> U) -> U {
        switch self {
        case .`nil`:
            return acc
        case .cons(let h, let t):
            return f(h, t.foldr(acc: acc, f: f))
        }
    }
    
    func map<U>(f: @escaping (T) -> U) -> List<U> {
        return self.foldr(acc: List<U>.`nil`, f: { acc, list in
            return List<U>.cons(head: f(acc), tail: list)
        })
    }
    
    func flatMap<U>(f: @escaping (T) -> List<U>) -> List<U> {
        return foldr(acc: List<U>.`nil`, f: { acc, list in
            return f(acc).append(another: list)
        })
    }
    
    func filter(p: @escaping (T) -> Bool) -> List<T> {
        return foldr(acc: List<T>.`nil`, f: { acc, list in
            if p(acc) {
                return List<T>.cons(head: acc, tail: list)
            }
            return list
        })
    }
}
