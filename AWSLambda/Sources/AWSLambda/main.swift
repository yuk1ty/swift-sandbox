import AWSLambdaRuntime

private struct Request: Codable {
    let name: String
}

private struct Response: Codable {
    let message: String
}

Lambda.run { (_, req: Request, callback) in
    callback(.success(Response(message: "Hello, \(req.name)")))
}
