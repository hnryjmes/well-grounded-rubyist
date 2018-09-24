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

* n.times, each, map

* exceptions, errors

* begin, rescue

* rescue inside a method or code block: if no begin keyword, assumption that rescue clause applies to the entire method or block

* raising specific exceptions, re-raising an exception

* ensure

* creating your own exception classes inheriting from StandardError

* Summary: Conditionals (if/unless and case/when) / Loops (loop, for, while, and until) / Iterators and code blocks, including block parameters and variables / Examples of implementing Ruby methods in Ruby / Exceptions and exception handling

Chapter 7 - Built-in essentials (pp. 191 - 217)

* Literal object constructors / Syntactic sugar / "Dangerous" and/or destructive methods / The `to_*` family of conversion methods / Boolean states and objects, and `nil` / Object-comparison techniques / Runtime inspection of objects' capabilities

* literal constructors: making the object through syntax rather than a call using Object.new, e.g. `new_string = "new string"` and not `String.new`

* "If you define a + method for your class, then objects of your class can use the sugared syntax for addition."

* bang methods and danger: `exit` vs `exit!`, `sort` vs `sort!` etc

* bang methods should be made as a pair

* `to_s`, `to_sym`, `to_a`, `to_i`, `to_i`

* the * operator and bare lists: useful for things like turning an array into some arguments

* Ruby doesn't convert things automatically

* booleans and truthiness

* nil and non-objectness

* comparability, inspection

* listing an object's methods with .methods

* you can be more specific: instance_methods, private_methods etc

* Summary: Ruby's literal constructors / Syntactic sugar converting methods into operators / "Destructive" methods and bang methods / Conversion methods (`to_s` and friends) / The `inspect` and `display` methods / Boolean values and Boolean objects / The special object `nil` / Comparing objects and the Comparable module / Examining an object's methods

Chapter 8 - Strings, symbols, and other scalar objects (pp. 219 - 252)

* String object creation and manipulation / Methods for transforming strings / Symbol semantics / String/symbol comparison / Integers and floats / Time and date objects

* A scalar is a one-dimensional thing

* escaping characters in strings, percent signs

* ord method on string for ordinal code

* chr method to go from int to char

* equality: equivalent object vs literally the same object

* encoding strings and UTF-8

* symbols, immutabililty, and uniqueness

* Ruby includes all symbols in a table which you can then look up!

* numerics, numeric objects

* ruby date package, time, DateTime

* built-in datetime formatting

* Summary: String creation and manipulation / The workings of symbols / Numerical objects, including floats and integers / Date, time, and date/time objects and how to query and manipulate them

Chapter 9 - Collection and container objects (pp. 254 - 285)

* Sequentially ordered collections with arrays / Keyed collections with hashes / Inclusion and membership tests with ranges / Unique, unordered collections with sets / Named arguments using hash syntax

* collections and containers

* arrays, hashes, range, set

* "An array's job is to store other objects."

* hashes behave similarly to arrays if you use sequential integer indexes

* create arrays in many ways... Array.new, literal, Array() method, special % notation

* shifting and unshifting, concat, push, flatten, uniq

* creating a hash: literal, Hash.new, class method, top-level method

* combining hashes: when two share the same key, the second hash wins

* range (e.g. 1..100), range include

* ruby standard lib: sets

* set methods (for example, set intersection)

* superset, subset

* Summary: How to create, manipulate, and transform collection objects, including Arrays, Hashes, Ranges, Sets / Named arguments

Chapter 10 - Collections central: Enumerable and Enumerator (pp. 286 - 328)

* Mixing Enumerable into your classes / The use of Enumerable methods in collection objects / Strings as quasi-enumerable objects / Sorting enumerables with the Comparable module / Enumerators

* collection-related behaviours, the enumerable module

* mixed in enumerable methods

* searching, finding, filtering, select, reject

* find_all

* grep can take a block! meaning it works a bit like enumerable.select and enumerable.map simultaneously

* enumerable classes and the last method

* take and drop methods

* the each family: reverse_each, each_with_index, each_slice, etc

* difference between map and each is what they return!

* be careful...

```
array = [1,2,3,4,5]
result = array.map {|n| puts n * 100 }
```

* what will be the result?

```
[nil, nil, nil, nil, nil]
```

* why? the return value of puts is always nil.

* sorting enumerables, the <=> operator, sort_by

* Summary: The `Enumerable` module and its instance methods / Using `Enumerable` in your own classes / Enumerator basics / Creating enumerators / Iterating over strings / Lazy enumerators

* "It’s worth getting to know Enumerable intimately; it’s as powerful a unit of functionality as there is anywhere in Ruby."

Chapter 11 - Regular expressions and regexp-based string operations (pp. 330 - 359)

* Regular expression syntax / Pattern-matching operations / The `MatchData` class / Built-in methods based on pattern matching

* "Regular expressions in Ruby are objects. You send messages to a regular expression."

* "For every such pattern, every string in the world either matches the pattern or doesn't match it."

* the match method, the pattern-matching operator =~

* difference is what they return. the former returns an instance of class `MatchData`, the latter returns the numerical index of the first match.

* literal characters, dot wildcard, character classes

* square brackets: either or. `/[dr]ejected/` will match 'dejected' or 'rejected'

* square brackets with a range, e.g. `/[a-z]/`, `/[A-Fa-f0-9]/`

* negation with the `^` caret

* digit `\d`, digit/alphabet/underscore `\w`, whitespace/tab/newline `\s`

* for their negated forms, use uppercase. e.g. for any character that isn't a digit you would use `/\D/`

* "The capture notation allows you to isolate and save substrings of the string that match particular subpatterns."

* ? means zero or one of preceding char

* ruby automatically populates a series of variables giving access to submatches

* "The other technique for getting the parenthetical captures from a `MatchData` object is the `captures` method, which returns all the captured substrings in a single array."

* what about the ordering? count opening parentheses from the left

* named captures with <>

* more quantifiers: zero or more (`*`), one or more (`+`)

* greedy and non-greedy matching

* anchors, word boundary

* conditional matches

* modifiers

* "Going from regular expressions to strings is useful primarily when you're studying and/or troubleshooting regular expressions. It's a good way to make sure your regular expressions are what you think they are."

* common uses: scanning arrays, strings, `StringScanner` class

* sub and gsub, grep

* you can use the backslash notation (`\1 \2` etc) to refer to matches in replacement strings

* Summary: The underlying principles behind regular expression pattern matching / The `match` and =~ techniques / Character classes / Parenthetical captures / Quantifiers / Anchors / `MatchData` objects / String/regexp interpolation and conversion / Ruby methods that use regexps: `scan`, `split`, `grep`, `sub`, `gsub`

Chapter 12 - File and I/O operations (pp. 360 - 384)

* Keyboard input and screen output / The `IO` and `File` classes / Standard library file facilities, including `FileUtils` and `Pathname` / The `StringIO` and `open-uri` library features

* "The `IO` class handles all input and output streams either by itself or via its descendant classes, particularly `File`. To a large extent, `IO`'s API consists of wrappers around system library calls, with some enhancements and modifications.

* STDIN, STDOUT, STDERR

* file reading and writing with code blocks

* if you use an older Ruby way to access a file, you must remember to close the file after (i.e. using File.new instead of File.open with a code block)

* gets and getc (get string and get char)

* File.read, File.readlines (one outputs a string, one outputs an array of strings)

* files are enumerables, which means they support the each method

* checking whether a file exists with `FileTest`, the `entries` method and the `glob` technique

* `FileUtils`, `Pathname`

* Summary: I/O (keyboard and screen) and file operations in Ruby / File objects as enumerables / The `STDIN`, `STDOUT`, and `STDERR` objects / The `FileUtils` module, The `Pathname` module / The `StringIO` class / The `open-uri` module

Chapter 13 - Object individuation (pp. 389 - 416)

* Singleton methods and classes / Class methods / The `extend` method / Overriding Ruby core behavior / The `BasicObject` class

* how does Ruby allow objects to acquire methods and behaviours on a per-object basis?

* "The ability to define behavior on a per-object basis is one of the hallmarks of Ruby's design."

* pass-through methods: calling an old and new version of a method simultaneously (e.g. one outputs to STDERR and the other to STDOUT) - could be useful for debugging

* Summary: Singleton classes and how to add methods and constants to them / Class methods / The `extend` method / Several approaches to changing Ruby's core behavior / `BasicObject` and how to leverage it

Chapter 14 - Callable and runnable objects (pp. 418 - 454)

* `Proc` objects as anonymous functions / The `lambda` method for generating functions / Code blocks / The `Symbol#to_proc` method / Method objects / Bindings / The `eval` family of methods / Threads / Executing external programs

* "This chapter is about objects that you can call, execute, or run: threads, anonymous functions, strings, and even methods that have been turned into objects."

* procs and lambdas

* procs: wrapping a code block in an object

* "Conversion between blocks and procs is easy - which isn't too surprising, because the purpose of a code block is to be executed, and a proc is an object whose job is to provide execution access to a previously defined code block."

* creation context and closures

* an object returned from lambda is of class Proc, i.e. a lambda can be thought of as a lambda-flavoured proc

* lambdas differ from procs in how they handle the return keyword

* other ways to call a Proc: square brackets, dot + parentheses

* eval and arbitrary code execution, dangers

* using threads and fibers: useful for timeouts, uncertain file operations, network stuff

* date server and chat server

* thread keys

* system calls

* Summary: `Proc` objects / The `lambda` "flavor" of process / Code block-to-proc (and reverse) conversion / `Symbol#to_proc` / Method objects / Bindings / `eval`, `instance_eval`, and `class_eval` / Thread usage and manipulation / Thread-local "global" variables / The `system` method / Calling system commands with backticks / The basics of the `open` and `Open.popen3` facilities

Chapter 15 - Callbacks, hooks, and runtime introspection (pp. 456 - 485)

* Runtime callbacks: `inherited`, `included`, and more / The `respond_to?` and `method_missing` methods / Introspection of object and class method lists / Trapping unresolved constant references / Examining in-scope variables and constants / Parsing caller and stack trace information

* 
