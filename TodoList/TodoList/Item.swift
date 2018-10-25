import Foundation

struct Item {
    
    var description: String = "temp"
    
    init(fromInput description: String){
        self.description = description
    }
    
    func getdescription() -> String{
        return description
    }
    
    
}
