//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Mert Erciyes Çağan on 5/29/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var landmarkNames = [["name": String.self, "image" : UIImage.self]]
    var tappedLandmark = ""
    var tappedImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkNames = [["name" : "Mauro Icardi", "image" : UIImage(named: "icardi")!], ["name" : "Wilfried Zaha", "image" : UIImage(named: "zaha")!], ["name" : "Hakim Ziyech", "image" : UIImage(named: "ziyech")!], ["name" : "Dries Mertens", "image" : UIImage(named: "mertens")!], ["name" : "Barış Alper Yılmaz", "image" : UIImage(named: "bay")!]]
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]["name"]! as? String
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tappedLandmark = (landmarkNames[indexPath.row]["name"] as? String)!
        tappedImage = (landmarkNames[indexPath.row]["image"] as? UIImage)!
        performSegue(withIdentifier: "toDetailsViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsViewController" {
            let destinationViewController = segue.destination as! DetailsViewController
            destinationViewController.selectedLandmarkName = tappedLandmark
            destinationViewController.selectedLandmarkImage = tappedImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
}

