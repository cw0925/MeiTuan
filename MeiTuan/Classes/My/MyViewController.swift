//
//  MyViewController.swift
//  MeiTuan
//
//  Created by CW on 2017/5/11.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit
import SnapKit

class MyViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource{

    var lastOffsetY:CGFloat = 0
    let topImg = UIImageView()
    let head = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
        customNavigationBar()
    }
    func customNavigationBar()  {
        self.navigationController?.isNavigationBarHidden = true
        let navigationBar = UIView.init(frame: CGRect(x: 0, y: 20, width:SCREENW, height: 44))
        navigationBar.backgroundColor = UIColor.clear
        view.addSubview(navigationBar)
        for i in (0..<3).reversed() {
            let btn = UIButton.init(type: .custom)
            btn.frame = CGRect(x: SCREENW-CGFloat(20*(i+1))-CGFloat(10*(i+1)), y:12, width:20, height: 20)
            btn.setBackgroundImage(UIImage.init(named: "icon_navigationItem_theme_white"), for: .normal)
            navigationBar.addSubview(btn)
        }
    }
    func initUI()  {
        self.lastOffsetY = -260+35
        view.addSubview(self.topImg)
        self.topImg.image = UIImage.init(named: "bg_filter_price_selected")
        topImg.snp.makeConstraints({ (make) in
            make.top.equalTo(view).offset(0)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(260)
        })
        
        head.frame = CGRect(x: 0, y: 0, width:SCREENW, height: 100)
        head.backgroundColor = UIColor.clear
        
        let icon  = UIImageView.init(frame: CGRect(x: 20, y: 20, width:60, height: 60))
        icon.image = UIImage.init(named: "icon_homepage_movieCategory_44x44_")
        head.addSubview(icon)
        
        let name = UILabel.init(frame: CGRect(x: 100, y: 20, width:SCREENW-100, height: 25))
        name.text = "cw0925"
        head.addSubview(name)
        
        let info = UILabel.init(frame: CGRect(x: 100, y: 45, width:SCREENW-100, height: 30))
        info.text = "个人信息>"
        head.addSubview(info)
        
        let myTable = UITableView.init(frame: CGRect(x: 0, y: 64, width:SCREENW, height: SCREENH-64), style: .grouped)
        myTable.backgroundColor = UIColor.clear
        myTable.delegate = self
        myTable.dataSource = self
        myTable.tableHeaderView = head
        view.addSubview(myTable)
        myTable.register(UINib.init(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "myCell")
    }
    //tableviewdelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }else if section == 1{
            return 5
        }else{
            return 3
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    //scrolldelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let delta = offsetY-self.lastOffsetY
        var height = 260-delta
        if height<64 {
            height = 64
        }
        self.topImg.snp.updateConstraints({ (make) in
            make.height.equalTo(height)
        })
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
