//
//  MemoViewController.swift
//  MyMemoApp
//
//  Created by Junichi Tomida on 2020/08/11.
//  Copyright © 2020 infoprax. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {
    
    var memo: String?
    
    @IBOutlet weak var memoTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.saveButton.isEnabled = false
        if let memo = self.memo{
            self.memoTextField.text = memo
            self.navigationItem.title = "Edit Memo"
        }
        self.updateSaveButtonState()
    }
    
    private func updateSaveButtonState(){
        let memo = self.memoTextField.text ?? ""
        self.saveButton.isEnabled = !memo.isEmpty
    }
    
    @IBAction func memoTextFieldChanged(_ sender: Any){
        self.updateSaveButtonState()
    }
    
    @IBAction func cancel(_ sender: Any){
        if self.presentingViewController is UIViewController{
            self.dismiss(animated: true, completion: nil)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue,sender:   Any?){
        guard let button=sender as? UIBarButtonItem,button===self.saveButton else {
            return
        }
        self.memo=self.memoTextField.text ?? ""
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
