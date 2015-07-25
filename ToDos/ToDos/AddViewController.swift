//
//  AddViewController.swift
//  ToDos
//
//  Created by Apple on 24/07/15.
//  Copyright (c) 2015 idroid. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet var itemTitle: UITextField?
    @IBOutlet var itemDescription: UITextField?
    @IBOutlet var location: UITextField?
    @IBOutlet var currentDate: UIDatePicker?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Add Item"
        self.navigationController?.navigationBarHidden = true
        

       //currentDate?.addTarget(self, action: "changedDate:", forControlEvents: .ValueChanged)
        
    }
    
//    func changedDate(datePaker: UIDatePicker){
//        println(datePaker.date)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveData(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Items", inManagedObjectContext: managedContext)
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        

            item.setValue(itemTitle?.text, forKey: "name")
            item.setValue(itemDescription?.text, forKey: "desc")
            item.setValue(location?.text, forKey: "location")
            item.setValue(currentDate?.date, forKey: "date")
       
            var error:NSError?
            if !managedContext.save(&error){
                println("data not saved")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
      
      
        
    }
    
    //this method is used for hiding keyboard
    func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
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
