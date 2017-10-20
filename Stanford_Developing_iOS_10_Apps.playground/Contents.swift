//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

//Notes from Stanford's Developing iOS 9 Apps course



//What's an API? Functions & methods used to make an iOS app work
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

