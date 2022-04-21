import UIKit



//Switch

let numero = 5

switch numero{

case 1...3:

    print("Entre 1 y 3")

default:

    print("otro numero")

}

//Early exit (return)

enum PersonError: Error {

    case personNotFound

    case locationNotFound

    

    var description: String {

        switch self {

        case .personNotFound:

            return "No existe el valor"

        case .locationNotFound:

            return "No existe la localizacion"

        }

    }

}





let person: [String: String] = ["name":"Alumno",

                                "surname": "Apellido"]

func greet(person: [String: String]) throws {

    guard let name = person["name"], let age = person["age"] else {

        throw PersonError.personNotFound

    }

    

    print("Name = \(name), Age = \(age)")

    

    guard let location = person ["location"] else {

        throw PersonError.locationNotFound

    }

    

    print("Te encuentras en \(location)")

    

    do {

        try greet(person: person)

    } catch PersonError.personNotFound {

        print(PersonError.personNotFound.description)

    } catch PersonError.locationNotFound {

        print(PersonError.locationNotFound.description)

    }

    

    //Funciones

    //Funcion lambda

    func suma(_ x: Int, _ y: Int) -> Int { x + y }

    suma(2, 3)

    

    func resta(firstNumber: Int, secondNumber: Int) {

        firstNumber - secondNumber

    }

    resta(firstNumber: 3, secondNumber: 2)

}



//Closures sirve para capturar valores y manejar datos entre capas dentro de la aplicacion

let names = ["Chris", "Alex", "Eva", "Barry", "Daniela"]

let reversedNames = names.sorted() { name1, name2 in

    name1 > name2

}

print(reversedNames)



// esto hace lo mismo que el reversedNames de arriba

let normalNames = reversedNames.sorted(by: <)

print(normalNames)



//Enumeraciones enum

enum CompassPoint {

    case north

    case south

    case east

    case west

}



enum Planetas {

    case mercurio

    case venus

    case tierra

    case marte

    case jupiter

    case saturno

    case urano

    case neptuno

}



let direccionToHead: CompassPoint = .south

switch direccionToHead {

case .east:

    print("East side")

case .west:

    print("West side")

default:

    print("Ninguno")

}



//enum Asociated Value

enum BarCode {

    case upc(Int, Int, Int, Int)

    case qrCode(String)

}



let productBarCode = BarCode.upc(8, 85909, 51226, 3)

let producQrCode = BarCode.qrCode("asdfghhjkl")



switch productBarCode {

case let .upc(numberSystem, manufacture, produc, check):

    print("UPC: \(numberSystem), \(manufacture), \(produc), \(check)")

case let .qrCode(productCode):

    print("QR Code: \(productCode)")

}



//Declare properties into enum

enum Animal: String {

    case dog = "Perro"

    case cat = "Gato"

    case bird = "Pájaro"

    case cow = "Vaca"

    

    var color: UIColor {

        switch self {

        case .dog:

            return UIColor.red

        case .cat:

            return UIColor.blue

        case .bird:

            return UIColor.yellow

        case .cow:

            return UIColor.brown

        }

    }

}



print(Animal.cat.color)

print(Animal.dog.rawValue)



let animal = Animal(rawValue: "Perro")



print("El animal es \(animal ?? Animal.cow)")



//Optional Binding

if let animalUnwrapped = animal {

    print("El \(animalUnwrapped.rawValue) es \(animalUnwrapped.color.description)")

} else {

    print("No existe el animal")

}



func animalUnwrapper (_ animal: Animal?) {

    guard let animalForceUnwrapped =

        animal else {

            return

        }

    

    print("Animal Early Exit \(animalForceUnwrapped.rawValue)")

}



animalUnwrapper(animal)





//Estructuras y clases



class Concesionario {

    var name: String

    var localization: String

    

    init(name: String, localization: String) {

        self.name = name

        self.localization = localization

    }

    

    struct Coche {

        var model: String

        var color: UIColor

        

        struct Motor {

            var type: String

            var cv: String

            

            class Bike {

                var gears: Int

                

                init(gears: Int) {

                    self.gears = gears

                }

            }

        }

    }

}



let concesionario = Concesionario(name: "Mercedes", localization: "Valladolid")

let concesionario2 = Concesionario(name: "BMW", localization: "Valladolid")



if(concesionario === concesionario2) {

    

}



if concesionario is Concesionario {

    

}



//Structure in memory

struct Resolution {

    var width = 0

    var height = 0

}



class VideMode {

    var resuolution = Resolution()

    var interlaced = false

    var frameRate = 0.0

    var name: String?

}



let hd = Resolution(width: 1920, height: 1080)

var cinema = hd



cinema.width = 2048

print("Cinema is now \(cinema.width) pixels")

print("hd is still \(hd.width) pixels")



//Extensiones

extension VideMode {

    func getVideoName() -> String {name ?? "Default Name"}

}



extension Double {

    var km: Double {

        return self * 1000

    }

    var m: Double {

        return self

    }

    var cm: Double {

        return self / 100

    }

    var mm: Double {

        return self * 10000

    }

    var ft: Double {

        return self / 3.28084

    }

}



let velocityInKm: Double = 20.km



//Protocol

protocol FullyName {

    var fullName: String { get }

    var birthday: String { get }

    var age: Int { get }

    func getPersonData() -> String

}



struct Person: FullyName {

    var birthday: String

    

    var age: Int

    

    func getPersonData() -> String {

        "The fully name is \(fullName), the age is \(age), the birthday is \(birthday)"

    }

    

    var fullName:String

}



let examplePerson = Person(birthday: "20/10/2002", age: 19, fullName: "Marcos Navarro")

print(examplePerson)