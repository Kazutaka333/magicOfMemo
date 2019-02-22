//
//  ViewController.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/10/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var levels: [Level] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadLevels()
        tableView.register(UINib(nibName: "ProgressBarCell", bundle: Bundle.main), forCellReuseIdentifier: "ProgressBarCell")
    }
    
    func loadLevels() {
        let fetchRequest: NSFetchRequest<QuestionData> = QuestionData.fetchRequest()
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let moc = delegate.persistentContainer.viewContext
        
        do {
            let results = try moc.fetch(fetchRequest)
            if let levels = results[0].levels?.array as? [Level] {
                self.levels = levels
            }
        } catch {
            fatalError("There was an error fetching the list of levels!")
        }
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgressBarCell") as! ProgressBarCell
        cell.titleLabel.text = levels[indexPath.row].title
        cell.indexPath = indexPath
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "TimeCategory", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! TimeCategoryViewController
        let level = levels[indexPath.row]
        guard let categories = level.timeCategories.array as? [TimeCategory] else {return}
        vc.title = level.title
        vc.timeCategories = categories
        tableView.deselectRow(at: indexPath, animated: true)
        show(vc, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

