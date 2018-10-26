import UIKit

class TableViewController: UITableViewController, UITextFieldDelegate {
    
    
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
    
    @IBOutlet weak var textField: UITextField!
    
    //struct containing information
    var itemList: [Item] = [Item(fromInput: "1"), Item(fromInput: "2")]
    
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
        return CGFloat(100)
    }
    
    //selecting cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemList[indexPath.row].getdescription())
        
        performSegue(withIdentifier: "itemTransition", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DisplayItemViewController{
            //destination.ItemDescription =
            let temp: Int = tableView.indexPathForSelectedRow!.row
            destination.textDescription = itemList[temp].getdescription()
        }
    }
    
    
}
