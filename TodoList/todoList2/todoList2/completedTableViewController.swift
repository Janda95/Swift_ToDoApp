import UIKit

class completedTodoViewController: UITableViewController{
    
    //when view loads checks for any completed items to load into the completed item list
    override func viewDidLoad() {
        tableView.reloadData()
        
        //attempt to grab data from storage and append to current array
        guard
            let dataFromStorage = UserDefaults.standard.object(forKey: "completeditemList") as? Data
            else {
                return
        }
        let decoder = JSONDecoder()
        let tempArray = try! decoder.decode([Item].self, from: dataFromStorage)
        completeditemList = completeditemList + tempArray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tabbar = tabBarController as! BaseTabBarController
        //for ever item add all to this array
        for item in tabbar.textToPass {
            completeditemList.append(Item(fromInput: item))
            print("item passed successfully")
        }
        tabbar.textToPass.removeAll()
        tableView.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //attempt to encode data and put into storage
        let encoder = JSONEncoder()
        let encoded = try! encoder.encode(completeditemList)
        UserDefaults.standard.set(encoded, forKey: "completeditemList")
    }
    
    //struct containing information
    var completeditemList: [Item] = []
    
    //total number of cells
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
    
    //segue for displaying the information in own view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? completedItemViewController{
            //destination.ItemDescription =
            let temp: Int = tableView.indexPathForSelectedRow!.row
            destination.completedTextDescription = completeditemList[temp].getdescription()
        }
    }
    
    //for deleting cells using a swipe on the cell
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            self.completeditemList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
}
