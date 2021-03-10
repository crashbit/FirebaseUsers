//
//  ViewController.swift
//  FirebaseUsers
//
//  Created by Germán Santos Jaimes on 10/03/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwdTF: UITextField!
        
    var userInSession: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        validateSession()
    }
    
    @IBAction func signInBtn(_ sender: UIButton){
        guard let email = emailTF.text , let passwd = passwdTF.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: passwd) { (result, error) in
            if let error = error {
                self.showMessage(title: "Error", message: "Error al autenticar al usuario \(error.localizedDescription)")
            }else{
                self.performSegue(withIdentifier: "welcomeSegue", sender: nil)
            }
        }
    }
    
    @IBAction func cancelBtn(_sender: UIButton){
        emailTF.text = ""
        passwdTF.text = ""
    }
    
    // MARK:- Auxiliar functions
    func showMessage(title: String, message: String){
        
        var alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        var okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertVC.addAction(okAction)
        
        present(alertVC, animated: true, completion: nil)
    }
    
    func validateSession(){
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil{
                print("usuario no loggeado")
                return
            }else{
                print("usuario loggeado")
                self.performSegue(withIdentifier: "welcomeSegue", sender: self)
            }
        }
    }
}


