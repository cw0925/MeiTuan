//
//  UIFont+Scale.swift
//  MeiTuan
//
//  Created by CW on 2017/5/15.
//  Copyright © 2017年 CW. All rights reserved.
//

import Foundation
import UIKit

extension UIFont{
    class func systemFontWithScale(size: CGFloat) -> UIFont {
        if isIPhone {
           return UIFont.systemFont(ofSize: size)
        }else{
            return UIFont.systemFont(ofSize:size*1.2)
        }
    }
}
