import Foundation

// An interface for command
public protocol Command {

    // The execute method that executes the command
    func execute()

    // The undo method that undoes the command
    func undo()
}

// An move command class that implements the command interface
public class MoveCommand: Command {

    // The shape object that the command will be executed on
    private var shape: Shape
    
    // The current position of the shape
    private var X_pos: Double
    private var Y_pos: Double
    
    // The old position of the shape
    private var old_X_pos: Double
    private var old_Y_pos: Double

    // The constructor that takes the shape object and the new position
    public init(shape: Shape, X_pos: Double, Y_pos: Double) {
        self.shape = shape
        self.X_pos = X_pos
        self.Y_pos = Y_pos
        self.old_X_pos = shape.x
        self.old_Y_pos = shape.y
    }

    // The execute method that moves the shape to the new position
    public func execute() {
        shape.move(toX: X_pos, toY: Y_pos)
    }

    // The undo method that moves the shape back to the old position
    public func undo() {
        print("Undoing the move command")
        shape.move(toX: old_X_pos, toY: old_Y_pos)
    }
}

// An interface for shape
public protocol Shape {

    // The x and y position of the shape
    var x: Double { get }
    var y: Double { get }

    // The move method that moves the shape to the new position
    func move(toX x: Double, toY y: Double)

    // The draw method that draws the shape
    func draw()

}

// A circle class that implements the shape interface
public class Circle: Shape {

    // The x and y position of the circle
    public var x: Double
    public var y: Double

    // The constructor that takes the x and y position of the circle
    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }

    // The move method that moves the circle to the new position
    public func move(toX x: Double, toY y: Double) {
        self.getPosition()
        self.x = x
        self.y = y
        print("The Circle has been moved to \(self.x) and \(self.y)")
    }

    // The draw method that draws the circle
    public func draw() {
        print("A circle has been drawn")
    }

    // The getPosition method that gets the current position of the circle
    public func getPosition() {
         print("Current circle position is at (\(x), \(y))")
    }
}

func main() {
    // an array to keep track of all command history
    var commandHistory: [Command] = []
    
    // declare a circle shape
    let circle = Circle(x: 10, y: 10)
    
    // manually specify the first move command with the circle object and the new position
    let moveCircleCommand_1 = MoveCommand(shape: circle, X_pos: 80, Y_pos: 30)
    
    // exectute the move command
    moveCircleCommand_1.execute()
    circle.getPosition()
    
    // add the move command to the history
    commandHistory.append(moveCircleCommand_1)
    
    // draw the circle
    circle.draw()
    
    // manually specify the second move command with the circle object and the new position
    let moveCircleCommand_2 = MoveCommand(shape: circle, X_pos: 100, Y_pos: -20)
        
    // exectute the move command
    moveCircleCommand_2.execute()
    circle.getPosition()
    
    // draw the circle
    circle.draw()
        
    // add the move command to the history
    commandHistory.append(moveCircleCommand_2)

    // undo the last command
    if let lastCommand = commandHistory.popLast() {
        lastCommand.undo()
        circle.getPosition()
    }
    
    // undo the last command
    if let lastCommand = commandHistory.popLast() {
        lastCommand.undo()
        circle.getPosition()
    }
    
}

main()
