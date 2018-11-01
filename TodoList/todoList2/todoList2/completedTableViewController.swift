import UIKit

class completedTodoViewController: UITableViewController{
    
    
    //struct containing information
    var completeditemList: [Item] = [Item(fromInput: "3"), Item(fromInput: "4")]
    
    //total cells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completeditemList.count
    }
    
    //cell text
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexItem = completeditemList[indexPath.row]
        let item = indexItem.getdescription()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "completedListCell")!
        cell.textLabel?.text = item
        return cell
    }
    
    //cell size
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    //selecting cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(completeditemList[indexPath.row].getdescription())
        
        performSegue(withIdentifier: "completeditemTransition", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? completedItemViewController{
            //destination.ItemDescription =
            let temp: Int = tableView.indexPathForSelectedRow!.row
            destination.completedTextDescription = completeditemList[temp].getdescription()
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            self.completeditemList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}
