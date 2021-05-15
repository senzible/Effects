import Foundation

/**
 Lifts a function into the Result effect world.
 
  - Parameters:
     - lhs: A closure of type `(Input) -> Output`
     - rhs: An effect value of type `Result<Input, Error>`
 
  - Remark: "map" is the generic name for something that takes a closure in the normal world and transforms it into a corresponding closure in the effects world.
 
  - Returns: An effect value of type `Result<Output, Error>`
 */
func <^> <Input, Output, Error> (lhs: (Input) -> Output,
                                 rhs: Result<Input, Error>) -> Result<Output, Error> {
    switch rhs {
    case .success(let input):
        return .success(lhs(input))
    case .failure(let error):
        return .failure(error)
    }
}
