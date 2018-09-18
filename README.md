## The Well-Grounded Rubyist, Second Edition
###### by David A. Black

#### Notes by Henry

Chapter 1 - Bootstrapping your Ruby literacy

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

Chapter 2 - Objects, methods, and local variables

* 
