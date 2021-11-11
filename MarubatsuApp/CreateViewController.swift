//
//  CreateViewController.swift
//  MarubatsuApp
//
//  Created by YUKI YOUDA on 2021/11/08.
//

import UIKit

class CreateViewController: UIViewController {
    
    @IBOutlet weak var addQuestion: UITextField!
    var questions: [[String: Any]] = []
    
    @IBOutlet weak var selectAnswer: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "add") != nil{
            questions = userDefaults.object(forKey: "add") as! [[String: Any]]
        }
    }
    
    @IBAction func backToTop(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
        if addQuestion.text != "" {
            let userDefaults = UserDefaults.standard
            
            var answer = true
            if selectAnswer.selectedSegmentIndex == 0 {
                answer = false
            } else {
                answer = true
            }
            questions.append(["question" : addQuestion.text!, "answer" : answer])
            
            userDefaults.set(questions, forKey: "add")
            
            addQuestion.text = ""
            showAlert(message: "問題を保存しました")
        } else {
            showAlert(message: "問題文を入力してください")
        }
    }
    
    @IBAction func allCrear(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.set([], forKey: "add")
        showAlert(message: "問題をすべて削除しました。")
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
}
