//
//  TweetViewController.swift
//  Twitter
//
//  Created by Brian Ozawa Burns on 4/27/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var charCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.delegate = self
        
        tweetTextView.becomeFirstResponder()
        profileView.layer.cornerRadius = profileView.frame.height / 2
        
        tweetTextView.layer.cornerRadius = 16
        tweetTextView.layer.borderWidth = 1
        if #available(iOS 13.0, *) {
            tweetTextView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        } else {
            
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if (!tweetTextView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    /*
    var profileArray = [NSDictionary]()
    
    let myUrl = "https://api.twitter.com/1.1/account/settings.json"
    let name = "Brian Ozawa Burns"
    
    TwitterAPICaller.client?.getDictionaryRequest(url: myUrl, parameters: ["Name": name], success: { (profile: [NSDictionary]) in
        
        self.profileArray.removeAll()
        for data in profile {
            self.profileArray.append(data)
            
        }
        
    }, failure: { (Error) in
        print("Could not retrieve profile data.")
    })
    
    let imageUrl = URL(string: (user["profile_image_url_https"] as? String)!)
    let data = try? Data(contentsOf: imageUrl!)
    
    if let imageData = data {
        cell.profileView.image = UIImage(data: imageData)
    }
    */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func textViewDidChange(_ textView: UITextView) {
        
        charCount.text = "\(textView.text.count)"
        
        /*
        if (textView == tweetTextView) {
            let strLength = textView.text?.count ?? 0
            let lengthToAdd = string.count
            let lengthCount = strLength + lengthToAdd
            self.charCount.text = "\(lengthCount)"
        }
        return true
        */
        
    }

}
