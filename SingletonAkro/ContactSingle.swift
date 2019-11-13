import Foundation

//Лучше вынести в отдельный файл класс
//модель, потому что тут она лишняя
//и становится сложнее ориентироваться в коде
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
    
//    Пустые функции, которые ничего не делают?
    func save(){
        
    }
    
    func load(){

    }
    
//    После запятых надо как минимум ставить пробелы
//    Обычно для каждого свойства своя строка со своим типом
//    а не все свйоства в одной строке
    
//    И все поля не должны быть Optional,
//    потому что нам нет смысла сохранять контакт
//    в котором нет никакой информации
    var name,lastname,tel: String?
    
//    Много где забываешь пробел после функции, перед фигурной скобкой
//    Т.е. у тебя вот так:
//    init(name: String?, lastname: String?, tel: String?){
//    А надо вот так:
//    init(name: String?, lastname: String?, tel: String?) {
    init(name: String?, lastname: String?, tel: String?){
        self.name = name
        self.lastname = lastname
        self.tel = tel
    }
   
}

// Опять пробел потерялся
class Contacts{
    
    private static var contacts = [Contact]()
    private static let key = "mycontact"
    static var kind = 0;
    
    private init(){}
    
    static func save(){
        let data = try! NSKeyedArchiver.archivedData(withRootObject: contacts, requiringSecureCoding: false)
        UserDefaults.standard.set(data, forKey: key)
        
    }
    
//    Не жалей переносов строк после функций, тогда код
//    будет намного читаемее
    
//    И функции с большой буквы очень грубая ошибка)
    static func load() {
        guard let data = UserDefaults.standard.data(forKey: key) else { return }
        guard let codeDate = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) else { return }
        contacts = codeDate as! [Contact]
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

