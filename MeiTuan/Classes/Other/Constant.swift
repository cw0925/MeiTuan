//
//  Constant.swift
//  MeiTuan
//
//  Created by CW on 2017/5/11.
//  Copyright © 2017年 CW. All rights reserved.
//

import Foundation
import UIKit
/// 屏幕的宽
let SCREENW = UIScreen.main.bounds.size.width
/// 屏幕的高
let SCREENH = UIScreen.main.bounds.size.height
//主色调
let BaseColor = RGBColor(r: 0, g: 200, b: 176)
/// RGBA的颜色设置
func RGBAColor(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}
func RGBColor(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
}
///iPhone
let isIPhone = SCREENH <= 667 ? true : false
/// iPhone Plus
let isIPhoneP = SCREENH > 667 ? true : false
