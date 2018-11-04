import UIKit

class TableViewController: UITableViewController, UITextFieldDelegate{
    
    //Button Action to add information from textField
    @IBAction func addItemButtonPressed(_ sender: UIBarButtonItem) {
        
        guard
        let input: String = textField.text
            else {
               return
        }
        if input != "" {
            itemList.append(Item(fromInput: input))
            tableView.reloadData()
        }
    }
    
    //Input for new Item Cell
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        tableView.reloadData()
        
        
        //attempt to grab data from storage and append to current array
        guard
            let dataFromStorage = UserDefaults.standard.object(forKey: "itemList") as? Data
        else {
            return
        }
        let decoder = JSONDecoder()
        let tempArray = try! decoder.decode([Item].self, from: dataFromStorage)
        itemList = itemList + tempArray
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //attempt to encode data and put into storage
        let encoder = JSONEncoder()
        let encoded = try! encoder.encode(itemList)
        UserDefaults.standard.set(encoded, forKey: "itemList")
    }
    
    
    //struct containing information
    var itemList: [Item] = []
    
    
    //total cells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    //cell text
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexItem = itemList[indexPath.row]
        let item = indexItem.getdescription()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell")!
        cell.textLabel?.text = item
        return cell
    }
    
    //cell size
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(75)
    }
    
    //selecting cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemList[indexPath.row].getdescription())
        performSegue(withIdentifier: "itemTransition", sender: nil)
    }
    
    //segue for displaying cell information
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "itemTransition"{
            if let destination1 = segue.destination as? DisplayItemViewController{
                let temp: Int = tableView.indexPathForSelectedRow!.row
                destination1.textDescription = itemList[temp].getdescription()
                destination1.row = temp
            }
        }
    }
    
    //used for the edit function in Display Options
    @IBAction func unwindToOne(_ sender: UIStoryboardSegue){}
    
    //testing material
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //delete cell, also default action if swipe is fully completed
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            print("Delete button tapped")
            //delete item
            self.itemList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        delete.backgroundColor = .red
        
        
        //When selected on Options when swiped, when completed items is loaded it will display this cells information
        let done = UITableViewRowAction(style: .normal, title: "Done") { action, index in
            print("Done button tapped")
            
            //refereces TabBarController and gives it the string of the cell before deleting
            let tabbar = self.tabBarController as! BaseTabBarController
            let sendableText = self.itemList[indexPath.row].description
            self.itemList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            tabbar.textToPass.append(sendableText)
            
        }
        done.backgroundColor = .green
        
        return [delete, done]
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
