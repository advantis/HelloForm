//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

enum JSON {
    // TODO: Implement other node types
    case JObj(Dictionary<String, JSON>)
    case JStr(String)
    case JNum(Double)
    case JNull

    init(_ value: AnyObject) {
        switch value {
            case let string as NSString:
                self = .JStr(string)
            case let number as NSNumber:
                self = .JNum(number.doubleValue)
            case let dictionary as NSDictionary:
                var object: Dictionary<String, JSON> = [:]
                for (key: AnyObject, value: AnyObject) in dictionary {
                    if let keyString = key as? String {
                        object[keyString] = JSON(value)
                    }
                }
                self = .JObj(object)
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

    @conversion
    func __conversion() -> Int! {
        switch self {
            case .JNum(let number):
                return Int(number)
            default:
                return nil
        }
    }

    @conversion
    func __conversion() -> Double! {
        switch self {
        case .JNum(let number):
            return number
        default:
            return nil
        }
    }

    @conversion
    func __conversion() -> String! {
        switch self {
            case .JStr(let string):
                return string
            default:
                return nil
        }
    }
}