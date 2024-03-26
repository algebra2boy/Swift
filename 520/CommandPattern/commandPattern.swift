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

public class AddColorCommand: Command {
    
    // The shape object that the command will be executed on
    private var shape: Shape

    // The color of the shape
    private var color: String

    // the old color of the shape
    private var oldColor: String
    
    // The constructor that takes the shape object
    public init(shape: Shape, color: String) {
        self.shape = shape
        self.color = color
        self.oldColor = shape.color
    }
    
    // The execute method that draws the shape
    public func execute() {
        shape.addColor(color: color)
    }
    
    // The undo method that does nothing
    public func undo() {
        print("Undoing the add color command")
        shape.addColor(color: oldColor)
    }
}

// An interface for shape
public protocol Shape {

    // The x and y position of the shape
    var x: Double { get }
    var y: Double { get }

    // The color of the shape
    var color: String { get }

    // The move method that moves the shape to the new position
    func move(toX x: Double, toY y: Double)

    // The draw method that draws the shape
    func draw()

    // the add color method that adds color to the shape
    func addColor(color: String)

}

// A circle class that implements the shape interface
public class Circle: Shape {

    // The x and y position of the circle
    public var x: Double
    public var y: Double

    // The color of the circle
    public var color: String

    // The constructor that takes the x and y position of the circle
    // default color is black
    public init(x: Double, y: Double, color: String = "black") {
        self.x = x
        self.y = y
        self.color = color
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

    public func addColor(color: String) {
        print("The color of the circle has been changed to \(color)")
        self.color = color
    }
}

func main() {
    // an array to keep track of all command history
    var commandHistory: [Command] = []
    
    // declare a circle shape
    let circle = Circle(x: 10, y: 10)
    
    print("adding moving command 1")
    // manually specify the first move command with the circle object and the new position
    let moveCircleCommand_1 = MoveCommand(
        shape: circle, 
        X_pos: 80, 
        Y_pos: 30)
    
    // exectute the move command
    moveCircleCommand_1.execute()
    circle.getPosition()
    
    // add the move command to the history
    commandHistory.append(moveCircleCommand_1)
    
    // draw the circle
    circle.draw()

    print("\nadding moving command 2")
    // manually specify the second move command with the circle object and the new position
    let moveCircleCommand_2 = MoveCommand(
        shape: circle, 
        X_pos: 100, 
        Y_pos: -20)
        
    // exectute the move command
    moveCircleCommand_2.execute()
    circle.getPosition()
    
    // draw the circle
    circle.draw()
        
    // add the move command to the history
    commandHistory.append(moveCircleCommand_2)

    // undo the last command
    print("\nundo moving command 2")
    if let lastCommand = commandHistory.popLast() {
        lastCommand.undo()
        circle.getPosition()
    }
    
    // undo the last command
    print("\nundo moving command 1")
    if let lastCommand = commandHistory.popLast() {
        lastCommand.undo()
        circle.getPosition()
    }

    // add a olor to the circle
    print("\nadding color command to red")
    let addColorCommand1 = AddColorCommand(
        shape: circle, 
        color: "red")
    addColorCommand1.execute()

    commandHistory.append(addColorCommand1)

    // add second color to the circle
    print("\nadding second color command to blue")
    let addColorCommand2 = AddColorCommand(
        shape: circle, 
        color: "blue")
    addColorCommand2.execute()

    commandHistory.append(addColorCommand2)


    // undo the last command
    print("")
    if let lastCommand = commandHistory.popLast() {
        lastCommand.undo()
    }

    if let lastCommand = commandHistory.popLast() {
        lastCommand.undo()
    }
    print("circle color has been back to default black")
}

main()
