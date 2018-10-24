import UIKit

//import class for table view

class TodoTableViewController: UITableViewController {
    
    //var todoArray: [Activities/Items] =
    var tempPlaceholder: [String] = ["Item 1", "Item 2"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return todoArray.count
        return tempPlaceholder.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let
        let indexRow = tempPlaceholder[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell")!
        cell.textLabel?.text = indexRow
        
        return cell
    }
    
    
    
}

