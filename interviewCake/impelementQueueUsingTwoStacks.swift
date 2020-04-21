class QueueTwoStacks<Element> {
    private var inStack: [Element] = []
    private var outStack: [Element] = []

    // implement the enqueue and dequeue methods
    

    func enqueue(_ item: Element) {
    inStack.append(item)
    }

    func dequeue() -> Element? {
    
        if outStack.isEmpty {
            while !inStack.isEmpty {
                let a = inStack.removeLast()
                outStack.append(a)
            }
        }
        return outStack.popLast()
    }
}
