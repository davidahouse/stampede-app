//
//  StandardCell.swift
//  Stampede-Mobile
//
//  Created by David House on 1/3/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct StandardCellViewModel: Identifiable {
    let id: String
    let title: String
    let subtitle: String?
    let icon: CurrentTheme.Icons?
    let value: String?
}

protocol StandardCellModelable: Identifiable, Hashable {
    func toStandardCellViewModel() -> StandardCellViewModel
}

struct StandardCell: View {
    
    let viewModel: StandardCellViewModel
    
    var body: some View {
        HStack {
            if viewModel.icon != nil {
                viewModel.icon!.image().font(Font.system(size: 32, weight: .regular))
            }
            VStack(alignment: .leading) {
                PrimaryLabel(viewModel.title)
                if viewModel.subtitle != nil && viewModel.subtitle!.count > 0 {
                    SecondaryLabel(viewModel.subtitle!)
                }
            }
            if viewModel.value != nil {
                Spacer()
                ValueLabel(viewModel.value!)
            }
        }
    }
}

#if DEBUG

struct StandardCell_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            List {
                StandardCell(viewModel: StandardCellViewModel(id: "123", title: "aTitle", subtitle: "aSubTitle", icon: nil, value: nil))
                StandardCell(viewModel: StandardCellViewModel(id: "123", title: "aTitle", subtitle: nil, icon: nil, value: nil))
                StandardCell(viewModel: StandardCellViewModel(id: "123", title: "aTitle", subtitle: "", icon: nil, value: nil))
                StandardCell(viewModel: StandardCellViewModel(id: "123", title: "aTitle", subtitle: "aSubTitle", icon: .success, value: nil))
                StandardCell(viewModel: StandardCellViewModel(id: "123", title: "aTitle", subtitle: nil, icon: .inProgress, value: nil))
                StandardCell(viewModel: StandardCellViewModel(id: "123", title: "aTitle", subtitle: "aSubTitle", icon: nil, value: "aValue"))
                StandardCell(viewModel: StandardCellViewModel(id: "123", title: "aTitle", subtitle: "aSubTitle", icon: .failure, value: "aValue"))
            }
        }
    }
}
#endif
