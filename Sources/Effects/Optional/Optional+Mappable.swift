import Foundation

/**
 Lifts a function into the Optional effect world.
 
  - Parameters:
     - lhs: A closure of type `(Input) -> Output`
     - rhs: An effect value of type `Optional<Input>`
 
  - Remark: "map" is the generic name for something that takes a closure in the normal world and transforms it into a corresponding closure in the effects world.
 
  - Returns: An effect value of type `Optional<Output>`
 */
func <^> <Input, Output> (lhs: (Input) -> Output,
                          rhs: Optional<Input>) -> Optional<Output> {
    switch rhs {
    case.some(let input):
        return .some(lhs(input))
    case .none:
        return nil
    }
}
