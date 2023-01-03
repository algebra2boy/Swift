let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// filter out any numbers that are even
let evenNumbers = luckyNumbers.filter {$0 % 2 == 0}
print(evenNumbers)

// sort the array in ascending order 
let asc_order = luckyNumbers.sorted {$0 < $1 }
print(asc_order)


let lucky = luckyNumbers.map {"\($0) is a lucky number"}
print(lucky)

