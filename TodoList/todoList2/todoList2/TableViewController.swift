import UIKit

class TableViewController: UITableViewController, UITextFieldDelegate {
    
    
    @IBAction func addItemButtonPressed(_ sender: UIBarButtonItem) {
        itemList.append(Item(fromInput: "Test"))
        tableView.reloadData()
    }
    
    
    //struct containing information
    var itemList: [Item] = [Item(fromInput: "1"), Item(fromInput: "2")]
    
    //total cells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    //cell text
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexItem = itemList[indexPath.row]
        let indexRow = indexItem.getdescription()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell")!
        cell.textLabel?.text = indexRow
        
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
        //placeholder
    }
    
    
    
}
