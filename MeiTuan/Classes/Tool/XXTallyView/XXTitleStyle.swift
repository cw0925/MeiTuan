//
//  XXTitleStyle.swift
//  XXTallyView
//
//  Created by 李珈旭 on 2017/5/23.
//  Copyright © 2017年 JiaXu. All rights reserved.
//

import UIKit

class XXTitleStyle {
    /// title的高度
    var titleHeight: CGFloat = 44
    /// title正常颜色
    var normalColor: UIColor = RGBColor(r: 113, g: 113, b: 113)
    //var normalColor: UIColor = UIColor.red
    /// title的选中颜色
    var selectColor: UIColor = RGBColor(r: 255, g: 55, b: 100)
    //var selectColor: UIColor = UIColor.green
    /// title的字体大小
    var fontSize: CGFloat = 15
    
    /// titleView是否滑动
    var isScrollEnable = false
    /// 标签之间的间距
    var itemMargin: CGFloat = 30
    
    /// 是否显示底部line
    var isShowScrollLine : Bool = false
    /// line的高度
    var scrollLineHeight : CGFloat = 2
    /// line的北京颜色
    var scrollLineColor : UIColor = RGBColor(r: 255, g: 55, b: 100)
    
    
}
