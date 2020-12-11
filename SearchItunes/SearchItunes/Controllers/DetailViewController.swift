//
//  DetailViewController.swift
//  SearchItunes
//
//  Created by Taof on 5/21/20.
//  Copyright © 2020 taoquynh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artisName: UILabel!
    @IBOutlet weak var trackPrice: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var watchButton: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var data: Itune?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let data = data {
            trackName.text = "Track: \(String(describing: data.trackName ?? ""))"
            artisName.text = "Artist: \(String(describing: data.artistName ?? ""))"
            trackPrice.text = "Price: \(String(describing: data.trackPrice ?? 0))"
            countryLabel.text = "Country: \(String(describing: data.country ?? ""))"
            primaryLabel.text = "Primary: \(String(describing: data.primaryGenreName ?? ""))"
            photoImageView.kf.setImage(with: URL(string: data.artworkUrl100 ?? ""))
        }
        
        trackName.numberOfLines = 0
        watchButton.backgroundColor = UIColor.blue
        watchButton.setTitleColor(.white, for: .normal)
        watchButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        watchButton.layer.cornerRadius = 30
        
        let backButton = UIBarButtonItem(image: UIImage(named: "expand"), style: .done, target: self, action: #selector(dimiss))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func dimiss(){
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func goPlay(_ sender: Any) {
        let playVC = WatchVideoViewController()
        playVC.item = data
        navigationController?.pushViewController(playVC, animated: true)
    }
}
