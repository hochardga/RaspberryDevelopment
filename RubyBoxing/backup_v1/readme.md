Ruby Boxing

With this, you can create your own boxer with their own set of moves and have them fight each other.

=== SECTION A ===
1. To run the program click "run" at the top.  Go ahead and try it now.
Notice the output to the right

2. To stop the program click "stop" at the top.  Go ahead and try it now.

=== SECTION B ===
This is boring, let's switch out who's fighting.
1. Open "main.rb" by double-clicking it.

2. Looks at line 16.  You should see ...
    Match.new(Boxer, Boxer).fight
Add a "#" at the begging of the line "comments" it out and won't execute.  Go ahead and "comment out" that line by adding a "#" at the begging.  It should now be ...
    #Match.new(Boxer, Boxer).fight

3. If you try to run the program now, nobody will fight.  Go ahead and try.

4. "Uncomment out" line 17 by removing the "#".  It should now read ...
    Match.new(Boxer, BoxerJoePuncher).fight
Notice how BoxerJoePuncher has joined in.  Go ahead and run the program.  Who won?

=== SECTION C ===
1. BoxerFlash wants to join in.  Replace in that same line of code, replace "Boxer" with "BoxerFlash".  It should read ...
    Match.new(BoxerFlash, BoxerJoePuncher).fight
Run it.  Who wins?

=== SECTION D ===
1. Let's edit BoxerJoePuncher by giving him some more moves.  Open "boxer_joe_puncher.rb"

=== SECTION E ===
1. Try beating "BoxerUppercutJack"

=== SECTION F ===
1. Try creating your own boxer