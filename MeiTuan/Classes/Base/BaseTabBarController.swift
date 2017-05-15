//
//  BaseTabBarController.swift
//  MeiTuan
//
//  Created by CW on 2017/5/11.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabBar.tintColor = BaseColor
        addChildViewControllers()
    }
    /**
     # 添加子控制器
     */
    private func addChildViewControllers() {
        addChildViewController(childControllerName: "HomeViewController", title: "首页", imageName: "pfb_tabbar_homepage")
        addChildViewController(childControllerName: "NearViewController", title: "附近", imageName: "pfb_tabbar_merchant")
        addChildViewController(childControllerName: "HangViewController", title: "逛一逛", imageName: "pfb_tabbar_discover")
        addChildViewController(childControllerName: "OrderViewController", title: "订单", imageName: "pfb_tabbar_order")
        addChildViewController(childControllerName: "MyViewController", title: "我的", imageName: "pfb_tabbar_mine")
    }
    /**
     # 初始化子控制器
     
     - parameter childControllerName: 需要初始化的控制器
     - parameter title:               标题
     - parameter imageName:           图片名称
     */
    private func addChildViewController(childControllerName: String, title: String, imageName: String) {
        // 动态获取命名空间
        let ns = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        // 将字符串转化为类，默认情况下命名空间就是项目名称，但是命名空间可以修改
        let cls: AnyClass? = NSClassFromString(ns + "." + childControllerName)
        let vcClass = cls as! UIViewController.Type
        let vc = vcClass.init()
        // 设置对应的数据
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        vc.title = title
        // 给每个控制器包装一个导航控制器
        let nav = BaseNavigationController()
        nav.addChildViewController(vc)
        addChildViewController(nav)
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
