//
//  HangViewController.swift
//  MeiTuan
//
//  Created by CW on 2017/5/11.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class HangViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }
    func initUI() {
        automaticallyAdjustsScrollViewInsets = false
        let titles = ["头条","美食","玩乐","影视"]
        let style = XXTitleStyle()
        style.isScrollEnable = false
        style.isShowScrollLine = true
        
        var childVcs = [UIViewController]()
        let headVC = HeadLineViewController()
        childVcs.append(headVC)
        let deliciousVC = DeliciousViewController()
        childVcs.append(deliciousVC)
        let funVC = HaveFunViewController()
        childVcs.append(funVC)
        let filmVC = FilmViewController()
        childVcs.append(filmVC)
        
        
        let pageFrame = CGRect(x: 0, y: 64, width:SCREENW, height: view.bounds.height - 64-49)
        
        let tallyView = XXTallyView(frame: pageFrame, titles: titles, childVcs: childVcs, parentVc: self, style: style)
        tallyView.backgroundColor = UIColor.white
        view.addSubview(tallyView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
