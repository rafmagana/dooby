CHANGELOG
=========

Version 0.3.0 (November 06, 2010)
--------------------------------

* use as git commit message the item marked as :doing wth **$ dooby commit**
* fix autocompletion of strings starting with an at sign (@)
* due dates handled through curly braces containing a date in this format: {mmm/dd/yyyy}, ie. {May/02/2011}
* **#tomorrow** tag is replaced by tomorrow's date, ie. {Nov/04/2010} and then replaced by #today at the next day.
* show items containing the tomorrow's date if user issues **$ dooby list #tomorrow** or **tomorrow**
* fix error when autocompletion isn't set
* add autocompletion to **ilist** (interactive)
* colorize strings starting with a colon (statuses)

---

Version 0.2.0 (October 28, 2010)
----------------------------

* add sections for items marked as **#today** and **#urgent**
* add messages when user executes dooby without arguments and list is empty
* add **bulk delete** (interactive and completion)  
    $ dooby bulkdelete  
* add **shortcuts** to list tags  
    $ dooby l@  
    $ dooby l#  
    $ dooby l%  

---

Version 0.1.0 (October 27, 2010)
--------------------------------

* add, edit, list, interactive list, delete, trash and flush
* colorize strings starting with @, # and %

* Initial release