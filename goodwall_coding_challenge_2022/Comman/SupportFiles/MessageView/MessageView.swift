//
//  MessageView.swift
//  MVVMRx
//
//  Created by Tayseer Anwar on 28/01/2022.
//

import UIKit


public enum MessageViewTheme {
    case success
    case warning
    case error
}

class MessageView: UIView {
    
    static var sharedInstance = MessageView()
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet var containerView: UIView!
    
    var parentView: UIView!
    
    private var maskingView : UIView!

    var hideTimer : Timer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit(){
        Bundle.main.loadNibNamed("MessageView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    func showOnView(message:String,messageViewTheme:MessageViewTheme){
        parentView = UIApplication.shared.keyWindow
        parentView.addSubview(self)
        addMaskView()
        messageLabel.text = message
        applyTheme(messageViewTheme: messageViewTheme)
        self.frame.size = CGSize(width: parentView.frame.width, height: 100)
        self.frame = CGRect(x: parentView.frame.minX, y: parentView.frame.minY - self.frame.height , width: self.frame.width, height: self.frame.height)
        parentView.bringSubviewToFront(self)
        UIView.animate(withDuration: 0.2) {
            self.frame = CGRect(x: self.parentView.frame.minX, y: self.parentView.frame.minY, width: self.frame.width, height: self.frame.height)
        }
        makeDim()
        hideTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(hideView), userInfo: nil, repeats: false)
    }
    private func applyTheme(messageViewTheme:MessageViewTheme) {
        var backgroundColor : UIColor
        switch messageViewTheme {
        case .error:
            backgroundColor = UIColor(red: 249.0/255.0, green: 66.0/255.0, blue: 47.0/255.0, alpha: 1.0)
        case .success:
            backgroundColor = UIColor(red: 97.0/255.0, green: 161.0/255.0, blue: 23.0/255.0, alpha: 1.0)
        case .warning:
            backgroundColor = UIColor(red: 238.0/255.0, green: 189.0/255.0, blue: 34.0/255.0, alpha: 1.0)
        }
        self.backgroundColor = backgroundColor
    }
    func addMaskView() {
        maskingView = UIView(frame: parentView.bounds)
        parentView.addSubview(maskingView)
        maskingView.backgroundColor = .clear
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideView))
        maskingView.addGestureRecognizer(tap)
        parentView.addSubview(maskingView)
        maskingView.fillToSuperView()
    }
    func makeDim(){
        self.maskingView.backgroundColor = UIColor.clear
        UIView.animate(withDuration: 0.2, animations: {
            self.maskingView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        })
    }
    @objc func hideView(){
        hideTimer.invalidate()
        UIView.animate(withDuration: 0.2, animations: {
            self.maskingView.backgroundColor = .clear
            self.frame.origin.y -= 100
        }) { (_) in
            self.maskingView.removeFromSuperview()
            self.removeFromSuperview()
        }
    }
}
