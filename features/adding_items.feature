Feature: Adding items
  In order to add items
  I want to use dooby add command

Scenario: Add items
  Given dooby have been already initialized
  When I run "dooby add 'this is an #item'"
  Then the output should contain "Item added!"
  When I run "dooby list"
  Then the output should contain "e10782"
  And the output should contain "this is an"
  And the output should contain "#item"