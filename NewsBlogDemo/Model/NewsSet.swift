//
//  NewsSet.swift
//  NewsBlogDemo
//
//  Created by gwl-42 on 22/11/23.
//

import Foundation

struct NewsObject {
    let title: String
    let image: String
}

class NewsSet {
    static let data : [NewsObject] = [
        NewsObject(title: "It motivates me to keep creating content, and helps improve the reach of the article. It also lets me know wether the quality of the content is decent or not It motivates me to keep creating content, and helps improve the reach of the article. It also lets me know wether the quality of the content is decent or not It motivates me to keep creating content, and helps improve the reach of the article. It also lets me know wether the quality of the content is decent or not It motivates me to keep creating content, and helps improve the reach of the article. It also lets me know wether the quality of the content is decent or not",
                   image: "1.jpg"),
        NewsObject(title: "Why does Appreciation matter?",
                   image: "2.jpg"),
        NewsObject(title: "Why am I writing this article?",
                   image: "3.jpg"),
        NewsObject(title: "Why does Appreciation matter?",
                   image: "1.jpg")
    ]
}
