//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by イイダカオリ on 2021/07/10.
//

import UIKit

class NextViewController: UIViewController {

    var selectImg:UIImage!
    @IBOutlet weak var nextImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        nextImageView.image = selectImg
        nextImageView.contentMode = UIView.ContentMode.scaleAspectFill
    }
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
