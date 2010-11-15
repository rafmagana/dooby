Feature: Deleting items
  In order to delete items
  I want to use the 'dooby delete' command

Scenario: Delete an item
  Given dooby have been already initialized
  And I run "dooby add 'this is an #item'"
  When I run "dooby delete" interactively
  When I type "e10782"
  Then the output should contain "e10782 deleted..."