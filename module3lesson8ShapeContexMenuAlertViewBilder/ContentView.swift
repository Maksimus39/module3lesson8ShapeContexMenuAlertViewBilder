import SwiftUI

struct ContentView: View {
    @State private var isShowError: Bool = false
    @State private var isShowSheet: Bool = false
    @State private var isCircleOn: Bool = false
    
    var body: some View {
        VStack(spacing: 30) {
            Circle()
                .stroke(lineWidth: 10)
            // .modifier(ShapeStyle(color: .brown,
            //                                     widthArgument: 90,
            //                                     heightArgument: 90))
            
                .setShape(color: .green, widthArgument: 60, heightArgument: 70, isOn: $isCircleOn)
            
            Rectangle()
                .stroke(lineWidth: 10)
                .frame(width: 50, height: 50)
                .foregroundStyle(.red)
            
            // Показываем состояние для наглядности
            Text("Circle is: \(isCircleOn ? "ON" : "OFF")")
                .foregroundColor(isCircleOn ? .green : .red)
            
            
            Button {
                isShowSheet.toggle()
            } label: {
                Text("Show alert")
            }
            .alert("Alert", isPresented: $isShowError) {
                Button("Close", role: .destructive) {
                    //
                }
            }
            .sheet(isPresented: $isShowSheet) {
                Text("Alert")
                    .presentationDetents([.height(399)])
            }
            
            
            
            //            .actionSheet(isPresented: $isShowSheet, content: {
            //               ActionSheet(title: Text("Hello"))
            //            })
            
            //            ForEach(0...10, id: \.self){ item in
            //                Text("Tap me")
            //                    .contextMenu {
            //                        Button {
            //                            //
            //                        } label: {
            //                            HStack{
            //                                Image(systemName: "trash")
            //                                Text("Delete")
            //                            }
            //                        }
            //
            //                    }
            //            }
            
            
            createField(name: "Maksim")
            createField(name: "Maksim")
            
        }
    }
    
    @ViewBuilder
    private func createField(name: String) -> some View {
        VStack {
            Text(name)
            TextField("", text: .constant("stop"))
        }
    }
}

// Для Shape (фигур)
struct ShapeStyle: ViewModifier {
    var color: Color
    var widthArgument: CGFloat
    var heightArgument: CGFloat
    @Binding var isOn: Bool
    
    func body(content: Content) -> some View {
        content
            .frame(width: widthArgument, height: heightArgument)
            .foregroundStyle(color)
            .onTapGesture {
                isOn.toggle()
            }
    }
}

extension View {
    func setShape(color: Color, widthArgument: CGFloat, heightArgument: CGFloat, isOn: Binding<Bool> ) -> some View {
        self.modifier(ShapeStyle(color: color, widthArgument: widthArgument, heightArgument: heightArgument, isOn: isOn))
    }
}


#Preview {
    ContentView()
}
