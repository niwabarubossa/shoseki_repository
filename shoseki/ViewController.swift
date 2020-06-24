//
//  ViewController.swift
//  shoseki
//
//  Created by Ni Ryogo on 2020/06/24.
//  Copyright © 2020 Ni Ryogo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource:[String] = ["number 0","number 1","number2","number3","number4","5","6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewSetup()
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    private func tableViewSetup(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell") as? MyTableViewCell {
            //行ごとの番号が呼ばれる　０番目のセル（上から１つ目のせる）は　self.dataSource[0]の要素　つまり number0 が代入される。
            cell.myLabel.text = self.dataSource[indexPath.row]
            return cell
        }
        return MyTableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //高さ200px ここで決まる
        return 50
    }
    
    
}
