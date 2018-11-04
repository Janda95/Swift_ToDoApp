import Foundation

//NOTES
//Was struct, did not use required, everything else stayed the same



class Item: Codable, CustomStringConvertible {
    var description: String = "temp"
    
    enum CodingKeys: String, CodingKey{
        case description
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        description = try! values.decode(String.self, forKey: .description)
    }
    
    init(fromInput description: String){
        self.description = description
    }
    
    func getdescription() -> String{
        return description
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(description, forKey: .description)
    }
}
