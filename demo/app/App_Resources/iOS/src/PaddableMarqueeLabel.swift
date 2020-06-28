import MarqueeLabel

/**
* Links:
* https://stackoverflow.com/questions/27459746/adding-space-padding-to-a-uilabel
* https://stackoverflow.com/questions/3476646/uilabel-text-margin
*/

@IBDesignable class PaddableMarqueeLabel: MarqueeLabel {

    @IBInspectable var topInset: CGFloat = 0.0
    @IBInspectable var leftInset: CGFloat = 0.0
    @IBInspectable var bottomInset: CGFloat = 0.0
    @IBInspectable var rightInset: CGFloat = 0.0

    @objc var padding: UIEdgeInsets {
        get {
            return UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        }
        set {
            topInset = newValue.top
            leftInset = newValue.left
            bottomInset = newValue.bottom
            rightInset = newValue.right
        }
    }

    // currently not supported
    @objc var borderThickness: UIEdgeInsets {
        get {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        set {
        }
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var adjSize = super.sizeThatFits(size)
        adjSize.width += leftInset + rightInset
        adjSize.height += topInset + bottomInset

        return adjSize
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }   

    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    } 
}