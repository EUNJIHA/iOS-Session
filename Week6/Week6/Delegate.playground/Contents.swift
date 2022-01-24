protocol PoliceCodes {
    
    func nineOhTwo()
}
class Officer {
    var radio : PoliceCodes?
    
    func callItIn() {
        radio?.nineOhTwo()
    }
}

class Dispatcher: PoliceCodes {
    func nineOhTwo() {
        print("902 received and handled")
    }
}

let o = Officer()
let d = Dispatcher()
o.radio = d
o.callItIn()
