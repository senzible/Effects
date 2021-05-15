import Foundation

/**
 Unpacks a closure wrapped inside an effect value into a effect closure `E<a> -> E<b>`.
 
  - Parameters:
     - lhs: An Result closure of type `Result<Input -> Output, Error>`
     - rhs: An effect value of type `Result<Input, Error>`
 
  - Remark:
     - If either the closure or the input are `.failure` the closure will not be evaluated and will return the original error
     - If both the closure and the input are `.success` the closure will be applied to the input
 
  - Returns: An effect value of type `Result<Output, Error>`
*/
public func <*> <Input, Output, Error>(lhs: Result<(Input) -> Output, Error>,
                                       rhs: Result<Input, Error>) -> Result<Output, Error> {
    lhs >>= { $0 <^> rhs }
    //return lhs.flatMap { rhs.map($0) }
}
