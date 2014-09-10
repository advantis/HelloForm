//
//  Copyright © 2014 Yuri Kotov
//

import UIKit

extension TextField: ErrorReporting {

    var errorIndicator: ErrorIndicator {
        if rightView != nil {
            rightView = ErrorIndicator(size: 6)
        }
        return rightView as ErrorIndicator
    }

    func setError(error: NSError?) {
        // TODO: Move to the "text" property observer
        rightViewMode = text.isEmpty
            ? UITextFieldViewMode.Never
            : UITextFieldViewMode.Always
        errorIndicator.setError(error)
    }

    override func rightViewRectForBounds(bounds: CGRect) -> CGRect {
        return super.rightViewRectForBounds(bounds).rectByOffsetting(dx: -6, dy: 0)
    }
}