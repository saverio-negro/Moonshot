//
//  CustomDividerView.swift
//  Moonshot
//
//  Created by Saverio Negro on 09/12/24.
//

import SwiftUI

struct CustomDividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomDividerView()
}
