//
//  QuestionListViewController.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/11/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit

class QuestionListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var questions: [Question] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "QuestionCell", bundle: Bundle.main), forCellReuseIdentifier: "QuestionCell")
        tableView.contentInsetAdjustmentBehavior = .never
    }
}

extension QuestionListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        cell.question = questions[indexPath.row]
        cell.indexPath = indexPath
        return cell
    }
}

extension QuestionListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? QuestionCell else {return}
        cell.checkBox.setOn(!(cell.checkBox.on), animated: true)
    }
}
