//
//  AddViewController.swift
//  ToDos
//
//  Created by Apple on 24/07/15.
//  Copyright (c) 2015 idroid. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    
    @IBOutlet var itemTitle: UITextField?
    @IBOutlet var itemDescription: UITextField?
    @IBOutlet var currentDate: UITextField?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Add Item"
       self.navigationController?.navigationBarHidden = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveData(){
        
       self.navigationController?.popViewControllerAnimated(true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
