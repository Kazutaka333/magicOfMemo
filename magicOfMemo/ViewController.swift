//
//  ViewController.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/10/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let levels = ["レベル① 夢についての100問",
                  "レベル② 性格についての100問①",
                  "レベル③ 性格についての100問②",
                  "レベル④ 経験についての100問①",
                  "レベル⑤ 経験についての100問②",
                  "レベル⑥ 家族・親戚についての100問",
                  "レベル⑦ 友人・知人についての100問",
                  "レベル⑧ 勉強・仕事についての100問①",
                  "レベル⑨ 勉強・仕事についての100問②",
                  "レベル⑩ 趣味・嗜好についての100問"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "levelCell")
        cell?.textLabel?.text = levels[indexPath.row]
        return cell!
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/CGFloat(levels.count)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "TimeCategory", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! TimeCategoryViewController
        vc.title = levels[indexPath.row]
        vc.index = indexPath.row
        show(vc, sender: self)
    }
}

