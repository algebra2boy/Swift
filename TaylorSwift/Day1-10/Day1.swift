// this variable can vary
var greetings = "Hello, how are you?"
print(greetings)

greetings = "Hello. nice weather!"
print(greetings)

let name = "yongye"
print(name)

// cannot reassign a let variable 
//name = "Hugo"
// print(name)

// multiple line must have triple quotations and words in between 
let quote = """
Another day
of me learning ios
"""

print(quote)
// return the length of the quote
print(quote.count)
print(quote.uppercased())

var number_of_exam = 2 
number_of_exam += 3
number_of_exam *= 3
number_of_exam /= 7
print(number_of_exam) // = 2

// swift does not care if there is underscore between numbers 
let larger_number = 100_00_00
print(larger_number)
