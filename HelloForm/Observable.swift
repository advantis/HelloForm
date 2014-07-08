//
//  Copyright © 2014 Yuri Kotov
//

@objc // Currently crashes using @class_protocol
protocol Observable {
    @objc // Fixes "does not implement methodSignatureForSelector:" when accessing observer from outside
    weak var observer: Observer? {get set}
}