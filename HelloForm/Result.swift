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

    func getValue() -> T {
        return value
    }
}

enum Result<T>: BooleanType {

    case Success(Box<T>)
    case Failure(NSError)

    var boolValue: Bool {
        switch self {
            case .Success:
                return true
            case .Failure:
                return false
        }
    }
}
