import Foundation

precedencegroup PipePrecedence {
    associativity: left
    higherThan: TernaryPrecedence
    lowerThan: LogicalDisjunctionPrecedence
}

precedencegroup CompositionPrecedence {
    associativity: left
    higherThan: PipePrecedence
    lowerThan: LogicalDisjunctionPrecedence
}

precedencegroup MappablePrecedence {
    associativity: left
    higherThan: LogicalConjunctionPrecedence
    lowerThan: NilCoalescingPrecedence
}

precedencegroup ApplicablePrecedence {
    associativity: left
    higherThan: LogicalConjunctionPrecedence
    lowerThan: NilCoalescingPrecedence
}

precedencegroup BindablePrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
    lowerThan: LogicalDisjunctionPrecedence
}

infix operator |> : PipePrecedence
infix operator >> : CompositionPrecedence

//map
infix operator <^> : MappablePrecedence

//apply
infix operator <*> : ApplicablePrecedence

//bind
infix operator >>= : BindablePrecedence
//kleisli composition (monadic composition)
infix operator >=> : BindablePrecedence
