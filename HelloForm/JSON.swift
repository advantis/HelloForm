//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

enum JSON {
    // TODO: Implement other node types
    case JObj([String:JSON])
    case JSeq([JSON])
    case JStr(String)
    case JNum(Double)
    case JNull

    init(data: NSData) {
        self = JSON(NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil))
    }

    init(_ value: AnyObject) {
        switch value {
            case let string as NSString:
                self = .JStr(string)
            case let number as NSNumber:
                self = .JNum(number.doubleValue)
            case let dictionary as NSDictionary:
                var object: [String:JSON] = [:]
                for (key: AnyObject, value: AnyObject) in dictionary {
                    if let keyString = key as? String {
                        object[keyString] = JSON(value)
                    }
                }
                self = .JObj(object)
            case let array as NSArray:
                var sequence: [JSON] = []
                for object: AnyObject in array {
                    sequence.append(JSON(object))
                }
                self = .JSeq(sequence)
            default:
                self = .JNull
        }
    }

    subscript(key: String) -> JSON! {
        get {
            switch self {
                case .JObj(let dictionary):
                    return dictionary[key]
                default:
                    return nil
            }
        }
    }

    func __conversion() -> Int! {
        switch self {
            case .JNum(let number):
                return Int(number)
            default:
                return nil
        }
    }

    func __conversion() -> Double! {
        switch self {
            case .JNum(let number):
                return number
            default:
                return nil
        }
    }

    func __conversion() -> String! {
        switch self {
            case .JStr(let string):
                return string
            default:
                return nil
        }
    }
}

extension JSON: Sequence {
    func generate() -> IndexingGenerator<[JSON]> {
        switch self {
            case .JSeq(let array):
                return array.generate()
            default:
                return [self].generate()
        }
    }
}
