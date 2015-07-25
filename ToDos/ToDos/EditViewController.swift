//
//  EditViewController.swift
//  ToDos
//
//  Created by Apple on 24/07/15.
//  Copyright (c) 2015 idroid. All rights reserved.
//

import UIKit
import CoreData


class EditViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var texItemTitle: UITextField?
    @IBOutlet var textItemDescription: UITextField?
    @IBOutlet var textLocation: UITextField?
    @IBOutlet var uiDatePicker: UIDatePicker?
    
    
    var itemTitle: String?
    var itemDescription: String?
    var itemLocation: String?
    var itemDate: NSDate?
    
    var selectedObj: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Edit Item"
        self.navigationController?.navigationBarHidden = true
        
        
        println(selectedObj)
        
        itemTitle = selectedObj?.valueForKey("name") as? String
        itemDescription = selectedObj?.valueForKey("desc") as? String
        itemLocation = selectedObj?.valueForKey("location") as? String
        itemDate = selectedObj?.valueForKey("date") as? NSDate
        
        self.texItemTitle?.text = itemTitle!
        self.textItemDescription?.text = itemDescription!
        self.textLocation?.text = itemLocation!
        self.uiDatePicker?.date = itemDate!
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editData(){
        
        
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        var fetchRequest = NSFetchRequest(entityName: "Items")
        
        fetchRequest.predicate = NSPredicate(format: "name = %@ AND desc = %@ AND location = %@ AND date = %@" , argumentArray: [itemTitle!,itemDescription!,itemLocation!, itemDate!])
        
        if let fetchResults = appDel.managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [NSManagedObject] {
            if fetchResults.count != 0{
                
                var managedObject = fetchResults[0]
                managedObject.setValue(texItemTitle?.text, forKey: "name")
                managedObject.setValue(textItemDescription?.text, forKey: "desc")
                managedObject.setValue(textLocation?.text, forKey: "location")
                managedObject.setValue(uiDatePicker?.date, forKey: "date")
                
                context.save(nil)
            }
        }
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
  //  func saveLoginData(title: String, desc: String,location: String, date:NSDate) {
        
        
//        //Customizable! (for me was just important if at least one)
//        request.fetchLimit = 1
//        
//        
//        //IF IS EQUAL
//        
//        //1 OBJECT
//        request.predicate = NSPredicate(format: "name = %@", txtFieldName.text)
//        
//        //ARRAY
//        request.predicate = NSPredicate(format: "name = %@ AND nickName = %@", argumentArray: [name, nickname])
//        
//        
//        // IF CONTAINS
//        
//        //1 OBJECT
//        request.predicate = NSPredicate(format: "name contains[c] %@", txtFieldName.text)
//        
//        //ARRAY
//        request.predicate = NSPredicate(format: "name contains[c] %@ AND nickName contains[c]
        
     //       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
