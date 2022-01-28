//
//  ReactiveExtensiones.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 28/01/2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

extension UIViewController: loadingViewable {}

// we wrote an extension to Reactive which is in RxCocoa and affect RX property of UIViewController.
//
extension Reactive where Base: UIViewController {
    
    /// Bindable sink for `startAnimating()`, `stopAnimating()` methods.
    public var isAnimating: Binder<Bool> { //We implement isAnimating variable to UIViewControllers of type Binder<Bool> so that can be bindable.
        return Binder(self.base, binding: { (vc, active) in //the closure giving us the VC And value of is animating
            if active {
                vc.startAnimating()
            } else {
                vc.stopAnimating()
            }
        })
    }
    
}
