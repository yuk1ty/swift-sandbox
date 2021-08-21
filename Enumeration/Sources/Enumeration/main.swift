func detectBarcodeKind(barcode: Barcode) -> String {
    var ret: String
    switch barcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        ret = "UPC: \(numberSystem), \(manufacturer), \(product), \(check)"
    case .qrCode(let productCode):
        ret = "QR code: \(productCode)"
    };
    return ret
}

let upc = Barcode.upc(8, 85909, 51226, 3)
let qrCode = Barcode.qrCode("ABCDEFGHIJKLMNOP")

assert(detectBarcodeKind(barcode: upc) == "UPC: 8, 85909, 51226, 3")
assert(detectBarcodeKind(barcode: qrCode) == "QR code: ABCDEFGHIJKLMNOP")

let oneTwoThree = List.cons(1, List.cons(2, List.cons(3, List.`nil`)))

func head(source: List<Int>) -> Int? {
    switch source {
    case let .cons(head, _):
        return head
    case .`nil`:
        return nil
    }
}

let popped = head(source: oneTwoThree)
assert(popped == 1)
