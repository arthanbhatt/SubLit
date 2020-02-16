//
//  ProfileViewController.swift
//  sublit
//
//  Created by Vivek Cherian on 2/15/20.
//  Copyright © 2020 Vivek Cherian. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        applyRoundCorner(homeButton)
        applyRoundCorner(profileImage)
        homeButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        applyRoundCorner(settingsButton)
        settingsButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        applyRoundCorner(editButton)
        editButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
//        profileImage.layer.contentsRect = CGRectMake(0.0, 0.0, 0.3, 0.3);
    }
    
    func applyRoundCorner(_ object: AnyObject)
    {
        object.layer.cornerRadius = object.frame.size.width / 2
        object.layer?.masksToBounds = true
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
