//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Sósthenes Oliveira Lima on 18/09/23.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
              }
          }
          return nil
        }
    }
    
