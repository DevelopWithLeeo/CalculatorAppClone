//
//  ContentView.swift
//  CalculatorAppClone
//
//  Created by JiJooMaeng on 6/3/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showHistory = false
    
    // \(dailyFixed.formatted(.number.grouping(.automatic)))
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("33,332,313")
                            .padding()
                            .font(.system(size: 70))
                            .foregroundStyle(.white)
                    }
                    
                    HStack {
                        Button {
                            //C
                        } label: {
                            Image(systemName: "delete.backward")
                                .frame(width: 88, height: 88)
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .background(Color("FunctionGray"))
                                .clipShape(Circle())
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
                            //C
                        } label: {
                            Image(systemName: "percent")
                                .frame(width: 88, height: 88)
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .background(Color("FunctionGray"))
                                .clipShape(Circle())
                        }
                        
                        Button {
                            //C
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
                        NumberPadView(number: "7")
                        NumberPadView(number: "8")
                        NumberPadView(number: "9")
                        Button {
                            //C
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
                        NumberPadView(number: "4")
                        NumberPadView(number: "5")
                        NumberPadView(number: "6")
                        Button {
                            //C
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
                        NumberPadView(number: "1")
                        NumberPadView(number: "2")
                        NumberPadView(number: "3")
                        Button {
                            //C
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
                            Text("ㅁ")
                                .frame(width: 88, height: 88)
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .background(.darkGray)
                                .clipShape(Circle())
                        }
                        NumberPadView(number: "0")
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
                            //C
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
    
    var body: some View {
        Button {
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
    }
}




#Preview {
    NavigationStack {
        ContentView()
    }
}
