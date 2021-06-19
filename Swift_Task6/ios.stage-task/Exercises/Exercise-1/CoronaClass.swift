import Foundation

class CoronaClass {
    
    var seats = [Int]()
    var countOfSeats = 0
    
    var maxi = 0
    var maxi2 = 0
    
    init(n: Int) {
        countOfSeats = n
    }
    
    func seat() -> Int {
        if seats.isEmpty {
            seats.append(0)
            return 0
        } else if seats.count == 1 {
            
            let center = seats[0]
            var emptyPlaces = 0
            var newPlace = 0
            
            for i in 0..<countOfSeats {
                emptyPlaces = abs(center - i) > emptyPlaces ? abs(center-i) : emptyPlaces
                newPlace = center - (center - i)
            }
            seats.append(newPlace)
            return newPlace
        } else {
            var count = 0
            
            var k = 0
            var left = seats[k]
            var right = seats[k+1]
            
            var emptyPlaces = 0
            var newPlace = 0
            
            while count != countOfSeats {
                
                if count == left {
                    count+=1
                    continue
                }
                
                if count == right {
                    if k >= seats.count - 2 {
                        count+=1
                        continue
                    } else {
                        k+=1
                        left = seats[k]
                        right = seats[k+1]
                        count+=1
                        continue
                    }
                }
                
                if count < left {
                    if (left - count) > emptyPlaces {
                        emptyPlaces = left - count
                        newPlace = left - emptyPlaces
                        count+=1
                        continue
                    } else { count+=1; continue }
                }
                
                if count > left && count < right {
                    if min(count - left, right - count) > emptyPlaces {
                        emptyPlaces = min(count - left, right - count)
                        newPlace = left + emptyPlaces
                        count+=1
                        continue
                    } else { count+=1; continue }
                }
                
                if count > right {
                    if (count - right) > emptyPlaces {
                        emptyPlaces = count - right
                        newPlace = right + emptyPlaces
                        count+=1
                        continue
                    } else { count+=1; continue }
                }
                
            }
            
            seats.append(newPlace)
            seats.sort()
            return newPlace
        }
    }
    
    func leave(_ p: Int) {
        if let index = seats.firstIndex(of: p) {
            seats.remove(at: index)
        }
    }
}
