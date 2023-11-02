//
//  AddView.swift
//  ToDoList
//
//  Created by Максим Шишлов on 19.10.2023.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var tfText: String = ""
    
    @State var showAlert = false
    @State var alertTitle = ""
    
    
    let color = UIColor(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type here something...", text: $tfText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(color))
                    .clipShape(.buttonBorder)
                
                Button {
                    saveNewItem()
                } label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor)
                        .clipShape(.buttonBorder)
                }
            }
            .padding()
        }
        .navigationTitle("Add an tasks ✏️")
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })


    }
    
    func saveNewItem() {
        if textIsValid() {
            listViewModel.newItem(title: tfText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsValid() -> Bool {
        if tfText.count < 3 {
            showAlert.toggle()
            alertTitle = "U new todos must be at least 3 characters 🤪"
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    

}

#Preview {
    NavigationStack {
        AddView()
            .environmentObject(ListViewModel())
    }
}
