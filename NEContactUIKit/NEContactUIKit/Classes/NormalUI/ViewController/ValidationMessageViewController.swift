
// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import UIKit
import NECoreKit
import NECoreIMKit

@objcMembers
open class ValidationMessageViewController: NEBaseValidationMessageViewController {
  override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    tag = "ValidationMessageViewController"
    customNavigationView.backgroundColor = .white
    navigationController?.navigationBar.backgroundColor = .white
  }

  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override open func setupUI() {
    super.setupUI()
    let clearItem = UIBarButtonItem(
      title: localizable("clear"),
      style: .done,
      target: self,
      action: #selector(clearMessage)
    )
    clearItem.tintColor = .ne_darkText
    var textAttributes = [NSAttributedString.Key: Any]()
    textAttributes[.font] = UIFont.systemFont(ofSize: 14, weight: .regular)

    clearItem.setTitleTextAttributes(textAttributes, for: .normal)
    navigationItem.rightBarButtonItem = clearItem

    customNavigationView.moreButton.titleLabel?.font = .systemFont(ofSize: 16)

    tableView.register(
      SystemNotificationCell.self,
      forCellReuseIdentifier: "\(SystemNotificationCell.self)"
    )
  }
}

extension ValidationMessageViewController {
  override open func tableView(_ tableView: UITableView,
                               cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let noti = viewModel.datas[indexPath.row]
    let reuseIdentifier = "\(SystemNotificationCell.self)"
    let cell = tableView.dequeueReusableCell(
      withIdentifier: reuseIdentifier,
      for: indexPath
    ) as! SystemNotificationCell
    cell.delegate = self
    cell.confige(noti)
    return cell
  }
}
