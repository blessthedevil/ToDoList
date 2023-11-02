//
//  ListRowView.swift
//  ToDoList
//
//  Created by Максим Шишлов on 19.10.2023.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    NavigationStack {
        ListRowView(item: ItemModel(title: "Test", isCompleted: true))
    }
}
