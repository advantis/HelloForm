//
//  Copyright © 2014 Yuri Kotov
//

@objc // Currently crashes using @class_protocol
protocol Observer {
    func observableDidUpdate(observable: Observable)
}