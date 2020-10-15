//
//  ViewController.swift
//  TextFieldValidation
//
//  Created by Pratik Zora on 2020-10-14.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var labelValidationMsg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    //MARK:- loginUser
    @IBAction func loginbutton(_ sender: Any) {
        labelValidationMsg.isHidden = true
        //Check that user entered email or not
        guard let email = txtEmail.text, txtEmail.text?.count != 0
        else {
            labelValidationMsg.isHidden = false
            labelValidationMsg.text = "Please enter your email"
            return
        }
        
        if isValidEmail(emailID: email) == false {
            labelValidationMsg.isHidden = false
            labelValidationMsg.text = "Please enter valid email address"
        }
        
        //Check that user entered password or not
        guard let password = txtPassword.text, txtPassword.text?.count != 0
        else {
            labelValidationMsg.isHidden = false
            labelValidationMsg.text = "Please enter your password"
            return
        }
    }
    
    func isValidEmail(emailID:String) -> Bool {
       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
       let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
       return emailTest.evaluate(with: emailID)
   }
    
}

