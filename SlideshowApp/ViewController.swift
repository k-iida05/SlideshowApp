//
//  ViewController.swift
//  SlideshowApp
//
//  Created by イイダカオリ on 2021/07/09.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var nowIndex:Int = 0
    
    var timer:Timer!
    var imageArray:[UIImage] = [
        UIImage(named: "1.png")!,
        UIImage(named: "2.png")!,
        UIImage(named: "3.png")!,
        UIImage(named: "4.png")!,
        UIImage(named: "5.png")!
    ]
    let buttonImage = UIImage(named: "再生.png")
    let buttonImage2 = UIImage(named: "停止.png")
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func start(_ sender: Any) {
        if (timer == nil){
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            startButton.setImage(buttonImage2, for: .normal)
            backButton.isEnabled = false
            goButton.isEnabled = false
        }else{
            timer.invalidate()
            timer = nil
            startButton.setImage(buttonImage, for: .normal)
            backButton.isEnabled = true
            goButton.isEnabled = true
        }
    }
    @objc func changeImage(){
        nowIndex += 1
        if(nowIndex == imageArray.count){
            nowIndex = 0
        }
        imageView.image = imageArray[nowIndex]
    }
    @IBAction func go(_ sender: Any) {
        nowIndex += 1
        if(nowIndex == imageArray.count){
            nowIndex = 0
        }
        imageView.image = imageArray[nowIndex]
    }
    @IBAction func back(_ sender: Any) {
   
        if(nowIndex == 0){
            nowIndex = 4
        }else{
            nowIndex -= 1
        }
        imageView.image = imageArray[nowIndex]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNext"{
            let NextVC : NextViewController = segue.destination as! NextViewController
            NextVC.selectImg = imageView.image
        }
    }
    @IBAction func tap(_ sender: Any) {
        performSegue(withIdentifier: "toNext", sender: nil)
    }
    
}

