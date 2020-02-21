//
//  String.swift
//  zizhibizhi
//
//  Created by mac on 2019/10/24.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit

extension String {

    func toLocalString() -> String {
        return NSLocalizedString(self as String, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }

}
