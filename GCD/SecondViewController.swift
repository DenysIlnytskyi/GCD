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
        delay(3) {
            self.loginAlert()
            }
    }
    
    private func delay(_ delay: Int, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
    
    private func loginAlert() {
        let ac = UIAlertController(title: "Are you registered?", message: "Enter your login and password", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        ac.addAction(okAction)
        ac.addAction(cancelAction)
        
        ac.addTextField { (userNameTF) in
            userNameTF.placeholder = "Enter login"
        }
        ac.addTextField { (userPasswordTF) in
            userPasswordTF.placeholder = "Enter your password"
            userPasswordTF.isSecureTextEntry = true
        }
        self.present(ac, animated: true, completion: nil)
    }
    
    private func fetchImage() {
        imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
        }
           
    }
}
    


