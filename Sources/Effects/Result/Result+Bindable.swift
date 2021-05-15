import Foundation

public func >>= <Input, Output, Error> (lhs: Result<Input, Error>,
                                        rhs: (Input) -> Result<Output, Error>) -> Result<Output, Error> {
    switch lhs {
    case .success(let input):
        return rhs(input)
    case .failure(let error):
        return .failure(error)
    }
}

public func >=> <Input, Intermediate, Output, Error> (lhs: @escaping (Input) -> Result<Intermediate, Error>,
                                                      rhs: @escaping (Intermediate) -> Result<Output, Error>) -> (Input) -> Result<Output, Error> {
    return { input in
        lhs(input) >>= rhs
    }
}
