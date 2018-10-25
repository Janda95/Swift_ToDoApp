import UIKit

//import class for table view

class TodoTableViewController: UITableViewController {
    
    var myItemsArray: [Item] = [Item(fromInput: "Hello World")]
    //var tempPlaceholder: [String] = ["Item 1", "Item 2"]
    
    /*func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        myItemsArray.append(Item(fromInput: newItem.text!))
        newItem.resignFirstResponder()
        return true
    }*/
    
    //Table View Interactions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myItemsArray.count
        //return tempPlaceholder.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexItem = myItemsArray[indexPath.row]
        let indexRow = indexItem.getdescription()
        //let indexRow = tempPlaceholder[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell")!
        cell.textLabel?.text = indexRow
        
        return cell
    }
    
    /*override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }*/
}

