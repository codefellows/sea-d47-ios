

class Queue<T> {
    private var qArray:[T] = [T]()
    
    var description:String {
        get{
            return qArray.description
        }
    }
    
    func enque(num:T){
        qArray.append(num)
    }
    
    func deque() -> T? {
        if qArray.count == 0 {
            return nil
        }
        
        let result = qArray[0]
        
        for (var i=0; i<qArray.count-1; i++){
            qArray[i] = qArray[i+1]
        }
        
        qArray.removeLast()
        
        return result
    }
}

let q = Queue<String>()

q.enque("HELLO")
q.enque("WORLD")
q.enque("!")

q.description

q.deque()
q.deque()
q.deque()

q.description

