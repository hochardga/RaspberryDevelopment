Ruby Boxing

With this, you can create your own Fighter with their own set of moves and have them fight each other.

=== SECTION A ===
1. To run the program click "run" at the top.  Go ahead and try it now.
Notice the output to the right

2. To stop the program click "stop" at the top.  Go ahead and try it now.

=== SECTION B ===
This is boring, all they do is throw boring punches.  Let's switch out who's fighting.
1. Open "main.rb" by double-clicking it.

2. Looks at line at the bottom.  You should see ...
    Match.new(Fighter, Fighter).fight
Replace one of fighters with "PrincessPeach"  It should now read ...
    Match.new(Fighter, PrincessPeach).fight
Notice how Princess Peach has joined in.  Go ahead and run the program.  Who won?
Each fight is unique.  Run the program again to see if the outcome is different.

=== SECTION C ===
Let's create a new fighter.
1. First open "new_fighter_template.rb" and read the comments at the top of the file

2. Create a new file and edit it.