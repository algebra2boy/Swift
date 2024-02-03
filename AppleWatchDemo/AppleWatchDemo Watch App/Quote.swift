//
//  Quote.swift
//  AppleWatchDemo Watch App
//
//  Created by Yongye Tan on 2/2/24.
//

import Foundation

struct Quote: Identifiable, Hashable {
    var id: UUID
    var author: String
    var quote: String
    
    init(id: UUID = UUID(), author: String, quote: String) {
        self.id = id
        self.author = author
        self.quote = quote
    }
    
    static let quotes: [Quote] = [
        // Quotes from 余华
        Quote(author: "余华", quote: "生命的意义在于不断探索未知。"),
        Quote(author: "余华", quote: "坚韧和毅力是成功的关键。"),
        Quote(author: "余华", quote: "每一次挫折都是成长的机会。"),
        Quote(author: "余华", quote: "相信自己，你就能克服一切困难。"),
        Quote(author: "余华", quote: "成功的路上充满了坎坷，但每一步都值得。"),
        
        // Quotes from 马斯克
        Quote(author: "马斯克", quote: "如果你认为某事很重要，那就别停止，即使困难重重。"),
        Quote(author: "马斯克", quote: "决心和毅力是通向成功的桥梁。"),
        Quote(author: "马斯克", quote: "激情和信念能够克服一切。"),
        Quote(author: "马斯克", quote: "要不断超越自己，才能取得卓越成就。"),
        Quote(author: "马斯克", quote: "不要害怕失败，失败是成功之母。"),
        Quote(author: "马斯克", quote: "首先要先相信一件事是有可能的，然后可能性才会发生。"),
        Quote(author: "马斯克", quote: "如果一件事情够重要，那么即便所有条件都与你作对，你仍应该要做。"),
        Quote(author: "马斯克", quote: "失败很正常，如果没有经历失败，表示你还不夠创新。"),
        
        
        // Quotes from 乔布斯
        Quote(author: "乔布斯", quote: "创新是区分普通人和优秀人的标志。"),
        Quote(author: "乔布斯", quote: "要有勇气去追求自己的梦想。"),
        Quote(author: "乔布斯", quote: "坚持不懈，直至成功。"),
        Quote(author: "乔布斯", quote: "只有热爱自己的工作，才能成就伟大事业。"),
        Quote(author: "乔布斯", quote: "要有愿景，要看得更远。"),
        
        // Quotes from 孙子兵法
        Quote(author: "孙子兵法", quote: "知己知彼，百战不殆。"),
        Quote(author: "孙子兵法", quote: "兵不厌诈。"),
        Quote(author: "孙子兵法", quote: "先发制人，后发制于人。"),
        Quote(author: "孙子兵法", quote: "速战速决，久战兵钝。"),
        Quote(author: "孙子兵法", quote: "攻其无备，出其不意。"),
        
        // Additional quotes
        Quote(author: "王阳明", quote: "万事开头难，只要肯下功夫，事事能成功。"),
        Quote(author: "李嘉诚", quote: "机会永远掌握在有准备的人手中。"),
        Quote(author: "华罗庚", quote: "成功是积累出来的，不是等出来的。"),
        Quote(author: "梁启超", quote: "成大事者，不拘小节。"),
        Quote(author: "毛泽东", quote: "世上无难事，只要肯攀登。"),
        
        // Rest of the quotes
        Quote(author: "李威", quote: "每一次的失败都是迈向成功的一步。"),
        Quote(author: "张小娴", quote: "命运掌握在自己手中。"),
        Quote(author: "雷军", quote: "坚持和耐心是取得成功的关键。"),
        Quote(author: "周恩来", quote: "干一行，爱一行，专一行，致一行，成一行。"),
    ]
}
