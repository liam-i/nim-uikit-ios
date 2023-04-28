
// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import Foundation

extension String {
  // 计算文字size
  static func getTextRectSize(_ text: String, font: UIFont, size: CGSize) -> CGSize {
    let attributes = [NSAttributedString.Key.font: font]
    let option = NSStringDrawingOptions.usesLineFragmentOrigin
    let rect: CGRect = text.boundingRect(with: size, options: option,
                                         attributes: attributes, context: nil)
    return rect.size
  }

  /// 计算 string 的行数，使用 font 的 lineHeight
  static func calculateMaxLines(width: CGFloat, string: String, font: UIFont) -> Int {
    let maxSize = CGSize(width: width, height: CGFloat(Float.infinity))
    let charSize = font.lineHeight
    let textSize = getTextRectSize(string, font: font, size: maxSize)
    let lines = Int(textSize.height / charSize)
    return lines
  }

  static func stringFromDate(date: Date) -> String {
    let fmt = DateFormatter()
    if Calendar.current.isDateInToday(date) {
      fmt.dateFormat = "HH:mm"
    } else {
      if let firstDayYear = firstDayInYear() {
        let dur = date.timeIntervalSince(firstDayYear)
        if dur > 0 {
          fmt.dateFormat = chatLocalizable("mdhm")
        } else {
          fmt.dateFormat = chatLocalizable("ymdhm")
        }
      } else {
        fmt.dateFormat = chatLocalizable("ymdhm")
      }
    }
    return fmt.string(from: date)
  }

  static func firstDayInYear() -> Date? {
    let format = DateFormatter()
    format.dateFormat = "yyyy-MM-dd"
    let year = Calendar.current.component(.year, from: Date())
    return format.date(from: "\(year)-01-01")
  }
}