//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 藤田恵梨子 on 2020/06/20.
//  Copyright © 2020 eriko.fujita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 画像表示部分。大きさは、各モバイルのサイズに合うよう、スクリーンサイズを取得した上で、計算・設定する方が良さそう。
    @IBOutlet weak var imageView: UIImageView!
    
    //　次に送るボタン　
    @IBOutlet weak var nextButton: UIButton!
    
    // 戻るボタン
    
    @IBOutlet weak var backButton: UIButton!
    
    
    // 再生・停止ボタン　表示を変えたい。初期値は、▶︎再生、
    @IBOutlet weak var playAndStopButton: UIButton!
    
    
    
    //　スライドショーの画像の名前を入れた配列
    let imageNameArray = ["cat1", "cat2", "cat3", "cat4", "cat5", "cat6"]
    
    // 表示されている画像の、配列のインデックス
    var dispImageIndex : Int = 0
    
    // 関数の中で使う？タイマー
    var timer: Timer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // デフォルトで表示する画像。後で変更するかも。定数への格納不要な気がする・・・
        let imageDefault = UIImage(named: "cat1")
        imageView.image = imageDefault
        
        // 背景色
        self.view.backgroundColor = UIColor.black
        
        // 再生ボタンの表示
        playAndStopButton.setTitle("▶︎再生", for: .normal)
        nextButton.setTitle("進む▶︎▶︎", for: .normal)
        backButton.setTitle("◀︎◀︎戻る", for: .normal)
        
        
        // タップで画面遷移のため、タップジェスチャーを設定
        //let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.toMagImage(_:)))
        //self.imageView.addGestureRecognizer(tapGesture)
        
        
        
    }
    
  
    // 画像を表示する関数　=　2秒ごとに呼び出される関数
    @objc func playSlide (_ timer: Timer) {
        
        // 画像の名前を、配列[インデックス]で取得して変数に格納
        let imgName = imageNameArray[dispImageIndex]
        
        // UIImageから、指定した画像を変数へ格納
        let dispImage = UIImage(named: imgName)
        
        //
        if dispImageIndex ==  imageNameArray.count - 1 {
            // インデックス０の画像を表示
            dispImageIndex = 0
            imageView.image = dispImage
            
        } else {
            // 画像のインデックスを+1 して表示
            dispImageIndex += 1
            imageView.image = dispImage
        }
        
    }
    
    
    // 再生・停止ボタンが押された時に呼び出される関数
    @IBAction func playAndShopSlideshow(_ sender: Any) {
        
        if self.timer != nil {
            // 停止ボタンが押された時の処理。ボタンの表示も、スライド停止後に再生ボタンの表示に変えたい
            self.timer.invalidate()
            self.timer = nil
            playAndStopButton.setTitle("再生▶︎", for: .normal)
            nextButton.isEnabled = true
            backButton.isEnabled = true
            
            
            
        } else if self.timer == nil {
            //再生ボタンが押された時の処理。本当は、ボタンの表示も、スライド再生が始まった後に、停止の表示に変えたい
            // タイマーを生成。タイマーが、自動でスライド再生関数を読んでくれる。
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(playSlide(_:)), userInfo: nil, repeats: true)
            playAndStopButton.setTitle("停止■", for: .normal)
            nextButton.isEnabled = false
            backButton.isEnabled = false

        }
        
        
    }
    
    
    // 進むボタン
    @IBAction func nextSlide(_ sender: Any) {
        // 画像の名前を、配列[インデックス]で取得して変数に格納
        let imgName = imageNameArray[dispImageIndex]
        
        // UIImageから、指定した画像を変数へ格納
        let dispImage = UIImage(named: imgName)
        
        
        if self.timer == nil && dispImageIndex == imageNameArray.count - 1{
            // タイマーが動いていない時、かつ、最後の画像を表示している時
            dispImageIndex = 0
            imageView.image = dispImage
            
        } else if self.timer == nil && dispImageIndex != imageNameArray.count - 1 {
            // タイマーが動いていない時、かつ、最後の画像以外を表示している時
            dispImageIndex += 1
            imageView.image = dispImage
        }
     
        
    }
    
    
    // 戻るボタンを押した時
    @IBAction func backSlide(_ sender: Any) {
        // インデックスを-１して、画像表示関数を呼ぶ？
        // 画像の名前を、配列[インデックス]で取得して変数に格納
            let imgName = imageNameArray[dispImageIndex]
            
            // UIImageから、指定した画像を変数へ格納
            let dispImage = UIImage(named: imgName)
            
            
            if self.timer == nil && dispImageIndex == 0 {
                // タイマーが動いていない時、かつ、最初の画像を表示している時
                dispImageIndex = imageNameArray.count - 1
                imageView.image = dispImage
                
            } else if self.timer == nil && dispImageIndex != 0 {
                // タイマーが動いていない時、かつ、最初の画像意外を表示している時
                dispImageIndex -= 1
                imageView.image = dispImage
            }
            
        }
    
    //@objc func toMagImage(_ sender: UITapGestureRecognizer){
    

   
    
    // imageViewをタップした時のアクション
    @IBAction func tapAction(_ sender: Any) {
        // タイマーを止めたいので、停止ボタンが押された時の処理をコピペ
        if self.timer != nil {
        self.timer.invalidate()
        self.timer = nil
        playAndStopButton.setTitle("再生▶︎", for: .normal)
        nextButton.isEnabled = true
        backButton.isEnabled = true
        }
        
        // segueを実行
        self.performSegue(withIdentifier: "toMag", sender: self.imageView)
        
    }
    
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toMag" {
            let magViewController : MagViewController = segue.destination as! MagViewController
            magViewController.magImage = sender as? UIImageView
        }
        
        
        
        
        
    }
    
    // 拡大画面から、戻るボタンで戻ってくるアクション
    @IBAction func unMagWind(_ segue: UIStoryboardSegue){
        
    }
    
    
    

}

