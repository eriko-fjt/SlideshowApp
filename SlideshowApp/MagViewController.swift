//
//  MagViewController.swift
//  SlideshowApp
//
//  Created by 藤田恵梨子 on 2020/07/10.
//  Copyright © 2020 eriko.fujita. All rights reserved.
//

import UIKit

class MagViewController: UIViewController {
    
    @IBOutlet weak var magImageView: UIImageView!
    
    
    @IBOutlet weak var returnButton: UIButton!
    

    var magImage : UIImageView! = nil
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //背景色
        self.view.backgroundColor = UIColor.black
        
        self.returnButton.layer.cornerRadius = 10
        
        
        //segueで送られてきた画像を表示する
        magImageView.image = magImage.image
        
        
        
        

        // Do any additional setup after loading the view.
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
