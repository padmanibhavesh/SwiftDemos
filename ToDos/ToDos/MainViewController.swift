//
//  MainViewController.swift
//  ToDos
//
//  Created by Apple on 24/07/15.
//  Copyright (c) 2015 idroid. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var btnAdd: UIBarButtonItem?
    var btnEdit: UIBarButtonItem?
    
    @IBOutlet var tableView: UITableView!
    
    var itemsArr = [NSManagedObject]()
    var selectedObject:NSManagedObject?
    
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
        
        //registering UITableViewDataSource protocol
        tableView.dataSource = self
        
         //registering UITableViewDelegate protocol
        tableView.delegate = self
        //registering custom tableview cell nib
        
        tableView.registerNib(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        tableView.rowHeight = 150.0
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let fetchRequest = NSFetchRequest(entityName:"Items")
        
        //3
        var error: NSError?
        
        let fetchedResults =
        managedContext.executeFetchRequest(fetchRequest,
            error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults {
            itemsArr = results
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        tableView.reloadData()
        println(itemsArr)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let customCell = tableView.dequeueReusableCellWithIdentifier("Cell",forIndexPath:indexPath) as TableViewCell
        let item = itemsArr[indexPath.row]
        
        customCell.itemTitle.text = item.valueForKey("name") as? String
        customCell.itemDescription.text = item.valueForKey("desc") as? String
        customCell.location.text = item.valueForKey("location") as? String
        
        var date = NSDate()
        date = item.valueForKey("date") as NSDate
        var stringDate = self.convertDateToString(date)
        customCell.currentDate.text = stringDate
        
        return customCell
    
    }

    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete{
            
            let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
            let context: NSManagedObjectContext = appDelegate.managedObjectContext!
            context.deleteObject(itemsArr[indexPath.row] as NSManagedObject)
            itemsArr.removeAtIndex(indexPath.row)
            context.save(nil)
            tableView.reloadData()
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
        self.selectedObject = itemsArr[indexPath.row]
    
        
    }

    
    //(User define function)
    func convertDateToString(date:NSDate) -> String{
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        var stringDate = dateFormatter.stringFromDate(date)
        return stringDate
    }
    
    //(User define function):GOTO AddViewController
    func add(){
        let addViewController = AddViewController(nibName:"AddViewController",bundle:nil)
        self.navigationController?.pushViewController(addViewController, animated: true)
        
    }
    //(User define function):GOTO EditViewController
    func edit(){
        
        let editViewController = EditViewController(nibName:"EditViewController",bundle:nil)
        editViewController.selectedObj = selectedObject
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
