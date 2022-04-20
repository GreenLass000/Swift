import UIKit



//Declaracion de variable explicita

var name: String = "Marcos"

var nExp: Int = 5



//Declaracion de variable implicita

var lastName = "Navarro"

var number = 10



//let para declarar constantes

let nconst = 100



//Los nombre de variables pueden ser emotes elegidos con ctrl+win+space

let 😀 = "smile"



//Imprimir todo

print(😀)



//Declarar varias variables en la misma linea

let car = "BMW", age = 2006



//print("Mi coche es un \(car) del anio \(age)")

/*

 Esto es un comentario por bloque

 */



//Imprimir variable declarada con ;

let birdthday = "24/06/1996"; print(birdthday)



//Crear variable sin inicializar

let uint8: UInt8

//print(uint8) variable no inicializada



//Casteo de variables

let three = 3

let pointOneDoubleFor = 0.234343

let result = Double(three) + pointOneDoubleFor

print("El resultado es \(result)")



//Crear un typealias

typealias AudioSample = UInt16

var amplitudeMax = AudioSample.max



print(amplitudeMax)



//Variables booleanas (Bool)

let iLikeAnimeSeries = true

let iLikeMarisco = false



//Tuples

//Pedir que me lo pase alguien que me las he perdido enteras



//Opcionales

// Deja hacer el casting dejando claro que el numero es opcional

let possibleNumber = "123" //Si se pone bdf7ssd48 el resultado es nil (null)

let convertedNumber = Int(possibleNumber)

print("My possible number \(convertedNumber)")



//Opcional explicito

var serverResponseCode: Int? //Lo podemos inicializar con = nil



serverResponseCode = 200

print("Server response code \(serverResponseCode)")



//Comprobar si es nil

if serverResponseCode != nil {

    print("Tiene valor")

}



// comprobar nil de la forma correcta

if let unWrappedValue = serverResponseCode {

    print("Tiene valor y es igual a \(unWrappedValue)")

} else {

    print("No tiene valor")

}



//Forzar imprimir variable con ! no recomendable usarlo

let optionalValue: String?

//print(optionalValue!)





//Enumeracion de errores

enum VendingMachineError: Error {

    case invalidSelection

    case insuficientCoins(coints: Int)

    case outOfStock

}



//Funciones

func canThrowError() throws -> String {

    throw VendingMachineError.outOfStock

}



// do-catch excepciones

do {

    try canThrowError()

} catch VendingMachineError.insuficientCoins(let coins) {

    print("Dinero insuficiente \(coins)")

} catch VendingMachineError.invalidSelection {

    print("Seleccion no valida")

} catch VendingMachineError.outOfStock {

    print("El producto seleccionado esta fuera de Stock")

}



//Operadores ternarios

let constantHeight = 40

let hasHeader = true

let rowHeight: Int



if hasHeader {

    rowHeight = constantHeight + 50

} else {

    rowHeight = constantHeight + 20

}

print("La celda mide \(rowHeight)px")



let constantHeightTernary = 40

let hasHeaderTernary = true

let rowHeightTernary = constantHeightTernary + (hasHeader ? 50 : 20)



//Asignar valores por defecto operador ??

let defaultColor = "red"

var selectedColor: String?



var aplicationColor = selectedColor

print("Has seleccionado el color \(aplicationColor ?? defaultColor)")



//Operadores de rango

for index in 1..<10 {

    print("El numero es \(index)")

}



//Arrays

let myArray = ["Uno", "Dos", "Tres", "Cuatro"]

//Imprimir varios valores en la misma linea

print(myArray, myArray.count)

let emptyArray: [Int] = []

print("Valores almacenados: \(emptyArray.count)")



let shoppingList = ["Carne", "Pescado", "Chocolate", "Desayuno"]

for index in shoppingList {

    print(index)

}

for (index, item) in shoppingList.enumerated() {

    print("Index = \(index) item = \(item)")

}



shoppingList.forEach({ item in

    print(item)

})



//Set

let letters = Set<Character>()

//No admite duplicados

let favoriteGenres: Set<String> = ["Rock", "Pop", "HipHop", "Rock"]

print(favoriteGenres)



//Set operations

let oddDigits: Set = [1, 3, 5, 7, 9]

let evenDigits = [2, 4, 6, 8]

let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]



oddDigits.union(evenDigits).sorted()

print(oddDigits)

oddDigits.intersection(evenDigits).sorted()

oddDigits.subtracting(singleDigitPrimeNumbers).sorted()

oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()



//Diccionarios

var nameOfIntegers: [Int: String] = [:]

nameOfIntegers[16] = "Sixteen"

nameOfIntegers[1] = "One"

nameOfIntegers[2] = "Two"



//nameOfIntegers["Two"] = 2 falla por el orden de la declaracion de variables



nameOfIntegers.forEach { key, value in

    print("Key = \(key) value = \(value)")

}