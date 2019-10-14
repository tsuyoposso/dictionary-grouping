import UIKit

struct Content {
    let todo: String
    let estimate: Int
    let actual: Int
    let date: Date
}

var todos = [Date: [Content]]()

let f = DateFormatter()
f.locale = Locale(identifier: "en_US_POSIX")
f.dateFormat = "yyyy/MM/dd"

let contents = [Content(todo: "物理", estimate: 1234, actual: 1345, date: f.date(from: "2019/10/11")!),
                Content(todo: "化学", estimate: 4312, actual: 4444, date: f.date(from: "2019/10/11")!),
                Content(todo: "英語", estimate: 1434, actual: 1545, date: f.date(from: "2019/10/12")!),
                Content(todo: "数学", estimate: 2222, actual: 2145, date: f.date(from: "2019/10/14")!),
                Content(todo: "国語", estimate: 4321, actual: 5333, date: f.date(from: "2019/10/14")!)]

todos = Dictionary(grouping: contents) { content -> Date in
//    let s = f.string(from: content.date)
//    print(s)
    return content.date
}
.reduce(into: [Date: [Content]]()) {dic, tuple in
    dic[tuple.key] = tuple.value.sorted { $0.date < $1.date }
}
print(todos[f.date(from: "2019/10/14")!]!)
