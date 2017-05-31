//
//  FoodViewController.swift
//  MeiTuan
//
//  Created by afarsoft on 2017/5/31.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

let btnW = (SCREENW-50)/4
let btnH:CGFloat = 30

class FoodViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var head = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }
    func initUI()  {
        //self.automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.white
        
        head = UIView.init(frame: CGRect(x: 0, y: 0, width:SCREENW, height: 90))
        head.isUserInteractionEnabled = true
        head.backgroundColor = RGBColor(r: 239, g: 239, b: 239)
        let titles = ["热门","小吃快餐","面包甜点","川菜","东北菜","西北菜","湘菜","江浙菜"]
        for i in 0..<8 {
            let choseBtn = UIButton.init(type: .custom)
            choseBtn.frame = CGRect(x: CGFloat(10*(i%4+1))+CGFloat(i%4)*btnW, y: CGFloat(10*(i/4+1))+btnH*CGFloat((i/4)), width:btnW, height: btnH)
            choseBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            choseBtn.tag = i+1
            choseBtn.setTitle(titles[i], for: .normal)
            choseBtn.setTitleColor(RGBColor(r: 185, g: 185, b: 185), for: .normal)
            choseBtn.backgroundColor = UIColor.white
            choseBtn.layer.cornerRadius = 15
            choseBtn.layer.masksToBounds = true
            head.addSubview(choseBtn)
            choseBtn.addTarget(self, action: #selector(choseBtnClick(sender:)), for: .touchUpInside)
            if i==0 {
                choseBtn.setTitleColor(UIColor.white, for: .normal)
                choseBtn.backgroundColor = RGBColor(r: 255, g: 47, b: 96)
            }
        }
        
        let foodTable = UITableView.init(frame: view.bounds, style: .plain)
        foodTable.tableHeaderView = head
        foodTable.delegate = self
        foodTable.dataSource = self
        foodTable.rowHeight = 190
        view.addSubview(foodTable)
        foodTable.register(UINib.init(nibName: "FoodCell", bundle: nil), forCellReuseIdentifier: "foodCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! FoodCell
        return cell
        
    }
    func choseBtnClick(sender:UIButton)  {
        for item in head.subviews {
            let btn = item as! UIButton
            
            if sender.tag == btn.tag {
                btn.backgroundColor = RGBColor(r: 255, g: 47, b: 96)
                btn.setTitleColor(UIColor.white, for: .normal)
            }else{
                btn.backgroundColor = UIColor.white
                btn.setTitleColor(RGBColor(r: 185, g: 185, b: 185), for: .normal)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
