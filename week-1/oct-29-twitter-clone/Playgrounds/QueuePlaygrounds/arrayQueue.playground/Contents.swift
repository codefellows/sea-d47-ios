//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class Queue {
    private var qArray:[Int] = [Int]()
    
    var description:String {
        get{
            return qArray.description
        }
    }
    
    func enque(num:Int){
        qArray.append(num)
    }
    
    func deque() -> Int? {
        if qArray.count == 0 {
            return nil
        }
        
        let result = qArray[0]
        
        for (var i=0; i<qArray.count-1; i++){
            qArray[i] = qArray[i+1]
        }
        
        qArray.dropLast()
        
        return result
    }
}

let q = Queue()

q.enque(100)
q.enque(101)
q.enque(102)

q.description

q.deque()
q.deque()
q.deque()

q.description

