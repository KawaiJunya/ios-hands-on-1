//
//  SecondViewController.swift
//  FirstApp
//
//  Created by junya.kawai on 2020/01/09.
//  Copyright © 2020 nextbeat. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldAge:  UITextField!
    
    let userDefaults = UserDefaults.standard
    let notificationCenter = NotificationCenter.default

    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldName.delegate = self
        textFieldAge.delegate  = self
        
        textFieldName.text = userDefaults.object(forKey: "NAME") as? String ?? "name"
        textFieldAge.text  = userDefaults.object(forKey: "AGE" ) as? String ?? "age"
    }
    
    // リターンキー: キーボード閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //textFieldName.resignFirstResponder()
        //textFieldAge.resignFirstResponder()
        self.view.endEditing(true)
        return true
    }
    
    // 画面タッチ: キーボード閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        if textFieldName.text != "" && textFieldAge.text != "" {
            userDefaults.set(textFieldName!.text, forKey: "NAME")
            userDefaults.set(textFieldAge!.text,  forKey: "AGE" )
            userDefaults.synchronize()
            showDialog(title: "完了", message: "名前と年齢を保存しました")
            
            
            notificationCenter.post(name: .changeName, object: nil)
        } else {
            showDialog(title: "警告", message: "名前と年齢を入力してください")
        }
    }
    
    func showDialog(title: String, message: String){
        let dialog = UIAlertController(title: title, message: message, preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(dialog, animated: true, completion: nil)
    }
}
