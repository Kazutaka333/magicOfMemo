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
        tableView.register(UINib(nibName: "ProgressBarCell", bundle: Bundle.main), forCellReuseIdentifier: "ProgressBarCell")
    }
}

extension TimeCategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgressBarCell", for: indexPath) as! TimeCategoryCell
        cell.titleLabel.text = timeCategories[indexPath.row].title
        guard let qs = timeCategories[indexPath.row].questions.array as? [Question] else {return cell}
        cell.questions = qs
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
        show(vc, sender: self)
    }
}
