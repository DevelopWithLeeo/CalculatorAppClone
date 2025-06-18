//
//  ContentView.swift
//  CalculatorAppClone
//
//  Created by JiJooMaeng on 6/3/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var displayExpression: String = "0"
    @State private var showHistory = false
    @State private var result: Double = 0
    
    // \(dailyFixed.formatted(.number.grouping(.automatic)))
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                    HStack {
                        Spacer()
                        Text(result == 0 ? displayExpression : String(result))
                            .padding()
                            .font(.system(size: 70))
                            .foregroundStyle(.white)
                    }
                    
                    HStack {
                        Button {
                            if displayExpression != "0" {
                                displayExpression.removeLast()
                                if displayExpression.isEmpty {
                                    displayExpression = "0"
                                }
                            }
                        } label: {
                            if displayExpression == "0" {
                                Text("AC")
                                    .frame(width: 88, height: 88)
                                    .font(.largeTitle)
                                    .foregroundStyle(.white)
                                    .background(Color("FunctionGray"))
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "delete.backward")
                                    .frame(width: 88, height: 88)
                                    .font(.largeTitle)
                                    .foregroundStyle(.white)
                                    .background(Color("FunctionGray"))
                                    .clipShape(Circle())
                            }
                        }
                        Button {
                            //C
                        } label: {
                            Image(systemName: "plus.forwardslash.minus")
                                .frame(width: 88, height: 88)
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .background(Color("FunctionGray"))
                                .clipShape(Circle())
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "percent")
                                .frame(width: 88, height: 88)
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .background(Color("FunctionGray"))
                                .clipShape(Circle())
                        }
                        
                        Button {
                            if displayExpression.suffix(2) == "×-" || displayExpression.suffix(2) == "÷-" {
                                displayExpression.removeLast(2)
                                displayExpression += "÷"
                            } else if let lastChar = displayExpression.last, ["+", "-", "×", "÷"].contains(lastChar) {
                                displayExpression.removeLast()
                                displayExpression += "÷"
                            } else {
                                displayExpression += "÷"
                            }
                        } label: {
                            Image(systemName: "divide")
                                .frame(width: 88, height: 88)
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .background(.orange)
                                .clipShape(Circle())
                        }
                    }
                    
                    HStack {
                        NumberPadView(number: "7", displayExpression: $displayExpression)
                        NumberPadView(number: "8", displayExpression: $displayExpression)
                        NumberPadView(number: "9", displayExpression: $displayExpression)
                        Button {
                            if displayExpression.suffix(2) == "×-" || displayExpression.suffix(2) == "÷-" {
                                displayExpression.removeLast(2)
                                displayExpression += "×"
                            } else if let lastChar = displayExpression.last, ["+", "-", "×", "÷"].contains(lastChar) {
                                displayExpression.removeLast()
                                displayExpression += "×"
                            } else {
                                displayExpression += "×"
                            }
                        } label: {
                            Image(systemName: "multiply")
                                .frame(width: 88, height: 88)
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .background(.orange)
                                .clipShape(Circle())
                        }
                    }
                    
                    HStack {
                        NumberPadView(number: "4", displayExpression: $displayExpression)
                        NumberPadView(number: "5", displayExpression: $displayExpression)
                        NumberPadView(number: "6", displayExpression: $displayExpression)
                        Button {
                            if displayExpression.suffix(2) == "×-" || displayExpression.suffix(2) == "÷-" {
                            } else if let lastChar = displayExpression.last {
                                if ["×", "÷"].contains(lastChar) {
                                    displayExpression += "-"
                                } else if ["+", "-", "×", "÷"].contains(lastChar) {
                                    displayExpression.removeLast()
                                    displayExpression += "-"
                                } else {
                                    displayExpression += "-"
                                }
                            }
                        } label: {
                            Image(systemName: "minus")
                                .frame(width: 88, height: 88)
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .background(.orange)
                                .clipShape(Circle())
                        }
                    }
                    
                    HStack {
                        NumberPadView(number: "1", displayExpression: $displayExpression)
                        NumberPadView(number: "2", displayExpression: $displayExpression)
                        NumberPadView(number: "3", displayExpression: $displayExpression)
                        Button {
                            if displayExpression.suffix(2) == "×-" || displayExpression.suffix(2) == "÷-" {
                                displayExpression.removeLast(2)
                                displayExpression += "+"
                            } else if let lastChar = displayExpression.last, ["+", "-", "×", "÷"].contains(lastChar) {
                                displayExpression.removeLast()
                                displayExpression += "+"
                            } else {
                                displayExpression += "+"
                            }
                        } label: {
                            Image(systemName: "plus")
                                .frame(width: 88, height: 88)
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .background(.orange)
                                .clipShape(Circle())
                        }
                    }
                    
                    HStack {
                        Button {
                            //C
                        } label: {
                            Image(systemName: "candybarphone")
                                .frame(width: 88, height: 88)
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .background(.darkGray)
                                .clipShape(Circle())
                        }
                        NumberPadView(number: "0", displayExpression: $displayExpression)
                        Button {
                            //C
                        } label: {
                            Text(".")
                                .frame(width: 88, height: 88)
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .background(.darkGray)
                                .clipShape(Circle())
                        }
                        Button {
                            let numbers = displayExpression.split(separator: "+")
//                            print(displayExpression.split(separator: "+"))
                            
                            for i in numbers {
                                if let value = Double(i) {
                                    result += value
                                }
                            }
                            print(result)
                            
                        } label: {
                            Image(systemName: "equal")
                                .frame(width: 88, height: 88)
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .background(.orange)
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showHistory = true
                    } label: {
                        Image(systemName: "list.bullet")
                            .foregroundStyle(.orange)
                    }
                }
            }
            .sheet(isPresented: $showHistory) {
                NavigationStack {
                    MenuView()
                        .presentationDetents([.fraction(0.5)])
                        .presentationDragIndicator(.visible)
                }
            }
        }
    }
}


struct NumberPadView: View {
    let number: String
    @Binding var displayExpression: String
    
    var body: some View {
        Button {
            if displayExpression == "0" {
                displayExpression = number
            } else {
                displayExpression += number
            }
            print("\(number)")
        } label: {
            Text(number)
                .frame(width: 88, height: 88)
                .font(.largeTitle)
                .foregroundStyle(.white)
                .background(.darkGray)
                .clipShape(Circle())
        }
    }
}

struct MenuView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.darkGray.ignoresSafeArea()
            VStack {
                Text("테스트")
            }
                        
        }
        .toolbar {
            Button {
                dismiss()
            } label: {
                Text("완료")
                    .foregroundStyle(.orange)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button {
                    //
                } label: {
                    Text("편집")
                        .foregroundStyle(.orange)
                }
                Button {
                    //
                } label: {
                    Text("지우기")
                        .foregroundStyle(.red)
                }
            }
        }
        .background(.gray)
    }
}




#Preview {
    NavigationStack {
        ContentView()
    }
}
