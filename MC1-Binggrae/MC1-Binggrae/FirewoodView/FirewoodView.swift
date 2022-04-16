//
//  FirewoodView.swift
//  MC1-Binggrae
//
//  Created by Doyun Park on 2022/04/11.
//

import SwiftUI

struct FirewoodView: View {
    
    @State private var showPopUp: Bool = false
    @State private var timeString: NSMutableAttributedString = NSMutableAttributedString(string: "")
    @State var timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    @State var isNext:Bool = false
    @State var isPresenting : Bool = false
    @State var isPause: Bool = false
    @State var isPlaying : Bool = true
    
    var asmrName : String?
    
    @State var flameColor : String
    @State var imageName:String
    @State var remainedTime: Int = 60 {
        didSet {
            timeString = timeString(time: self.remainedTime)
        }
    }
    @State var audioManager: AudioManager?
//    var audioManager = AudioManager(name:$asmrNAme)
    
    
    private let firewoodViewText1: LocalizedStringKey = "FirewoodView.cancel"
    private let firewoodViewText2: LocalizedStringKey = "FirewoodView.restart"
    private let firewoodViewText3: LocalizedStringKey = "FirewoodView.minutes"
    private let firewoodViewText4: LocalizedStringKey = "FirewoodView.seconds"
    
    var body: some View {
        NavigationView{
            ZStack {
                ZStack {
                    Image(imageName)
                        .resizable()
                        .frame(width: 180, height: 180, alignment: .center)
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fill)
                        .offset(y: 45)
                    
                    FireView(isPlaying: $isPlaying,flameColor: $flameColor)
                        .opacity(isPlaying ? 0.85 : 0.0)
                        .offset(y: -50)
                            
                    VStack(content: {
                        Button {
                            withAnimation(.linear(duration: 0.3)) {
                                remainedTime += 60
                            }
                        } label: {
                            HStack {
                                Text("\(timeString)")
                                    .fontWeight(.bold)
                                    .font(.system(size: 50))
                                    .foregroundColor(.white)
                                    .onReceive(timer) { _ in
                                        timeString = timeString(time: self.remainedTime)
                                    }
                                Image("time")
                                    .resizable()
                                    .frame(width: 24, height:24)
                                    .offset(x:5,y:2)
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
                        .offset(y:50)
                        
                        Button {
                            if isPlaying {
                                self.stopTimer()
                            } else {
                                self.startTimer()
                            }
                            
                        } label: {
                            var text = self.isPlaying ? firewoodViewText1.toString() : firewoodViewText2.toString()
                            Text(text)
                                .fontWeight(.bold)
                                .font(.custom("NotoSansCJKkr-Light", size: 18))
                                .foregroundColor(.white)
                                .frame(width: 300, height: 30, alignment: .center)
                                .cornerRadius(15)
                                .onReceive(timer) { _ in
                                    if remainedTime == 0 || !isPlaying {
                                        text = firewoodViewText2.toString()
                                        stopTimer()
                                    }
                                }
                        }
                        .frame(width: 300, height: 30, alignment: .center)
                        .cornerRadius(15)
                        .offset(y:580)
                        .fullScreenCover(isPresented: $isPresenting) {
                            CreateView()
                        }
                    })
                    .offset(y: -300)
                }
                .fullScreenCover(isPresented: $isNext) {
                    OutroView()
                }
                .onAppear(){
                    audioManager = AudioManager(name: self.asmrName!)
                    startTimer()
                }.opacity(isPause ? 0.3 : 1)
                
                CustomAlertView(isShowing: $isPause,isNext: $isNext)
                    .frame(width: 320, height: 240)
                    .offset(y:-60)
            }
        }
    }
    
    func stopTimer() {
        self.timer.upstream.connect().cancel()
        audioManager?.stop()
        isPlaying = false
        isPause = true
    }
    
    func startTimer(){
        remainedTime = remainedTime == 0 ? 60 : self.remainedTime
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        audioManager?.play()
        isPlaying = true
        
        if showPopUp {
            showPopUp.toggle()
        }
    }
    
    func timeString(time:Int) -> NSMutableAttributedString {
        //        "\(remainedTime/60):\(String(format: "%02d", remainedTime%60))"
        let minutes = String(format: "%02d", time/60)
        let seconds = String(format: "%02d", time%60)
        
        let timeAttributedString = NSMutableAttributedString(string:"\(minutes)")
//        let font = UIFont.init(name: "Roboto-Regular", size: 14)
//        let font = UIFont.init(name: "NotoSansCJKkr-Light", size: 18)
//        let boldAttributes = [NSAttributedString.Key.font : UIFont.roboto(size: 38, family: .Regular)]
        let bold = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 38)]
        
//        let infoAttributes = [NSAttributedString.Key.font : UIFont.roboto(size:14)]
        let info = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        
        
        timeAttributedString.addAttributes(bold, range: NSRange(location: 0, length: 2))
        timeAttributedString.append(NSAttributedString(string: firewoodViewText3.toString(), attributes: info))
        timeAttributedString.append(NSAttributedString(string: "\(seconds)",attributes: bold))
        timeAttributedString.append(NSAttributedString(string: firewoodViewText4.toString(), attributes: info))
        
        return timeAttributedString
    }

}



extension UIFont {
    
    enum Family: String {
        case Black, Bold, Light, Medium, Regular, Thin
    }
    
    static func roboto(size: CGFloat = 10, family: Family = .Regular) -> UIFont {
        return UIFont(name: "Roboto-\(family)", size: size)!
    }
}


