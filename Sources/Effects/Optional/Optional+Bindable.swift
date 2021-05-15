import Foundation

/**
 Transforms a world-crossing function into a lifted function `E<Input> -> E<Output>`.
 
  - Parameters:
     - lhs: An effect value of type `Optional<Input>`
     - rhs: A world crossing closure of type `(Input) -> Optional<Output>`
 
  - Returns: An effect value of type `Optional<Output>`
*/
public func >>= <Input, Output> (lhs: Optional<Input>,
                                 rhs: (Input) -> Optional<Output>) -> Optional<Output> {
    switch lhs {
    case .some(let value):
        return rhs(value)
    case .none: return nil
    }
}

public func >=> <Input, Intermediate, Output> (lhs: @escaping (Input) -> Optional<Intermediate>,
                                               rhs: @escaping (Intermediate) -> Optional<Output>) -> (Input) -> Optional<Output> {
    return { input in
        lhs(input) >>= rhs
    }
}
