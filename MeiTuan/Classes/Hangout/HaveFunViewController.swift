//
//  HaveFunViewController.swift
//  MeiTuan
//
//  Created by afarsoft on 2017/5/31.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class HaveFunViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }
    func initUI()  {
        view.backgroundColor = UIColor.white
        
        let headTable = UITableView.init(frame: view.bounds, style: .plain)
        headTable.delegate = self
        headTable.dataSource = self
        self.view.addSubview(headTable)
        
        headTable.register(UINib.init(nibName: "HeadOneCell", bundle: nil), forCellReuseIdentifier: "oneCell")
        headTable.register(UINib.init(nibName: "HeadThreeCell", bundle: nil), forCellReuseIdentifier: "threeCell")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row%2==0 {
            return 80
        }else{
            return 200
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row%2==0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "oneCell", for: indexPath) as! HeadOneCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "threeCell", for: indexPath) as! HeadThreeCell
            return cell
        }
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
