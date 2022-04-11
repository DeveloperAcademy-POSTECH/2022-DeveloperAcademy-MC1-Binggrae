//
//  FirewoodView.swift
//  MC1-Binggrae
//
//  Created by Doyun Park on 2022/04/11.
//

import SwiftUI

struct FirewoodView: View {
    
    private var audioManager = AudioManager()
    
    @Binding var data: Firewood?
    
    @State private var remainedTime: Int = 60
    @State var isPlaying : Bool = true
    @State private var showPopUp: Bool = false
    @State private var timeString = "1:00"

    @State var timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    }
    

    
    var body: some View {
        NavigationView{
            ZStack {
                Color.black.ignoresSafeArea()
                
                FireView(isPlaying: $isPlaying)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle(getDate())
                Image("firewood_image")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                    .foregroundColor(.white)
                    .aspectRatio(contentMode: .fill)
                    .offset(y: -10)
                
                    
                VStack(content: {
                    Button {
                        withAnimation(.linear(duration: 0.3)) {
                            showPopUp.toggle()
                        }
                    } label: {
                        HStack {
                            Text("\(timeString)")
                                .fontWeight(.bold)
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                                .onReceive(timer) { _ in
                                    timeString = "\(remainedTime/60):\(String(format: "%02d", remainedTime%60))"
                                }
                            Image(systemName: "plus.circle")
                        }
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .foregroundColor(.white)
                    }.onReceive(timer) { time in
                        if remainedTime > 0 {
                            remainedTime -= 1
                        } else if remainedTime == 0 {
                            self.stopTimer()
                        }
                        
                    }
                    Button {
                        if isPlaying {
                            self.stopTimer()
                        } else {
                            self.startTimer()
                        }
                        
                    } label: {
                        var text = self.isPlaying ? "중단하기" : "태우기를 시작하려면 화면을 터치하세요"
                        Text(text)
                            .fontWeight(.bold)
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .frame(width: 300, height: 30, alignment: .center)
                            .cornerRadius(15)
                            .onReceive(timer) { _ in
                                if remainedTime == 0 || !isPlaying{
                                    text = "태우기를 시작하려면 화면을 터치하세요"
                                }
                            }
                        
                    }.background(.gray)
                        .frame(width: 300, height: 30, alignment: .center)
                        .cornerRadius(15)
                        .offset(y:550)
                })
                .offset(y: -300)
                
                TimerPickerView(seconds: $remainedTime, isShowing: $showPopUp)
                    .frame(width: 400, height: 500, alignment: .center)
                
            }
            
        }
    }
    
    func stopTimer() {
        self.timer.upstream.connect().cancel()
        self.audioManager.stop()
        isPlaying = false
    }
    
    func startTimer(){
        remainedTime =  remainedTime == 0 ? 60 : self.remainedTime
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        self.audioManager.play()
        isPlaying = true
    }
}

//struct FirewoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        FirewoodView(firewood: $data)
//    }
//}
