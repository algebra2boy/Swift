## GuessTheFlag


## Notes
    -  Stacks 
        - VStack(spacing: <number>) or VStack(alignment: .leading)
        - HStack(spacing: <number>) or HStack(alignment: .leading)
        - ZStack {} or ZStack(alignment: .top)
    -  VStack can have a maximum of 10 children
    - To a construct a frame with sizes
        - Color.red
                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
        - Color.red
                .frame(width: 200, height: 200)
    - Set up a color based on user's setting
        - Color.primary or Color.secondary 
    - This ensures the stack view color go out of safe area (top and buttom)
        - ZStack { 
            Color.red
            Text("Your content")
        }.ignoresSafeArea() 
    - Gradients: colors like views that can be drawn in the UI
        - LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
        - LinearGradient(gradient: Gradient(stops: [
            .init(color: .white, location: 0.45),
            .init(color: .black, location: 0.55),
            ]), startPoint: .top, endPoint: .bottom)
        - radial gradients move outward in a circle shape
            - RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
        - cycle colors around a circle
            - AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
    - Button
        - Button("Delete selction") {
            print("Now deleting")
        }
        - Button("Delete selction", role: .cancel, action: executeDelete)
          func executeDelete() {
            print("Now deleting")
          }
        - Button("Button 1") {}
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) {
            }
            .buttonStyle(.bordered)
            Button("Button 3") {}
                .buttonStyle(.borderedProminent)
            Button("Button 4", role: .destructive) {}
                .buttonStyle(.borderedProminent)


