//
//  HomeViewController.swift
//  ChAPPICON
//
//  Created by 吴丽娟 on 2020/1/13.
//  Copyright © 2020 Janise. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var linkStringTextView: UITextView!
    @IBOutlet weak var linkImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    /// 转换为浙金网图标
    @IBAction func toZjmaxICON(_ sender: UIButton) {
        self.changeAppIconWithName(name: "zjmax")
    }
    /// 转换为爱幼米图标
    @IBAction func toAiyomiICON(_ sender: UIButton) {
        self.changeAppIconWithName(name: "aiyomi")
    }
    /// 转换为交易所图标
    @IBAction func toBitNewICON(_ sender: UIButton) {
        self.changeAppIconWithName(name: "bitNew")
    }
    @IBAction func toLinkICON(_ sender: UIButton) {
        if let linkStr = self.linkStringTextView.text,linkStr.count > 0 {
            if let linkURL = URL(string: linkStr) {
                do {
                    let data =  try Data(contentsOf: linkURL)
                    if let image = UIImage(data: data) {
                        self.linkImageView.image = image
                        // 查找制定文件中是否存在该图片，如存在，直接设置为app图标
                        
                        // 如不存在，下载图片至指定文件，并将之设置名称
                    }
                }catch {
                    
                }
            }
        }
    }
    /// 保存图片至本地
    func saveImageToAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, <#T##completionSelector: Selector?##Selector?#>, <#T##contextInfo: UnsafeMutableRawPointer?##UnsafeMutableRawPointer?#>)
    }
    /// 更换图标最终方法
    func changeAppIconWithName(name: String) {
        if !UIApplication.shared.supportsAlternateIcons {
           return
        }
        var iconName: String?
        iconName = name
        if name == "" {
            iconName = nil
        }
        UIApplication.shared.setAlternateIconName(iconName) { (error) in
            if (error != nil) {
                print("更换app图标发生错误")
                print(error)
            }
        }
    }
}
