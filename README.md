dooby
=====

A **very simplistic** command-line to-do/note list manager in Ruby.

WARNING!!!
-------

You should know this gem lacks of fancy things, meaning: social, cloud, mobile, web interface, etc.

Why another to-do list manager?
----

I spend a lot of time in the terminal and I didn't really like any of the current options.

How does Dooby works?
---------------------

### A bunch of lists
Dooby is directory-based, so you can maintain different to-do/notes lists in every directory you want.

For instance, I use one to-do list per project, that way I don't have all the tasks in one place so I can get focused in just one set of tasks, in one context.

### Priorities
Dooby doesn't like to handle priorities, that's your concern. The main goal of Dooby is to help me to handle my today/tomorrow tasks and to handle my personal notes.

### Due dates
Due dates for today/tomorrow tasks? well, maybe later.

### #tag #tag and #tag again and tell @jim to #tag everything in his %life as well

Dooby uses some special characters to visually help us to differentiate between things and let us search tasks very easily, the ones that you might recognize are **@** and **#**, I stole the idea from Twitter, but of course they don't behave as in Twitter, the **@** sign is not an username but a character to simply tag a person, that's all, nothing else (so far).

People

	@peter, @john, @jim

Contexts (states of mind, mood, places, etc)
	
	#today, #tomorrow, #urgent
	
	#work, #home
	
	#thinking, #sad

Projects

	%website, %shoppinglist, %whatever

Most of these characters are meaningless to Dooby, she (yes, she's a woman) isn't aware of them, Dooby is aware only of some of them:

	#today
	#urgent
	#tomorrow

All the tasks tagged with *#today* and *#urgent* will be shown in a special section every time you list your to-dos/notes.

All the tasks tagged with *#tomorrow* will be marked with the tag *#today* at the next day.

Usage
-----

###Creating an alias

	$ alias d='dooby'

### Initializing Dooby

	$ d init

This creates a **.dooby/list.yml** file in the current directory. Dooby will save all the tasks on it.

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
	 > shows tasks related to people

	$ d l %
	 > shows all the tasks with a related project
	
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

**Note:** Dooby uses SHA1 as Task ID.

#### Listing all the hashtags you have used

	$ d l#
	#today
	#doctor
	#fix
	
#### Listing all the people you have tagged
	
	$ d l@
	@peter
	@hendrix

#### Listing all the projects you have tagged

	$ d l%
	%website

### Editing items (use q or ctrl-c to interrupt)

**Dooby** supports autocompletion of task IDs in the *delete* and the *edit* commands, to fire it just do the same as in a bash shell, press TAB TAB.

	$ d edit
	
or
	
	$ d e
	Task ID > TAB TAB
	b954bf 9cfbf4 (we only have 2 tasks)

	$ d e
	Task ID > b TAB

and you'll see that the task id have been auto-completed

	$ d e
	Task ID > b954bf

now press Enter and TAB TAB again if you want the original text of the item:

	$ d e
	Task ID > b954bf
	TAB or up arrow to edit > TAB

	$ d e
	Task ID > b954bf
	TAB or up arrow to edit > #fix the email error in %website, talk to @peter #today

	$ d e
	Task ID > b954bf
	TAB or up arrow to edit > #fix the email error in %website #today
	
Edit it and press Enter and the task will be saved.

### Deleting items (use q or ctrl-c to interrupt)

	$ d delete
	
or
	
	$ d d
	Task ID > TAB TAB
	521a3d 9cfbf4
	
**Note:** the *SHA1* of the task we edited previously has changed because it's based on the content

	$ d d
	Task ID > 9cfbf4
	9cfbf4 deleted...

**Dooby** won't ask you if you really want to delete the task.

	$ d l
	Showing all items...
	 (521a3d)  #fix the email error in %website #today

### Bulk delete

If you want to delete all the tasks containing a tag or set of tags this is what bulk delete is useful for. This feature will delete only by tag, not simple text, actually if you enter simple text it will simply ignore it.

Bulk delete supports auto-completion too. Say you want to delete all the tasks containing @hendrix AND #today.

	$ d bulkdelete

or
	
	$ d b
	What do you want to bulk delete? (@, #, % allowed)
	_ #TAB TAB
	#today #doctor

	$ d b
	What do you want to bulk delete? (@, #, % allowed)
	#today @hendrix

That's it

### Deleting all the items
	
	$ d flush
	
or

	$ d f
	Sure??? (yes/no)
	yes
	All the task were deleted!

### Deleting the **.dooby** directory and all the tasks

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
	  Lists @people, #tags, %projects or tasks (default)

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
