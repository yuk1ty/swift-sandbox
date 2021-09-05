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
    init(_ source: T) {
        self.init(source: source)
    }
    
    private init<S>(source: S) where S: RandomAccessCollection, S.Element == T {
        if source.isEmpty {
            self = .`nil`
        } else {
            self = .cons(
                head: source.first!,
                tail: List(source: source.dropFirst())
            )
        }
    }
    
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
    func foldr<U>(acc: U, f: (T, U) throws -> U) rethrows -> U {
        switch self {
        case .`nil`:
            return acc
        case .cons(let h, let t):
            return try f(h, t.foldr(acc: acc, f: f))
        }
    }
    
    func map<U>(f: (T) throws -> U) rethrows -> List<U> {
        return try self.foldr(acc: List<U>.`nil`, f: { acc, list in
            return List<U>.cons(head: try f(acc), tail: list)
        })
    }
    
    func flatMap<U>(f: (T) throws -> List<U>) rethrows -> List<U> {
        return try foldr(acc: List<U>.`nil`, f: { acc, list in
            return try f(acc).append(another: list)
        })
    }
    
    func filter(p: (T) -> Bool) -> List<T> {
        return foldr(acc: List<T>.`nil`, f: { acc, list in
            if p(acc) {
                return List.cons(head: acc, tail: list)
            }
            return list
        })
    }
}
