import Foundation

/**
 Composition operator. Takes two functions and turns them into one.

 - Parameters:
    - lhs: The function on the left hand side
    - rhs: The function on the right hand side

 - Returns: A new function that takes the input of the left hand side and the output of the right hand side.
 */
public func >> <Input, Output1, Output2>(lhs: @escaping (Input) -> Output1,
                                         rhs: @escaping (Output1) -> Output2) -> (Input) -> Output2 {
    return { (input) in
        input
            |> lhs
            |> rhs
    }
}
