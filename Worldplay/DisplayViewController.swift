//
//  DisplayViewController.swift
//  Worldplay
//
//  Created by Connor Reed on 10/20/21.
//

import UIKit

class DisplayViewController: UIViewController {
    
    var place = ""
    var noun:String?
    var adjective:String?
    var verb:String?
    @IBOutlet weak var resultDisplayLabel: UILabel!
    @IBOutlet weak var checkWordInput: UITextField!
    @IBOutlet weak var replaceWordInput: UITextField!
    @IBOutlet weak var containsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if noun == nil{
            self.resultDisplayLabel.text = "My uncle wants to go to \(self.place)"
        } else {
            self.resultDisplayLabel.text = "A \(self.adjective ?? "") \(self.noun ?? "") is going to \(self.verb ?? "")"
        }
        
        // Do any additional setup after loading the view.
    }
    @IBAction func checkWordSubmit(_ sender: Any) {
        let word = self.checkWordInput.text ?? ""
        let text = self.resultDisplayLabel.text ?? ""
        var alertController = UIAlertController(title: "Find Word", message: "To be replaced", preferredStyle: .alert)
        if text.contains(word){
            self.containsLabel.text = "The above sentence does contain \(word)"
            alertController.message = "🙂"
            
        } else {
            self.containsLabel.text = "The above sentence does not contain \(word)"
            alertController.message = "🙁"
        }
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertController, animated: true)
    }
    @IBAction func replaceWord(_ sender: Any) {
        var wordToReplace = self.checkWordInput.text ?? ""
        var wordToReplaceWith = self.replaceWordInput.text ?? ""
        var replacementText = self.resultDisplayLabel.text ?? ""
        replacementText = replacementText.replacingOccurrences(of:  wordToReplace, with:  wordToReplaceWith)
        if wordToReplaceWith != ""{
            self.resultDisplayLabel.text? = replacementText
        } else {
            var alert = UIAlertController(title: "No Word", message: "No word was entered to replace with", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
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
