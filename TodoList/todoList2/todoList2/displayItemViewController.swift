import UIKit

class DisplayItemViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var ItemDescription: UILabel!
    
    var textDescription: String = "Error: Seque Didn't Work"
    var row: Int = -1
    
    override func viewWillAppear(_ animated: Bool) {
        ItemDescription.text = "Row: " + String(row)
        textField.text = textDescription
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! TableViewController
        destination.itemList[row].description = textField.text! //FORCED
        destination.tableView.reloadData()
    }
    
}
