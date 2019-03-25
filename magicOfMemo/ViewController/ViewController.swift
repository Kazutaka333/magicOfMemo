//
//  ViewController.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/10/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit
import CoreData
import GoogleMobileAds
import StoreKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var progressButton: UIBarButtonItem! {
        didSet {
            let attributes = [NSAttributedString.Key.strokeColor: UIColor.lightGray]
            progressButton.setTitleTextAttributes(attributes, for: .disabled)
        }
    }
    
    var levels: [Level] = []
    var adIsLoaded = false
    var adView : GADBannerView!
    
    var adUnitID: String {
        if stage != Stage.deploy {
            return ADMOB_TEST_AD_UNIT_ID
        }
        return "ca-app-pub-5469649181550273/2393186636"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadLevels()
        updateUI()
        setupAdView()
        tableView.register(UINib(nibName: "LevelCell", bundle: Bundle.main), forCellReuseIdentifier: "LevelCell")
        tableView.register(UINib(nibName: "BannerCell", bundle: Bundle.main), forCellReuseIdentifier: "BannerCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUI()
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
    
    func updateUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.reloadData()
        var doneCount = 0
        for level in levels {
            guard let questions = level.questions.array as? [Question] else {return}
            for q in questions {
                if q.isDone {
                    doneCount += 1
                }
            }
        }
        progressButton.title = "\(doneCount)/1000"
        if doneCount > 10 && !(UserDefaults.standard.bool(forKey: "reviewAsked")) {
            if #available(iOS 10.3, *) {
                SKStoreReviewController.requestReview()
            }
            UserDefaults.standard.set(true, forKey: "reviewAsked")
        } else if doneCount > 50 && !(UserDefaults.standard.bool(forKey: "reviewAsked2")) {
            if #available(iOS 10.3, *) {
                SKStoreReviewController.requestReview()
            }
            UserDefaults.standard.set(true, forKey: "reviewAsked2")
        }
    }
    
    func setupAdView() {
        // Ensure subview layout has been performed before accessing subview sizes.
        tableView.layoutIfNeeded()
        let adSize = GADAdSizeFromCGSize(
            CGSize(width: tableView.contentSize.width, height: AD_VIEW_HEIGHT))
        adView = GADBannerView(adSize: adSize)
        adView.adUnitID = adUnitID
        adView.rootViewController = self
        adView.delegate = self
        let adRequest = GADRequest()
        if stage != Stage.deploy {
            adRequest.testDevices = [ "c0b9b945e7a65bb0f5e59fbfb1f92a5d" ]
        }
        adView.load(adRequest)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levels.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell") as? BannerCell,
                adIsLoaded else { return UITableViewCell()}
            cell.load(adView: adView)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LevelCell") as? LevelCell else { return UITableViewCell()}
            cell.indexPath = indexPath
            cell.level = levels[indexPath.row-1]
            return cell
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row > 0 else { return }
        let storyboard = UIStoryboard(name: "TimeCategory", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! TimeCategoryViewController
        let level = levels[indexPath.row-1]
        guard let categories = level.timeCategories.array as? [TimeCategory] else {return}
        vc.title = level.title
        vc.timeCategories = categories
        tableView.deselectRow(at: indexPath, animated: true)
        show(vc, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            guard adIsLoaded else { return 0 }
            return AD_VIEW_HEIGHT
        }
        return CELL_HEIGHT
    }
}

extension ViewController: GADBannerViewDelegate {
    func adViewDidReceiveAd(_ adView: GADBannerView) {
        // Mark banner ad as succesfully loaded.
        adIsLoaded = true
        tableView.reloadData()
    }
    
    func adView(_ adView: GADBannerView,
                didFailToReceiveAdWithError error: GADRequestError) {
        print("Failed to receive ad: \(error.localizedDescription)")
    }
}
