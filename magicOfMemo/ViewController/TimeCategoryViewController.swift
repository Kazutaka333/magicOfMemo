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
    var timeCategories: [TimeCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UINib(nibName: "TimeCategoryCell", bundle: Bundle.main), forCellReuseIdentifier: "TimeCategoryCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        super.viewWillAppear(animated)
    }
}


extension TimeCategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeCategoryCell", for: indexPath) as! TimeCategoryCell
        cell.timeCategory = timeCategories[indexPath.row]
        cell.indexPath = indexPath
        return cell
    }
    
}

extension TimeCategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "QuestionList", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? QuestionListViewController else {return}
        let tc = timeCategories[indexPath.row]
        guard let questions = tc.questions.array as? [Question] else {return}
        vc.questions = questions
        vc.title = tc.title
        tableView.deselectRow(at: indexPath, animated: true)
        show(vc, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CELL_HEIGHT
    }
}
