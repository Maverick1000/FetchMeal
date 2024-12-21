//
//  NoDataView.swift
//  FetchMeal
//
//  Created by Paul Walker on 12/20/24.
//
import SwiftUI

struct NoDataView : View{
    var body: some View {
        Text("Request come back with no data")
            .font(.subheadline)
            .multilineTextAlignment(.center)
            .italic()
    }
}

#Preview {
    NoDataView()
}
