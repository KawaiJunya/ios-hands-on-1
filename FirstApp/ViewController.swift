//
//  ViewController.swift
//  FirstApp
//
//  Created by junya.kawai on 2020/01/09.
//  Copyright © 2020 nextbeat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //プロパティアクセス用
    @IBOutlet weak var hello: UILabel!
    @IBOutlet weak var button1: UIButton!
    
    let userDefaults = UserDefaults.standard
    
    //ViewのLoad後に呼ばれる処理
    override func viewDidLoad() {
        super.viewDidLoad()
        // Observer: 名前通知変更
        NotificationCenter.default.addObserver(self, selector: #selector(onChangeName(_:)), name: .changeName, object: nil)
        loadName()
    }
    
    
    @objc func onChangeName(_ notification: Notification){
        loadName()
    }
    
    // 名前をUserDefaultsから取得し、取得できた場合は表示を更新する
    func loadName(){
        let nameOpt = userDefaults.object(forKey: "NAME") as? String
        if let name = nameOpt {
            hello.text = "Hello \(name)"
        }
    }
}

