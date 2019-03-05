//
//  QuestionListViewController.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/11/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//

import UIKit
import GoogleMobileAds

class QuestionListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var questions: [Question] = []
    
    var adIsLoaded = false
    var adView : GADBannerView!
    let adUnitID = "ca-app-pub-5469649181550273/6434172293"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "QuestionCell", bundle: Bundle.main), forCellReuseIdentifier: "QuestionCell")
        tableView.register(UINib(nibName: "BannerCell", bundle: Bundle.main), forCellReuseIdentifier: "BannerCell")
        tableView.contentInsetAdjustmentBehavior = .never
        setupAdView()
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

extension QuestionListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as? BannerCell,
                adIsLoaded else {return UITableViewCell()}
            cell.load(adView: adView)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        cell.question = questions[indexPath.row-1]
        cell.indexPath = indexPath
        return cell
    }
}

extension QuestionListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            guard adIsLoaded else { return 0 }
            return AD_VIEW_HEIGHT
        }
        return CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? QuestionCell else {return}
        cell.checkBox.setOn(!(cell.checkBox.on), animated: true)
    }
}

extension QuestionListViewController: GADBannerViewDelegate {
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
