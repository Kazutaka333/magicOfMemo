//
//  TimeCategoryViewController.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/11/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit

class TimeCategoryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let timeCategories = [["introduction","幼少期","小学校","中学校","高校","大学","社会人（20代）","未来","現在"],
                          ["introduction","幼少期","小学校","中学校","高校","大学","社会人（20代）","現在"],
                          ["introduction","幼少期","小学校","中学校","高校","大学","社会人（20代）","現在"],
                          ["introduction","幼少期","小学校","中学校","高校","大学","社会人（20代）","現在"],
                          ["introduction","幼少期","小学校","中学校","高校","大学","社会人（20代）","現在"],
                          ["introduction","幼少期","小学校","中学校","高校","大学","社会人（20代）","現在"],
                          ["introduction","幼少期","小学校","中学校","高校","大学","社会人（20代）","現在"],
                          ["introduction","幼少期","小学校","中学校","高校","大学","社会人（20代）","現在"],
                          ["introduction","幼少期","小学校","中学校","高校","大学","社会人（20代）","現在"],
                          ["introduction","幼少期","小学校","中学校","高校","大学","社会人（20代）","現在","conclusion"]]
    var index: Int!

}

extension TimeCategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeCategories[index].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeCategory")
        cell?.textLabel?.text = timeCategories[index][indexPath.row]
        return cell!
    }
    
    
}

extension TimeCategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/CGFloat(timeCategories[index].count)
    }
}
