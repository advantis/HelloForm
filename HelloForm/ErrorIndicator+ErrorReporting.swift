//
//  Copyright © 2014 Yuri Kotov
//

import UIKit

extension ErrorIndicator: ErrorReporting {

    func setError(error: NSError?) {
        backgroundColor = error ? UIColor.redColor() : UIColor.greenColor()
    }
}