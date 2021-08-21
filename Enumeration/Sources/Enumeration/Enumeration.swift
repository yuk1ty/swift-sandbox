// From the example of Barcode
// https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

// `indirect` syntax enables us to create recursive enum data.
enum List<T> {
    indirect case cons(T, List<T>)
    case `nil`
}
