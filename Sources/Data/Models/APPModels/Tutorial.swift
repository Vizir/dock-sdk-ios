//
//  Tutorial.swift
//  Mobile2you
//
//  Created by Leonardo Tomioka on 17/09/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

import Foundation
import UIKit

open class Tutorial {
    open var animation = ""
    open var title = ""
    open var text = ""
    
    init(withTitle title: String, withDetailText text: String, andAnimationNamed animationName: String) {
        //        if let image = UIImage(named: imageName) {
        //            self.image = image
        //        }
        self.animation = animationName
        self.title = title
        self.text = text
    }
}
