//
//  RegisterViewController.swift
//  FirebaseUsers
//
//  Created by Germán Santos Jaimes on 10/03/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwdTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func registerUser(_ sender: UIButton){
        guard let email = emailTF.text, let passwd = passwdTF.text else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: passwd) { (result, error) in
            if let error = error {
                self.showMessage(title: "Error", message: "Error al crear al usuario \(error.localizedDescription)")
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func cancel(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK:- Auxiliar functions
    func showMessage(title: String, message: String){
        
        var alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        var okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertVC.addAction(okAction)
        
        present(alertVC, animated: true, completion: nil)
    }

}
