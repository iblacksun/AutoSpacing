//
//  String+AutoSpacing.swift
//  demo
//
//  Created by Peng Guo on 2017/8/31.
//  Copyright © 2017年 Peng Guo. All rights reserved.
//

import Foundation

extension String {

	public var spaced: String{

		let range = NSMakeRange(0, self.characters.count)


		if #available(iOS 11.0, *) {
			let ava = NSLinguisticTagger.availableTagSchemes(forLanguage: "zh-Hans")

			NSLinguisticTagger.enumerateTags(for: self, range: range, unit: .word, scheme: .lexicalClass, options: [.omitWhitespace, .omitPunctuation], orthography: nil) { tag, range, stop in
				//debugPrint("\(tag) --- \((self as NSString).substring(with: range))")
			}

		} else {

			let linguisticTagger = NSLinguisticTagger(tagSchemes: [.lexicalClass, .language], options: 0)
			linguisticTagger.string = self

			//先找出英文
			linguisticTagger.enumerateTags(in: range, scheme: .language, options: [.omitWhitespace]) { tag, tokenRange, sentenceRange, stop in
				guard let tag = tag, tag.rawValue == "en" else{
					return
				}
				debugPrint("\(tag) --- \((self as NSString).substring(with: tokenRange))")
			}
			//先找出英文
			linguisticTagger.enumerateTags(in: range, scheme: .lexicalClass, options: [.omitWhitespace, .omitOther]) { tag, tokenRange, sentenceRange, stop in
				guard let tag = tag else{
					return
				}

				debugPrint("\(tag) --- \((self as NSString).substring(with: tokenRange))")
			}
		}

		return self
	}
}
