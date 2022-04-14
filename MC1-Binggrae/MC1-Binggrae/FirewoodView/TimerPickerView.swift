import SwiftUI

struct TimerPickerView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding public var seconds: Int
    @Binding public var isShowing : Bool
    
    @State private var selectedMinutes = 1
    @State private var selectedSeconds = 0
    
    var body: some View {
        if isShowing {
            
            GeometryReader { geometry in
                VStack {
                    HStack {
                        Spacer()
                        Picker("select minutes", selection: $selectedMinutes) {
                            ForEach(0..<60) { minutes in
                                Text("\(minutes)")
                            }
                        }.pickerStyle(.wheel)
                            .frame(width: geometry.size.width/3, height: 200)
                            .clipped()
                        Text("분")
                        Spacer()
                        Picker("select seconds", selection: $selectedSeconds) {
                            ForEach(0..<60) { seconds in
                                Text("\(seconds)")
                            }
                        }.pickerStyle(.wheel)
                            .frame(width: geometry.size.width/3, height: 200)
                            .clipped()
                        Text("초")
                        Spacer()
                        
                    }
                    Divider()
                    Button {
                        updatePickers()
                        isShowing = false
                    } label: {
                        Text("확인")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.secondary)
                    }.frame(height: 40)
                    
                }
                .onAppear(perform: { updatePickers() })
                .onDisappear {
                    updatePickers()
                }
                .background(Color.white)
                .opacity(0.9)
                
            }.frame(width: 350, height: 250)
                .background(Color.white)
                .cornerRadius(20)
        }
    }
    
    func updatePickers() {
        seconds = selectedSeconds + selectedMinutes * 60
    }
}
