//
//  MainViewController.swift
//  ToDos
//
//  Created by Apple on 24/07/15.
//  Copyright (c) 2015 idroid. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var btnAdd: UIBarButtonItem?
    var btnEdit: UIBarButtonItem?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "ToDos"
        btnAdd = UIBarButtonItem(title: "ADD", style: UIBarButtonItemStyle.Bordered, target: self, action: "add")
        btnEdit = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.Bordered, target: self, action: "edit")
        self.navigationItem.leftBarButtonItem = btnAdd
        self.navigationItem.rightBarButtonItem = btnEdit

        self.navigationController?.navigationBar.barTintColor = UIColor.brownColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //GOTO AddViewController
    func add(){
        let addViewController = AddViewController(nibName:"AddViewController",bundle:nil)
        self.navigationController?.pushViewController(addViewController, animated: true)
        
    }
    //GOTO EditViewController
    func edit(){
        
        let editViewController = EditViewController(nibName:"EditViewController",bundle:nil)
        self.navigationController?.pushViewController(editViewController, animated: true)
        
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
