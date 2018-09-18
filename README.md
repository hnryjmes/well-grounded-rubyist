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

* 
