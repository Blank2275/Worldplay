//
//  ViewController.swift
//  Worldplay
//
//  Created by Connor Reed on 10/20/21.
//

import UIKit

class ViewController: UIViewController {
    
    var place = ""
    @IBOutlet weak var placeInput: UITextField!
    @IBOutlet weak var displayButtonPressed: UIButton!
    @IBOutlet weak var nounInput: UITextField!
    @IBOutlet weak var adjectiveInput: UITextField!
    @IBOutlet weak var verbInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let svc = segue.destination as! DisplayViewController
        svc.place = self.place
        if sender == nil{
            svc.noun = self.nounInput.text ?? ""
            svc.adjective = self.adjectiveInput.text ?? ""
            svc.verb = self.verbInput.text ?? ""
        }else {
            svc.noun = nil
            svc.adjective = nil
            svc.verb = nil
        }
    }
    @IBAction func placeChanged(_ sender: Any) {
        self.place = self.placeInput.text ?? ""
    }
    @IBAction func makeSentenceClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "displaySegue", sender: nil)
    }
    

}

