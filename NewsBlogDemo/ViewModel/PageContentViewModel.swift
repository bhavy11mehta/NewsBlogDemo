//
//  File.swift
//  NewsBlogDemo
//
//  Created by gwl-42 on 22/11/23.
//

import RxSwift
import RxDataSources

struct Item {
    let name: String
}

let allItems: [Item] = [
    Item(name: "Item 1"),
    Item(name: "Item 2"),
    Item(name: "Item 3"),
    Item(name: "Item 4"),
    Item(name: "I think there is another way to do this by calculating the number of lines you require and deciding the height appropriately."),
    Item(name: "Item 6"),
    Item(name: "Item 7"),
    Item(name: "Item 8"),
    Item(name: "Item 9"),
    Item(name: "It motivates me to keep creating content, and helps improve the reach of the article. It also lets me know wether the quality of the content is decent or not It motivates me to keep creating content, and helps improve the reach of the article. It also lets me know wether the quality of the content is decent or not"),
    Item(name: "Item 11"),
    Item(name: "Item 12"),
    Item(name: "Item 13"),
    Item(name: "Item 14"),
    Item(name: "I think there is another way to do this by calculating the number of lines you require and deciding the height appropriately.5"),
    Item(name: "Item 16"),
    Item(name: "Item 17"),
    Item(name: "Item 18"),
    Item(name: "Item 19"),
    Item(name: "It motivates me to keep creating content, and helps improve the reach of the article. It also lets me know wether the quality of the content is decent or not It motivates me to keep creating content, and helps improve the reach of the article. It also lets me know wether the quality of the content is decent or no"),
    Item(name: "Item 1"),
    Item(name: "Item 2"),
    Item(name: "Item 3"),
    Item(name: "Item 4"),
    Item(name: "I think there is another way to do this by calculating the number of lines you require and deciding the height appropriately."),
    Item(name: "Item 6"),
    Item(name: "Item 7"),
    Item(name: "Item 8"),
    Item(name: "Item 9"),
    Item(name: "It motivates me to keep creating content, and helps improve the reach of the article. It also lets me know wether the quality of the content is decent or not It motivates me to keep creating content, and helps improve the reach of the article. It also lets me know wether the quality of the content is decent or no"),
    Item(name: "Item 11"),
    Item(name: "Item 12"),
    Item(name: "Item 13"),
    Item(name: "Item 14"),
    Item(name: "I think there is another way to do this by calculating the number of lines you require and deciding the height appropriately.5"),
    Item(name: "Item 16"),
    Item(name: "Item 17"),
    Item(name: "Item 18"),
    Item(name: "Item 19"),
    Item(name: "It motivates me to keep creating content, and helps improve the reach of the article. It also lets me know wether the quality of the content is decent or not It motivates me to keep creating content, and helps improve the reach of the article. It also lets me know wether the quality of the content is decent or no")
]


class PageContentViewModel {
    let items = BehaviorSubject<[Item]>(value: [])

        func loadMoreData() {
            // Simulate loading more data after a delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
                guard let self = self else { return }
                var currentItems = (try? self.items.value()) ?? []
                currentItems += allItems // Assuming you're adding all items for simulation
                self.items.onNext(currentItems)
            }
        }
}
