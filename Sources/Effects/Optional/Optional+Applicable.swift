import Foundation

/**
 Unpacks a closure wrapped inside an effect value into a effect closure `E<a> -> E<b>`.
 
  - Parameters:
     - lhs: An optional closure of type `Input -> Output`
     - rhs: An effect value of type `Optional<Input>`
 
  - Remark:
     - If either the closure or the input are `.none` the closure will not be evaluated and will return `.none`
     - If both the closure and the input are `.some` the closure will be applied to the input
 
  - Returns: An effect value of type `Optional<Output>`
*/
public func <*> <Input, Output>(lhs: Optional<(Input) -> Output>,
                                rhs: Optional<Input>) -> Optional<Output> {
    switch (lhs, rhs) {
    case (.some(let f), .some(let value)):
        return .some(f(value))
    case (_, _):
        return .none
    }
}
