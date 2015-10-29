class Qnode<T> {
    var value:T?
    var next: Qnode?
}

let a = Qnode<Int>()
a.value = 3

let b = Qnode<Int>()
b.value = 4

let c = Qnode<Int>()
c.value = 5

a.next = b
b.next = c

let one = a
let two = one.next
let three = two?.next
let four = three?.next

one.value
two?.value
three?.value
four



class Queue<T> {
    
    private var top:Qnode<T>!
    
    var description:String  {
        get {
            return self.describe()
        }
    }
    
    private func describe() ->String{
        var result = "<Queue"
        
        var currentQnode = top
        
        while (currentQnode != nil){
            if let value = currentQnode.value {
                result += " \(value)"
            }
            currentQnode = currentQnode.next
        }
        
        return result + " >"

    }
    
    func enque(value: T){
        if top == nil {
            top = Qnode<T>()
        }
        
        if (top.value == nil) {
            top.value = value;
            return
        }
        
        let newNode: Qnode<T> = Qnode<T>()
        newNode.value = value;

        var current:Qnode = top
        
        while (current.next != nil) {
            current = current.next!
        }
        
        current.next = newNode;
    }
    
    
    func deque()  -> T? {
        if top == nil {
            return nil
        }
        
        let queItem: T? = top.value
        
        if let nextItem = top.next {
            top = nextItem
        } else {
            top = nil
        }
        
        return queItem
    }
}

var q = Queue<Int>()
q.description


q.enque(1)
q.enque(2)
q.enque(3)
q.description

q.deque()
q.deque()
q.deque()
q.deque()
q.enque(34)
q.enque(234)
q.enque(8734)
q.description
q.deque()





