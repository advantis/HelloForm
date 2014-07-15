//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

protocol ResponseSerialization {
    typealias ReturnType
    func objectForResponse(response: NSURLResponse, data: NSData, error: NSErrorPointer) -> ReturnType
}