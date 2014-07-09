//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

// Temporary workaround for "LLVM ERROR: unimplemented IRGen feature! non-fixed multi-payload enum layout"
struct Box<T> {

    let closure: () -> T

    init(_ value: T) {
        closure = { value }
    }

    var value: T {
        get { return closure() }
    }

    func __conversion() -> T {
        return value
    }
}

enum Result<T>: LogicValue {

    case Success(Box<T>)
    case Failure(NSError)

    func getLogicValue() -> Bool {
        switch self {
            case .Success:
                return true
            case .Failure:
                return false
        }
    }
}
