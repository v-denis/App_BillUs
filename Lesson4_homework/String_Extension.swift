//
//  String_Extension.swift
//  Lesson4_homework
//
//  Created by MacBook Air on 12.03.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import Foundation


extension String {
	
	public func replaceCharacter(with oldChar: Character, newChar: Character) -> String {
		
		var oldArray = Array(self)
		
		for index in oldArray.indices {
			if oldArray[index] == oldChar {
				oldArray[index] = newChar
			}
		}
		let resultStirng = String(oldArray)
		return resultStirng
	}
	
}
