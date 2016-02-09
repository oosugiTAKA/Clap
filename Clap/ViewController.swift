//
//  ViewController.swift
//  Clap
//
//  Created by takafumi oosugi on 2016/02/09.
//  Copyright © 2016年 myname. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet var clapPickerView:UIPickerView!
    //音を出すための変数(ハコ)
    var audioPlayer:AVAudioPlayer!
    var soundCount:Int=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //再生する音源のURLを生成
        let soundFilePath=NSBundle.mainBundle().pathForResource("clap",ofType:"wav")
        let fileURL=NSURL(fileURLWithPath:soundFilePath!)
        
        //AVAudioPlayerのインスタンス化
        do{
            audioPlayer=try AVAudioPlayer(contentsOfURL:fileURL)
        }catch{
            print("音楽ファイルが読み込めませんでした。")
        }
        
        clapPickerView.delegate=self
        clapPickerView.dataSource=self
        }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //カテゴリー数
    func numberOfComponentsInPickerView(pickerView:UIPickerView)->Int{
        return 1
    }
    //選択肢の数
    func pickerView(pickerView:UIPickerView,numberOfRowsInComponent component:Int)->Int{
        return 10
    }
    //何を選択肢に表示するか
    func pickerView(pickerView:UIPickerView,titleForRow row:Int,forComponent component:Int)->String!{
        return"\(row+1)回"
    }
    func pickerView(pickerView:UIPickerView,didSelectRow row:Int,inComponent component:Int){
        soundCount=row
    }
    
    @IBAction func playButton(){
        audioPlayer.numberOfLoops=soundCount
        audioPlayer.play()
}

}
