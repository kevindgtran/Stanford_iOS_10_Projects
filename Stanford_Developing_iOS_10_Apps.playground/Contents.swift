//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

//Notes from Stanford's Developing iOS 9 Apps course



//What's an API? Collection of functions & methods. In an app the API is all the functions and methods we create in the "brain" - Model of the app
//What operating system does an Iphone run? UNIX
//What makes up a computer? CPU "Brain", RAM "Memory", Hard Disk "Instructional/ Data"
//How does a computer work? CPU reads information from the hard disk and brings it to the RAM, this is done b/c before the CPU can do any kind of processing, calculations, computations it has to be brought to the RAM. After the CPU has modified the data it is then stored back onto the hard disk
//What is an operating system? OS/Controls all the parts of a computer, hardware and software. Allocates resources and schedules tasks
//What are the main components of iOS (Top - user to Bottom - hardware)? Cocoa Touch, Media, Core Services, Core OS
//What are the 5 states of a UIButton? The five states that define their appearance: default, highlighted, focused, selected, and disabled
//What is MVC? Model(data/brains), View(minions/user interface objects. ie UILabels), Controller(communicator between the model and view. ie IBOutlets)
//How does the view communicate back to the controller? The view "minions" send back an action to the target
//View objects can synchronously communicate with the controller with keywords like (will, should, did, etc.) This gives more options for control on the view objects. These "special" methods are executed with Delegates. Delegates are special variables of a protocol type. So the controller signs up to be the delegate and listen for those special methods from the view. Delegates are all about communication between views and controllers
//Views do not own the data they display. What does that mean? The data displayed on the view should not be stored in the view objects. ie the UITableView object (view) should not own all the possible data put into it (potentially thousands of songs). Instead we use another special protocol variable called DataSource. Datasource has other sets of methods to find and retrieve data from the model and display them on the view object (ie a table view with millions of songs). NOTE: Controllers are always the Datasource not the model
//How does the model communicate changes to the data to the controller? The model broadcasts changes to the controller (like a radio station). Then the controller checks what changes were made.
//Where can we have the MVC architecture in an app? The MVC architecture can be the whole app, on each page, on sub sections of a page, etc.
//Whats the difference between Classes vs Structs? Class are reference types and structs are value types. Classes live in the heap and have pointers to them. Structs don't live in the heap and are passed around by copies. Class objects reference back to the same object in memory as structs are copies. Classes can subclass and thus have inheritance. Most objects in swift are structs ie strings, ints, etc. Structs properties also get a "free" initializer for all uninitialized values. Class properties have to be initialized with either a value or with the initializer method. B/C structs are copies, if we create methods that change values within the struct, we need to tell swift this copy can change/ mutate with the mutating keyword
//How do you make a variable read-only? Make it a computed property with a getter only. We do this by excluding the set block. The variable's get value can be access through dot notation
//What is a module? A stand alone group of source files. ie a framework or an application is a module. Modules can be imported into another module with the "import" keyword
//what is a source file? A single file in a module that can contain multiple class definition, variables, methods, etc.
//What does the private keyword do? The private keyword has to do with access control (access controll relative to the source file in which the code is in) - controlling how much access is given for different parts of code. Declaring a private variable means it's only accessible from within that source file.




//Interview Questions & notes
//What is a UIViewController? The infrastructure for managing views of our UIKit(iOS) app. It manages the views, the loading/ disposing and their interactions with other views.
//What is the viewController Lifecycle? A UIViewController subclass inherites methods that manage its view hierarchy. iOS automatically calls these methods at appropriate times when a view controller transitions between states. It's important to understand these methods to create custom setup/ tear-down behavior when these methods occur & are called
//loadView() - Creates the view that the controller manages
//viewDidLoad() - Called after the controller's view is loaded into memory
//viewWillAppear() - notifies the view controller that its view is about to be added to a view hierarchy
//viewWillLayoutSubviews() - called to notify the view controller that its view is about to layout its subviews
//viewDidLayoutSubviews() - called to notify the view controller that its view has just laid out its subviews
//viewDidAppear() - Notifies the view controller that its view was added to a view hierarchy
//viewWillDisappear() - Notifies the view controller that its view is about to be removed from a view hierarchy
//viewDidDisappear() - Notifies the view controller that its view was removed from a view hierarchy







