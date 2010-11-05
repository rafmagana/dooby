dooby
=====

A **very simplistic** command-line to-do/note list manager in Ruby.

Why another to-do list manager?
----

I spend a lot of time in the terminal and I didn't really like any of the current options.

How does Dooby works?
---------------------

### A bunch of lists
Dooby can handle one list per directory.

For instance, I use one to-do list per project, that way I don't have all the items in one place so I can get focused in just one set of items, in one context.

### #tag #tag and #tag again and tell @jim :now to #tag everything in his %life as well

Dooby uses some special characters to visually help us to differentiate between things and let us search items very easily, the ones that you might recognize are **@** and **#**, I stole the idea from Twitter, but of course they don't behave as in Twitter, the **@** sign is not an username but a character to tag a person, that's all, nothing else (so far).

People

	@peter, @john, @jim

Contexts (states of mind, mood, places, etc)
	
	#today, #tomorrow, #urgent
	
	#work, #home
	
	#thinking, #sad

Item sets

	%website, %shoppinglist, %whatever

Most of these characters are meaningless to Dooby, she (yes, she's a woman) isn't aware of them, Dooby is aware only of some of them:

	#today
	#urgent
	#tomorrow
	:doing

All the items tagged with *#today* and *#urgent* will be shown in a special section every time you list your to-dos/notes.

*#tomorrow* will be converted into tomorrow's date and marked with the tag *#today* at the next day.

The item tagged as **:doing** will be the *current item*, and some commands will affect it or use them for several purposes without specifying an item id.

Usage
-----

###Creating an alias

	$ alias d='dooby'

### Initializing Dooby

	$ d init

This creates a **.dooby/list.yml** file in the current directory. Dooby will save all the items on it.

### Adding items

	$ d add "#fix the email error in %website, talk to @peter #today"
	
	$ d a "learn to use the #aliases of the #commands"

### Listing items

	$ d list @peter

	$ d l today
	
	$ d l \#today
	
	$ d l "#today"
	
	$ d l %website
	
	$ d l @
	 > shows items related to people

	$ d l %
	 > shows all the items with a related task set
	
#### Listing items interactively (use q or ctrl-c to interrupt)
	
	$ d il
	
	> #today
	Showing items containing: #today
	 (b954bf)  #fix the email error in %website, talk to @peter #today
	 (9cfbf4)  Need to go to the #doctor @hendrix #today
	
	> #doctor
	Showing items containing: #doctor
	(9cfbf4)  Need to go to the #doctor #today
	
	> email
	Showing items containing: email
	(b954bf)  #fix the email error in %website, talk to @peter #today

**Note:** Dooby uses SHA1 as Item ID.

#### Listing all the hashtags you have used

	$ d l#
	#today
	#doctor
	#fix
	
#### Listing all the people you have tagged
	
	$ d l@
	@peter
	@hendrix

#### Listing all the item sets

	$ d l%
	%website

### Editing items (use q or ctrl-c to interrupt)

**Dooby** supports autocompletion of item IDs in the *delete*, *bulkdelete* and the *edit* commands, to fire it just do the same as in a bash shell, press [TAB].

	$ d edit
	
or
	
	$ d e
	Item ID > b [TAB]954bf

now press Enter and [TAB] again if you want the original text of the item:

	$ d e
	Item ID > b954bf
	TAB or up arrow to edit > TAB

	$ d e
	Item ID > b954bf
	TAB or up arrow to edit > #fix the email error in %website, talk to @peter #today

	$ d e
	Item ID > b954bf
	TAB or up arrow to edit > #fix the email error in %website #today
	
Edit it and press Enter and the item will be saved.

### Deleting items (use q or ctrl-c to interrupt)

	$ d delete
	
or
	
	$ d d
	Item ID > 5 [TAB]21a3d
	
**Note:** the *SHA1* of the item we edited previously has changed because it's based on the content

	$ d d
	Item ID > 9cfbf4
	9cfbf4 deleted...

**Dooby** won't ask you if you really want to delete the item.

	$ d l
	Showing all items...
	 (521a3d)  #fix the email error in %website #today

### Bulk delete

If you want to delete all the items containing a tag or set of tags this is what bulk delete is useful for. This feature will delete only by tag, not simple text, actually if you enter simple text it will simply ignore it.

Bulk delete supports auto-completion too. Say you want to delete all the items containing @hendrix AND #today.

	$ d bulkdelete

or
	
	$ d b
	What do you want to bulk delete? (@, #, % allowed)
	_ #t[TAB]oday
	#today #doctor

	$ d b
	What do you want to bulk delete? (@, #, % allowed)
	#today @h[TAB]endrix

That's it

### Deleting all the items
	
	$ d flush
	
or

	$ d f
	Sure??? (yes/no)
	yes
	All the items were deleted!

### Deleting the **.dooby** directory and all the items

	$ d trash

or

	$ d t
	Sure??? (yes/no)
	yes
	No more dooby here T_T
	
### Help

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

Known bugs
----------

* In Windows the text is shown with the color codes even installing the *win32console* gem

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