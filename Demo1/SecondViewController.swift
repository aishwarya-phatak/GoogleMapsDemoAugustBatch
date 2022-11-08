//
//  SecondViewController.swift
//  Demo1
//
//  Created by Vishal Jagtap on 30/09/22.
//


import UIKit
import SDWebImage

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Started..")
        
        let urlString = "https://via.placeholder.com/600/24f355"
        let extractedURL = NSURL(string: urlString) as? URL
       
        imageView1.sd_setImage(with: extractedURL)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
