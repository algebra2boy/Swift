
import Swift
import Foundation

// enum must have the error type 
enum badNumber : Error {
	case OutOfBound
}


func sqrtOfANumber (number num : Int) throws -> Double {

	if (num < 1 || num > 10000) {
		throw badNumber.OutOfBound
	}

	return sqrt(Double(num))

} 

do {

	let result = try sqrtOfANumber(number: 200000)
	print(result)
} catch badNumber.OutOfBound{
	print("out of bounds")
}