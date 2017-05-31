//
//  WholeViewController.swift
//  MeiTuan
//
//  Created by afarsoft on 2017/5/31.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class WholeViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }
    func initUI() {
        view.backgroundColor = UIColor.white
        let wholeTable = UITableView.init(frame: view.bounds, style: .plain)
        wholeTable.delegate = self
        wholeTable.dataSource = self
        wholeTable.rowHeight = 190
        view.addSubview(wholeTable)
        wholeTable.register(UINib.init(nibName: "FoodCell", bundle: nil), forCellReuseIdentifier: "foodCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! FoodCell
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
