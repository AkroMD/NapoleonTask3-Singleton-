import Foundation

class Contact: NSObject, NSCoding{
    
    enum Keys: String {
        case name = "Name"
        case lastName = "LastName"
        case tel = "Tel"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: Keys.name.rawValue)
        coder.encode(lastname, forKey: Keys.lastName.rawValue)
        coder.encode(tel, forKey: Keys.tel.rawValue)
    }
    
    required convenience init?(coder: NSCoder) {
        let name = coder.decodeObject(forKey: Keys.name.rawValue) as! String
        let lastname = coder.decodeObject(forKey: Keys.lastName.rawValue) as! String
        let tel = coder.decodeObject(forKey: Keys.tel.rawValue) as! String
        self.init(name: name,lastname: lastname,tel: tel)
    }
    
    func save(){
        
    }
    
    func load(){

    }
    
    var name,lastname,tel: String?
    
    init(name: String?, lastname: String?, tel: String?){
        self.name = name
        self.lastname = lastname
        self.tel = tel
    }
   
}

class Contacts{
    
    private static var contacts = [Contact]()
    private static let key = "mycontact"
    static var kind = 0;
    
    private init(){}
    
    static func save(){
        let data = try! NSKeyedArchiver.archivedData(withRootObject: contacts, requiringSecureCoding: false)
        UserDefaults.standard.set(data, forKey: key)
        
    }
    static func load(){
        guard let data = UserDefaults.standard.data(forKey: key) else {return}
        guard let codeddata = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)   else {return}
        contacts = codeddata as! [Contact]
    }
    static func Add(contact: Contact){
        contacts.append(contact)
    }
    static func Change(index: Int, contact: Contact){
        contacts[index] = contact
    }
    static func Delete(index: Int){
        contacts.remove(at: index)
    }
    static func Lenght() -> Int {
        contacts.count
    }
    static func getContact(index: Int) -> Contact {
        contacts[index]
    }
  
}

