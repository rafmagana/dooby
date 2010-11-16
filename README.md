dooby
=====

A **very simplistic** command-line to-do/note list manager in Ruby.

Why another to-do list manager?
----

I spend a lot of time in the terminal and I haven't liked any of the current options.

How does Dooby works?
---------------------

### A bunch of lists
Dooby can handle one list per directory.

For instance, I use one to-do list per project, that way I don't have all the items in one place so I can get focused in just one set of items, in one context.

### A bunch of tags
#### #tag #tag and #tag again and tell @jim :now to #tag everything in his %life as well

Dooby uses some special characters to visually help us to differentiate between things and let us search items very easily, the ones that you might recognize are **@** and **#**, I stole the idea from Twitter, but of course they don't behave as in Twitter, the **@** sign is not an username but a character to tag a person, that's all, nothing else (so far).

People

	@peter, @john, @jim

Contexts (states of mind, mood, places, etc)
	
	#today, #tomorrow, #urgent
	
	#work, #home
	
	#thinking, #sad

Item sets (for objectives that takes more than one task to achieve)

	%fix_computer, %shopping_list, %subproject, %today
	
As you can see we can use % as if it were #, I mean, as a context, this is because most of these tags are meaningless to Dooby, she (yes, she's a woman) isn't aware of them, Dooby is aware only of some of them:

	#today
	#urgent
	#tomorrow
	:doing

#### #today and #urgent (**not %today, not %urgent**)
All the items tagged with *#today* and *#urgent* will be shown in a special section every time you list your to-dos/notes.

#### #tomorrow
It will be converted into tomorrow's date and marked with the tag *#today* at the next day.
Say today is November, 2 2010, and you create an item like this:

    I need to #fix the #bug #tomorrow

Dooby will save it as

    I need to #fix the #bug {Nov/03/2010}

Now say today is November, 3 2010, Dooby will show it like this:

    I need to #fix the #bug #today

Of course it'd be shown in the TODAY section.

#### :doing
The item tagged as **:doing** will be the *current item* and some commands will affect it or use it without specifying an item id.

Basic Usage
-----------

NOTE: All the commands have a shortcut, which is the first or two first letters of it.

First of all, create an alias if you want to save some keystrokes:

	$ alias d='dooby'

### Initializing Dooby

	$ d init
	$ d i

This creates a **.dooby/list.yml** file in the current directory. Dooby will save all the items in it.

### Adding items

	$ d add "#fix the email error in %website, check this out with @peter #today"
	
	$ d a "learn to use the #aliases of the #commands"
	
	$ d a "#pair with @jim on the %tickets module"

### Listing items

Try the following commands once you create the items above:

	$ d list @peter

	$ d l today
	
	$ d l "#today"
	
	$ d l %website
	
	$ d l @

	$ d l %
	
#### Listing items interactively (use q or ctrl-c to interrupt)
	
You can use the [TAB] key to autocomplete tags

	$ d il
	
	> #t[TAB]oday
	Showing items containing: #today
	 (393415)  #fix the email error in %website, check this out with @peter #today
	 (9cfbf4)  Need to go to the #doctor @hendrix #today
	
	> #doctor
	Showing items containing: #doctor
	(9cfbf4)  Need to go to the #doctor #today
	
	> email
	Showing items containing: email
	(393415)  #fix the email error in %website, check this out with @peter #today

**Note:** Dooby uses SHA1 as Item ID.

#### Listing all the hashtags you have used

	$ d l#
	#today
	#doctor
	#fix
	#pair
	
#### Listing all the people you have tagged
	
	$ d l@
	@peter
	@hendrix
	@jim

#### Listing all the item sets

	$ d l%
	%website
	%tickets

### Editing items (use q or ctrl-c to interrupt)

**Dooby** supports autocompletion of item IDs in the *delete*, *bulkdelete* and the *edit* commands as well.

	$ d edit	
	Item ID > b[TAB]954bf

now press Enter and [TAB] again if you want the original text of the item:

	$ d e
	Item ID > b954bf
	TAB or up arrow to edit > [TAB]#fix the email error in %website, check this out with @peter #today

Edit it and press Enter and the item will be saved.

	$ d e
	Item ID > b954bf
	TAB or up arrow to edit > #fix the email error in %website #today
	
### Deleting items (use q or ctrl-c to interrupt)

	$ d delete
	Item ID > 5[TAB]21a3d
	
**Note:** the *SHA1* of the item we edited previously has changed because it's based on the content

	$ d d
	Item ID > 9cfbf4
	9cfbf4 deleted...

**Dooby** won't ask you if you really really want to delete the item.

	$ d l
	Showing all items...
	 (c733ff)  #fix the email error in %website #today

### Bulk delete

If you want to delete all the items containing an exact tag or set of tags or a tag starting with some text you can use bulk delete to do so. This feature will delete only by tag, not simple text, actually if you enter simple text it will simply ignore it.

Bulk delete supports auto-completion too. Say you want to delete all the items containing @hendrix AND #today.

	$ d bulkdelete
	What do you want to bulk delete?
	> #t[TAB]oday @h[TAB]endrix

What if you want to delete all the items containing a tag starting with **#ma** like *#mac*, *#manual*, and *#macro*?, simple:

	$ d b
	What do you want to bulk delete?
	> #ma [ENTER]

That's it

### Deleting all the items
	
	$ d flush
	Sure??? (yes/no)
	yes
	All the items were deleted!

### Deleting the **.dooby** directory (list.yml included, of course)

	$ d trash
	Sure??? (yes/no)
	yes
	No more dooby here T_T
	
## The current item (item tagged with **:doing**)

### Use an item as commit message (git)

Let's say we add a task we need to get done:

    $ d a "#fix the bug in cart :doing"

and that once we get the task done we want to commit the fix:

	$ git add the_file
	
	$ d commit
	The commit message was #fix the bug in cart

	
## Help

You can check the help out using the -h flag

	$ d -h
	
	$ d t -h
	
	$ d l -h
	NAME
	  dooby

	SYNOPSIS
	  dooby list [what_to_show*] [options]+

	DESCRIPTION
	  Lists @people, #tags, %projects or items (default)

	PARAMETERS
	  what_to_show (-1 ~> what_to_show) 
	  --help, -h 

Ruby Versions
-------------

Dooby works on the following rubies:

* 1.8.7
* 1.9.1
* 1.9.2-rc2
* REE 1.8.7-2010.02
* JRuby 1.5.1 (Thanks to [jpoz](https://github.com/jpoz))

Known bugs
----------

* In Windows the text is shown with the color codes even installing the *win32console* gem

To Do
-----

* refactor List#find method, it must return a hash of items not the strings to show in terminal
* **$ dooby done** should tag the current item as *:done*
* Make it configurable through an external file
* Get rid of special chars (@, #, %) when item is used as git commit message
* if item is tagged as *:doing* check if there are others tagged with the same tag, if so, tag them with *:hold*
* Hide items tagged as *:hidden*
* Only show items not containing the specified word(s)

Special Thanks
--------------

Most of the the ideas to code **dooby** were based on the work of other programmers, here's a list of all of them:

**Gina Trapani** ([http://github.com/ginatrapani/todo.txt-cli](http://github.com/ginatrapani/todo.txt-cli "todo.txt-cli"))  
**Lakshan Perera** ([http://github.com/laktek/todo](http://github.com/laktek/todo))  
**Scott Chacon** ([http://github.com/schacon/ticgit](http://github.com/schacon/ticgit))

Thanks all of you!

Note on Patches/Pull Requests
-----------------------------
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

Copyright
---------

Copyright (c) 2010 Rafael Magana. See LICENSE for details.