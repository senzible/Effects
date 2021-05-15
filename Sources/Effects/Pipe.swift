import Foundation

/**
 Pipe operator. Passes the result of the left side to the clsoure on the right side.

 - Parameters:
    - value: The value to pass to the function
    - closure: The closure to pass the value to

 - Returns: The output after passing the value to the closure.
 */
public func |> <Input, Output>(value: Input,
                               closure: ((Input) -> Output)) -> Output {
    return closure(value)
}
