//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

class NetworkOperation<T> {
    var parser: EventParser! = nil
    var completion: (T) -> Void = {arg in}
    let closure: () -> NSData

    init(_ closure: () -> NSData) {
        self.closure = closure
    }

    func start() {
        let data = closure()
        let obj: T = parser.objectForResponse(NSURLResponse(), data: data, error: nil) as T
        let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC / 2))
        dispatch_after(delay, dispatch_get_main_queue()) {
            self.completion(obj)
        }
    }
}

extension NetworkOperation: Cancelable {
    func cancel() {}
}
