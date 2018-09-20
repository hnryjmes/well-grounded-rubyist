## The Well-Grounded Rubyist, Second Edition
###### by David A. Black

#### Notes by Henry

Chapter 1 - Bootstrapping your Ruby literacy (pp. 3 - 33)

* A Ruby syntax survival kit / A basic Ruby programming how-to: writing, saving, running, and error-checking programs / A tour of the Ruby installation / The mechanics of Ruby extensions / Ruby's out-of-the-box command-line tools, including the interactive Ruby interpreter (irb)

* "This book will give you a foundation in Ruby, and this chapter will give your foundation a foundation."

* irb and irb simple

* basic operations: arithmetic, assignment, comparison, conversion

* basic i/o and control flow: print, get, conditionals

* special objects

* "...the Ruby convention is to use underscores rather than camel case when composing local variable names from multiple words - for example, first_name rather than firstName."

* instance variables start with a single (@) sign, e.g. `@age` and `@last_name`

* class variables start with two at signs, e.g. `@@running_total`

* global variables start with a $ sign, e.g. `$population`

* constants begin with an uppercase letter.

* method names are like local variables except they can end in ?, !, or =.

* in ruby everything is an object*. every object responds to messages. (* mostly)

* why double terminology? (e.g. 'calling the method' and 'sending the message') - because sometimes you might send a message intending to call a method but the object might not respond to it!

* sometimes a method call lacks an explicit receiver: e.g. `puts "Hello."`

* we're sending the message `puts` to an object: the default object `self`

* "The most important concept in Ruby is the concept of the object. Closely related, and playing an important supporting role, is the concept of the class."

* objects can adopt behaviours that their class didn't give them

* print vs puts

* interactive programs (keyboard input)

* reading and writing from file

* the Ruby installation

* Ruby standard library, C extensions, site ruby and vendor ruby, gems

* using extensions and libraries with `require` and `load`

* "If you tell people you've written a Ruby extensions, they'll probably assume you mean that it's in C."

* using require to access standard lib features

* using `require_relative`

* "...is convenient when you want to navigate a local directory hierarchy"

* out-of-the-box tools: ruby, irb, rdoc and ri, rake, gem, erb, testrb

* commonly used ruby command-line switches: -c (checks syntax), -w (warning messages), -e (executes code inline), -l (print newline after), -rname (require named feature), -v (show ruby version and verbose mode), --version (show version), -h (show all command-line switches) etc...

* check syntax and warnings together: `-cw`

* irb `--noecho` to not report return result

* using `ri` to request information

* rake: ruby-style make

* gem install and gem uninstall

* Summary: The difference between Ruby (the language) and `ruby` (the Ruby interpreter) / The typography of Ruby variables / Basic Ruby operators and built-in constructs / Writing, storing, and running a Ruby program file / Keyboard input and screen output / Manipulating Ruby libraries with require and load / The anatomy of the Ruby installation / The command-line tools shipped with Ruby

Chapter 2 - Objects, methods, and local variables (pp. 34 - 60)

* Objects and object orientation / Innate versus learned object capabilities / Method parameter, argument, and calling syntax / Local variable assignment and usage / Object references

* "Designing object-oriented software is largely a matter of figuring out what you want your objects to be: what they should do, how they'll interact with each other, how many of each there should be (for example, many students, one registrar), and other such questions."

* creating objects, defining methods

* the `return` keyword, making returns explicit

* using string interpolation

* generic object and basic object

* `send` and `__send__`, choosing a safe method call

* required and optional arguments, default values for arguments

* using the * in arguments

* invalid args

```
def broken_args(x, *y, z=1)
end
```

* "If you do this, it's a syntax error, because there's no way it could be correct. Once you've given x its argument and sponged up all the remaining arguments in the array y, nothing can ever be left for z."

* reference available for valid combinations of required, optional, default-valued arguments

* scoping and assignment

* Duping and freezing objects

```
def change_string(str)
  str.replace("New string content!")
end
s = "Original string content!"
change_string(s.dup)
puts s #=> "Original string content!"
```

* Freezing s before passing it into the above method would result in a RuntimeError ("can't modify frozen string"). There is no unfreeze method!

* Clone vs dup: if you clone a frozen object, the clone is also frozen.

* Freezing an array works, but (for example) a frozen array of strings could still be changed by using the String replace method on any individual string

* How Ruby decides what to do when it encounters a plain identifier: if it looks like a keyword, it's a keyword (e.g. `if`), if there's an equal sign, it's a local variable undergoing an assignment, otherwise, it's a method call.

* Summary: How to create a new object and define methods for it / The basics of the message-sending mechanism by which you send requests to objects for information or action / Several of the important built-in methods that every Ruby object comes with: `object_id`, `respond_to?`, `send` / Details of the syntax for method argument lists, including the use of required, optional, and default-valued arguments / How local variables and variable assignment work / Ruby's use of references to objects and how references play out when multiple variables refer to the same object

Chapter 3 - Organizing objects with classes (pp. 62 - 91)

* Creating multiple objects with classes / Setting and reading object state / Automating creation of attribute read and write methods / Class inheritance mechanics / Syntax and semantics of Ruby constants

* instance methods, singleton methods

* defining the same method twice

* "When you override a method, the new version takes precedence."

* how to avoid hard-coding values into every object?

* "Information and data associated with a particular object embodies the state of the object."

* Instance variables! Setter methods!

* "When you need to set or change an object's state at some point in your program other than the initialize method, the heart of the matter is assigning (or reassigning) values to instance variables. You can, of course, change any instance variable's value in any method. [...] But the most common case is the simplest: calling a setter method with an argument and setting the appropriate instance variable to the argument."

* by not putting everything in the initialize method, you make your code easier to read

* method names with equal signs in them: giving you the feeling that you're assigning something while still using a setter method

* Ruby's syntactic sugar for setter methods... these are equivalent:

```
ticket.price=(63.00)
ticket.price = 63.00
```

* the attr method family helps to avoid repetition when you write Ruby classes

* `attr_accessor` is read and write together

* inheritance, modules, the single inheritance principle

* choosing to send a message to the class rather than the instance

* constants

* Summary: How writing a class and then creating instances of that class allow you to share behaviors among numerous objects / How to use setter and getter methods, either written out or automatically created with the `attr_*` family of methods, to create object attributes, which store an object's state in instance variables / As objects, classes can have methods added to them on a per-object basis - such methods being commonly known as class methods, and providing general utility functionality connected with the class / Ruby constants are a special kind of identifier usually residing inside class (or module) definitions / Inheritance is a class-to-class relationship between a superclass and one or more subclasses, and all Ruby objects have a common ancestry in the `Object` and `BasicObject` classes / The superclass/subclass structure can lend itself to modeling entities in a strictly hierarchical, taxonomical way, but the dynamic qualities of Ruby objects (including class objects!) can offer less strictly determined ways of thinking about objects and how their behaviors might unfold over the course of their lives

Chapter 4 - Modules and program organization (pp. 92 - 117)

* Encapsulation of behavior in modules / Modular extension of classes / The object method-lookup path / Handling method-lookup failure / Establishing namespaces with modules and nesting

* "Like classes, modules are bundles of methods and constants."

* modules and mix-ins

* "To create instances (objects), you need a class, and to make those objects stacklike, you'll need to mix the Stacklike module into that class."

* "... `require` and `load` take strings as their arguments, whereas `include` takes the name of a module in the form of a constant."

* objects don't 'have' methods in as much as they 'have access' to methods

* method lookup: instance method, module mix-ins, superclass, superclass mix-ins etc.

* when two or more modules are mixed in, the most recent version of the method is searched first

* repeating the module more than once doesn't affect this...

```
class C
  include M
  include N
  include M
end
```

* N is considered the most recently included module

* prepend vs include: prepended module methods take priority over class methods

* the super keyword: choosing to execute the named method one level up in the lookup path

* "...class names tend to be nouns, whereas module names are often adjectives (Stack versus Stacklike)"

* while a class can only have one superclass (in Ruby), it can mix in as many modules as it wants

* you can nest a class inside a module

* Summary: Modules, up close and in detail / Similarities and differences between modules and classes (both can bundle methods and constants together, but modules can't be instantiated) / Examples of how you might use modules to express the design of a program / An object's-eye view of the process of finding and executing a method in response to a method, or handling failure with method_missing in cases where the message doesn't match a method / How to nest classes and modules inside each other, with the benefit of keeping namespaces separate and clear

Chapter 5 - The default object (self), scope, and visibility (pp. 119 - 151)

* The role of the current or default object, self / Scoping rules for local, global, and class variables / Constant lookup and visibility / Method-access rules

* "At every point when your program is running, there's one and only one self."

* this might be main, the class, the module, individual objects etc.

* "To know which object is self, you need to know what context you're in."

* you can't refer to main by 'main', you would have to grab it using the self keyword

* "Being self at a given point in the program comes with some privileges. The chief privilege enjoyed by self is that of serving as the default receiver of messages..."

* If you don't specify which object to send a message to, it gets sent to self

* scoping: global, local, class etc.

* "Creating your own global variables can be tempting, especially for beginning programmers and people learning a new language (not just Ruby, either). But that's rarely a good or appropriate choice."

* what happens when you have lots of objects? how do global variables perform then?

* "Globally scoped data is fundamentally in conflict with the object-oriented philosophy of endowing objects with abilities and then getting things done by sending requests to those objects."

* the top level, every class or module block, every method - has its own local scope

* a new local scope is created even when a process enters a recursion

* lookup paths, relative and absolute

* class variables are class-hierarchy scoped

* method-access rules: public, private, protected

* "A protected method is like a slightly kinder, gentler private method."

* private, but exemption for the case where the class of self and the class of the method call are the same or related by inheritance

* Summary: The rotating role of self (the current or default object) / Self as the receiver for method calls with no explicit receiver / Self as the owner of instance variables / Implications of the "classes are objects too" rule / Variable scope and visibility for local, global, and class variables / The rules for looking up and referencing constants / Ruby's method-access levels (public, private, protected) / Writing and working with top-level method definitions

Chapter 6 - Control-flow techniques (pp. 152 - 187)

* Conditional execution / Loops and looping techniques / Iterators / Exceptions and error handling

* if, else, elsif

* not, !, unless

* putting if statements at the end of a line

* case, when

* you can override the case/when logic if you want special behaviour as it is just a '===' condition in disguise

* if you don't specify anything after the case keyword, it returns at the first true statement in the list of whens

* loop codeblock, loop { }, loop do end

* exiting a loop: break, next

* while, until

* a loop is an iterator

* 
