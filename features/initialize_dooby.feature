Feature: Dooby initializes file .dooby/list.yml
  In order to be able to add items
  I want to have a .dooby/list.yml file to store my items

Scenario: Initialize dooby
  Given dooby haven't been initialized
  When I run "dooby init"
  Then the following files should exist:
  |.dooby/list.yml|
  Then the output should contain:
  """
  Created a new todo list inside this directory
  """

Scenario: Don't initialize if it has been already initialized
  Given dooby have been already initialized
  When I run "dooby init"
  Then the output should contain:
  """
  Todo list already exists inside this directory
  """