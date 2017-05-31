//
//  NearViewController.swift
//  MeiTuan
//
//  Created by CW on 2017/5/11.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class NearViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }
    func initUI() {
        automaticallyAdjustsScrollViewInsets = false
        let titles = ["享美食","住酒店","爱玩乐","全部"]
        let style = XXTitleStyle()
        style.isScrollEnable = false
        style.isShowScrollLine = true
        var childVcs = [UIViewController]()
        let foodVC = FoodViewController()
        childVcs.append(foodVC)
        let hotelVC = HotelViewController()
        childVcs.append(hotelVC)
        let funVC = FunViewController()
        childVcs.append(funVC)
        let wholeVC = WholeViewController()
        childVcs.append(wholeVC)
        
        
        let pageFrame = CGRect(x: 0, y: 64, width:SCREENW, height: view.bounds.height - 64-49)
        
        let tallyView = XXTallyView(frame: pageFrame, titles: titles, childVcs: childVcs, parentVc: self, style: style)
        tallyView.backgroundColor = UIColor.white
        view.addSubview(tallyView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
