//
//  DetailsViewController.swift
//  LandmarkBook
//
//  Created by Mert Erciyes Çağan on 5/29/24.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var landmarkImage: UIImageView!
    
    @IBOutlet weak var landmarkLabel: UILabel!
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landmarkLabel.text = selectedLandmarkName
        landmarkImage.image = selectedLandmarkImage

    }


}
