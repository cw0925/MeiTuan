//
//  MyViewController.swift
//  MeiTuan
//
//  Created by CW on 2017/5/11.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class MyViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }
    func initUI()  {
        let head = UIView.init(frame: CGRect(x: 0, y: 0, width:SCREENW, height: 100))
        head.backgroundColor = UIColor.green
        
        let icon  = UIImageView.init(frame: CGRect(x: 20, y: 20, width:60, height: 60))
        icon.image = UIImage.init(named: "icon_homepage_movieCategory_44x44_")
        head.addSubview(icon)
        
        let name = UILabel.init(frame: CGRect(x: 100, y: 20, width:SCREENW-100, height: 25))
        name.text = "cw0925"
        head.addSubview(name)
        
        let info = UILabel.init(frame: CGRect(x: 100, y: 45, width:SCREENW-100, height: 30))
        info.text = "个人信息>"
        head.addSubview(info)
        
        
        let myTable = UITableView.init(frame: view.bounds, style: .grouped)
        myTable.delegate = self
        myTable.dataSource = self
        myTable.tableHeaderView = head
        view.addSubview(myTable)
        myTable.register(UINib.init(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "myCell")
    }
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
