//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Foundation

//Notes from Stanford's Developing iOS 9 Apps course

//View objects can synchronously communicate with the controller with keywords like (will, should, did, etc.) This gives more options for control on the view objects. These "special" methods are executed with Delegates. Delegates are special variables of a protocol type. So the controller signs up to be the delegate and listen for those special methods from the view. Delegates are all about communication between views and controllers

//Views do not own the data they display. What does that mean? The data displayed on the view should not be stored in the view objects. ie the UITableView object (view) should not own all the possible data put into it (potentially thousands of songs). Instead we use another special protocol variable called DataSource. Datasource has other sets of methods to find and retrieve data from the model and display them on the view object (ie a table view with millions of songs). NOTE: Controllers are always the Datasource not the model

//what are the fundamental data structures of Swift? Classes, Structs, Enums, & Protocols

//what does functional programming? Functional Programming is a programming model that avoids state and mutable data. "Functional programming promotes code with no side effects, no change of value to variables and objects" - Structs instead of Classes

//what do the override and final keywords do? override allows us to override inherited methods. final = that object class or method can't be over written

//How do we access a type method? What does that mean? A type method is a method that's associated with that type itself, they're declared using the "static" keyword. We dont need an instance of it to access its values. examples are UIColor.green, UIColor.red, etc.

//what are property observers? Property observers allow us to execute code when a property changes, it uses willSet and didSet blocks

//what does the keyword "lazy" mean? That the object won't be fully initialized till it is accessed. This is helpful to avoid costly operations or when objects need to be fully initialized before they can me used

//what is userdefaults? Essentually is a tiny database that persists between app launches

//what is a closure? It allows us to just write the essentials of a function right in line, so we don't have to write a function and call it else where. It's an unnamed function that has special abreviated $ symbols that help make it extremely concise. Closures are great because we can pass to methods when something is complete, when something is animated, when something gives an error. Closures are extremely powerful

//What notations can integer literals be written in? standard decimal notation, binary notation, hexadecimal notation, octal notation

//What is numeric padding mean? Adding extra zeros/ underscores to integer literals, to help with readability. This doesn't change the integer value

//What do type aliases do? Type aliases allow us to declare an alternative name for a type. It's helps with readability.

//Can Tuples return values of different types? Yes, Tuples combine multiple values of any types into one compound value.

//What does Unicode mean? Unicode is the international representation of characters, you can represent every character in any language through unicode. Swifts string and character types are fully unicode compliant

//Functions that have multiple returns, returns what? A tuple!

//What's a view? view is a subclass of UIView, essentially the rectangular area on the screen with touch events such as drawing and gestures. Views are in a hierarchy - done in Interface Builder. OR done programmatically using (addSubview/ removeFromSuperView). Views are the fundamental building blocks of the apps user interface. Renders content within its bounds rectangle. To display labels, images, buttons, etc. we use subclasses provided in UIKit framework

//Whats the superview refer to? When we nest a view inside another view. This creates a view hierarchy and parent-child relationship between the child view being nested (subview) and the parent view (superview). When a childs view extends beyond the superviews visible area, there is no clipping of the subviews content - use clipsToBounds to fix this behavior

//What do the frame and bounds of a view? The frame property defines the origin and dimensions of the view in the coordinate system of its superview. The bounds property of a view defines te internal dimensions of the view - almost exclusively for custom drawing code

//Whats CGFloat? Core Graphics Float type, ALWAYS used when working with UIView's coordinate system

//Whats CGPoint? A struct that contains a point on the coordinate system, two CGFloats for the x and y values

//Whats CGSize? A struct that contains the width and height values, two CGFloats for the width and height

//Whats a CGRect? A struct that has 2 GFloats, the CGPoint and CGSize

//Whats the difference between a views bounds, frame and center? The bounds are the views internal drawing space. the Frame is the rect containing a UIView in its superview's coordinate system. Center is the center of the UIView in its superview's coordinate system

//How do we implement the draw(_ CGRect) method? We create a path using the UIBezierPath

//Explain UIBezierPath - path that consists of straigh and curved line segments that can be rendered within our view. UIBezierPath object combines the geometry and a path with attributes that describe the path during rendering. After we've configured the BezierPath the way we want it, we tell it to draw itself in the current view.

//How do you make a UIColor transparent programmatically? Calling the withAlphaComponent() method on the UIColor type method and passing in a value from 0-1 (0 = fully transparent, 1 = opaque)

//What do IBDesignable and IBInspectable do? Allow us to see the changes in real time in interface builder

//Describe Property Observers? Execute code whenever a properties values change even if its changing to the same value. We declare them with the willSet and didSet observers

//what are type properties? Properties that belong to the type itself rather than instance properties. This type property will only ever have one value no matter how many instances are created. So they're "universal values". They're declared with the "static" keyword

//Whats the difference between the Gyroscope vs. Accellerometer? Gyroscope = orientation(direction), Accellerometer = velocity (speed)

//what does the final keyword do? It makes the class, method or property unable to be overrided when subclassed

//Whats initialization? The process of getting an instance of a class, struct, enum ready to use. This process involves setting initial values with special "initializer methods". All classes and structs must set all their properties to initial values in order for an instance to be created

//When assigning a closure or function to a stored property, what do the empty parenthesis after the curly brackets mean? The empty parenthesis tell swift to execute the closure immediately after the instance is initialized and to assign the return value to the stored property

//What is the difference between as? and as! As refers to downcasting, because the type may or may not be there, its either optional and empty with returns nil. Or we can force unwrap it - only if we are certain the type is present

//What is the "is" keyword? It checks the type if it is a certain type

//Public API within app - Any dynamic code that isn't private




//////////////////////////////

//Grokking notes:
//Explain what Divide & Concur does? Divide and conqure is a way to think of a solution to a problem. First you determine the base case (simple case). Then you create a repeatable action (recursion) to reach the base case.
//NOTE: Often when writing a recursive function involving arrays, the base case is often an empty array or an array with only one element

/////////////////////////////


//CTCI notes:
//what is Big O time? The language and metric we use to describe the efficiency of an algorithm
//Why is it so important to understand Big O notation? It is crucial to understand the efficiency of your algorithms and understand when its getting faster or slower
//What does FTP stand for? File Transfer Protocol - a standard for transfering files over the internet
//NOTE: The "best" solution may have many factors, all depends on the factors
//What does linear time mean O(n)? The time increases at a consistent ratio with regards to the size of (n) input (ex. takes 1 min for every terabyte of data to transfer... 100 terabytes would take 100 minutes)
//What does constant time O(1) mean? That the time is consistent 1 factor with regards to the the amount of (n) input size (ex. a plane trip is a generally fixed time, and doesn't matter how big a file you're transfering)
//NOTE: no matter the constant time, linear time will eventually take longer as (n) input increases. DUH!
//NOTE: there could be multiple variables in our runtime (ex. painting a wall of width and height == O(WH))
//NOTE: Operating on all the elements in an array is O(N), as the number of elements in the array can vary
//Explain Quicksort: Quicksort randomly picks a number in a collection as the "pivot", it then iterates through the elements swapping elements, elements that are less then the pivot get put the the left side, elements that are greater, on the right side. This creates a partially sorted array. Then recursively sorts the left and right side using a similar process. Worse case we'd have to repeat going through the entire array the number of elements in the array! O(N^2)
//NOTE: When determining Big O, drop the number of operations within iterations and just count the number of iterations. (drop the constants).
//When do you multiply vs add Big O notation variables O(A + B) vs O(A * B)? If the alforithm has 2 parts, finishes one part completely then does another part then its add. If first part says to said operation on all of second part then its multiplication.
//What is the usually runtime of an algorithm that's inputs get halved each time? O(log N). log is the opposite of exponents and that's what log base 2 is here. "2 to what power will equal N => 2^4 = 16 => log2 16 = 4 => O(log 16) => O(logN)"
//

///////////////////////////////////

//CS101 - Stanford
//computers = powerful + stupid
//code = instructions. Run = goes through and executes the instructions
//images = pixels of RGB scale. Every pixel has RGB values (each 0-255)
//

///////////////////////////////////
//Food Tracker App
//What does the app delegate do? The app delegate class creates the window where your app's content is drawn and provides a place to respond to state transitions. It creates an entry point to the app and a run loop that delivers input events to the app, this is done in the UIApplicationMain. Calling the UIApplicationMain function creates an application object, which is responsible for managing the life cycle of the app. Then launches the app.
//What property does the AppDelegate class have? It has only one, the window property. This optional property stores a reference to the apps window, which represents the root of the app's view hierarchy.
//What do all the methods in the AppDelegate do? These methods let the application object communicate with the app delegate. Each method is called automatically when the app states change
//What are the objects used to construct the user interface(UI) and display content to the user called? Views, they're the buttons, labels, etc. All view objects are of type UIView or one of its subclasses.
//Whats the relationship between the scene, view, viewcontroller? The scene represents one screen on the app and typically one viewcontroller. The viewcontroller manages a single content view with its hierarchy of subviews, and coordinates the flow of data from the data model (apps data) to the views. Views handle orientation changes, user input and navigation
//What do outlets do? They connect our interface objects with our source files
//NOTE: The weak keyword indicates that the reference does not prevent the system from deallocating the referenced object. Weak references help prevent reference cycles; however, to keep the object alive and in memory you need to make sure some other part of your app has a strong reference to the object. In this case, it’s the text field’s superview. A superview maintains a strong reference to all of its subviews. As long as the superview remains alive and in memory, all of the subviews remain alive as well. Similarly, the view controller has a strong reference to its content view—keeping the entire view hierarchy alive and in memory.
//When a view controller is loaded from a storyboard, the system instantiates the view hierarchy and assigns the appropriate values to all the view controller’s outlets. By the time the view controller’s viewDidLoad() method is called, the system has assigned valid values to all of the controller’s outlets, and you can safely access their contents.
//You only need an outlet to an interface object if you plan to either access a value from the interface object or modify the interface object in your code. In this case, you need to set the text field’s delegate property and set the label’s text property. You won’t be modifying the button, so there’s no reason to create an outlet for it.
//An action (or an action method) is a piece of code that’s linked to an event that can occur in your app. When that event takes place, the system execute’s the action’s code. You can define an action method to accomplish anything from manipulating a piece of data to updating the user interface. You use actions to drive the flow of your app in response to user or system events.
//In IBActions what does the sender argument represent? The sender represents the object responsible for triggering the action
//Explain the target-action design pattern? Design where one object sends a message to another object when a specific event occurs
//Whats does "first responder" mean? Means that object is the first in line to recieve app events. ie clicking on a uitextfield and the text field becomes the first responder and displays the keyboard - making it the first responder. After the user is done typing the "resignFirstResponder" needs to be called so the textfield object is no longer the firstResponder and next events can be routed to other objects
//How can we give views the some "control" capabilities of a control object (UIImage as a UIButton/ UISlider)? With Gesture recognizers - they're objects that can be attached to views and allow views to respond like control objects. Gesture recognizers interpret certain touches (swipe, pinch, rotation) then can execute certain actions based on that interpreted gesture touch





//Swift summit notes
//Parse - third party library (Cocoapod & github) that connects our app to the Parse cloud platform. Parse gives us tons of features like a backend, configuring servers, managing databases, writing API's, storing videos/ images, user authentication, deployment processes, sync data across platforms, user analytics, connect to third party integration, push notifications, etc.
//ARkit - Uses the camera and motion features to create augmented reality apps
//Server Side Swift - Server side (backend) of application written in swift. Some popular frameworks are Perfect & Vapor



//Cocoapods - staticly linked library?, binary?, Swift !=binary combatibility
//Fastlane
//PromiseKit
//couchbase
//serverless with swift
//keypaths?
//Equatable?
//UITesting
//GCD
//Codable, Encodable and Decodable protocols
//alamo fire + AFNetworking (SwiftyJSON + Gloss)
//Design patterns
//persisting data - localized storage
//Rendering images
//WWDC videos
//react-native









