//
//  SecondViewController.swift
//  GCD
//
//  Created by Денис Ільницький on 31/08/2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var  imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var imageURL: URL?
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchImage()
        
    }
    
    private func fetchImage() {
        imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
        self.image = UIImage(data: imageData)
           
        }
}
    


