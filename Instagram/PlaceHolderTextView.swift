//
//  PlaceHolderTextView.swift
//  Instagram
//
//  Created by 稲葉任哉 on 2021/05/05.
//

import UIKit

public class PlaceHolderTextView: UITextView {
    lazy var placeHolderLabel:UILabel = UILabel()
    var placeHolderColor:UIColor      = UIColor.lightGray
    var placeHolder:String          = ""
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        NotificationCenter.default.addObserver(self, selector: #selector(textChanged(notification:)), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    override public func draw(_ rect: CGRect) {
        if(self.placeHolder.count > 0) {
            self.placeHolderLabel.frame           = CGRect(x: 8, y:8, width:self.bounds.size.width - 16,height: 0)
            self.placeHolderLabel.lineBreakMode   = NSLineBreakMode.byWordWrapping
            self.placeHolderLabel.numberOfLines   = 0
            self.placeHolderLabel.font            = self.font
            self.placeHolderLabel.backgroundColor = UIColor.clear
            self.placeHolderLabel.textColor       = self.placeHolderColor
            self.placeHolderLabel.alpha           = 0
            self.placeHolderLabel.tag             = 1
            
            self.placeHolderLabel.text = self.placeHolder as String
            self.placeHolderLabel.sizeToFit()
            self.addSubview(placeHolderLabel)
        }
        
        self.sendSubviewToBack(placeHolderLabel)
        
        if(self.text.utf16.count == 0 && self.placeHolder.count > 0){
            self.viewWithTag(1)?.alpha = 1
        }
        
        super.draw(rect)
    }
    
    @objc public func textChanged(notification:NSNotification?) -> (Void) {
        if(self.placeHolder.count == 0){
            return
        }
        
        if(self.text.utf16.count == 0) {
            self.viewWithTag(1)?.alpha = 1
        }else{
            self.viewWithTag(1)?.alpha = 0
        }
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
