//
//  Copyright © 2014 Yuri Kotov
//

import UIKit

class ErrorIndicator: UIView {
    
    init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(size: CGFloat) {
        self.init(frame:CGRectMake(0, 0, size, size))
    }

    override var frame: CGRect {
        didSet {
            self.layer.cornerRadius = min(CGRectGetWidth(frame), CGRectGetHeight(frame)) / 2
        }
    }
}
