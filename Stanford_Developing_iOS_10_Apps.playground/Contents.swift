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







//Interview Questions & notes:



//Grokking notes:
//Explain what Divide & Concur does? Divide and conqure is a way to think of a solution to a problem. First you determine the base case (simple case). Then you create a repeatable action (recursion) to reach the base case.
//NOTE: Often when writing a recursive function involving arrays, the base case is often an empty array or an array with only one element

//sum up an array using recursion
//func sum(_ arr: [Int]) {
//    //base case (simplest case)
//    if arr.isEmpty {
//        print(0)
//    } else {
//        //add the first element with
//        print(arr[0] + sum(arr.remove(at: 0)))
//    }
//}
//sum([1,2,3])

//func factorial(_ value: Int) -> Int {
//    if value == 0 {
//        return 1
//    }
//
//    return value * factorial(value - 1)
//}
//factorial(3)

//var list1 = [1,2,3]
//var list2 = list1.remo



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












