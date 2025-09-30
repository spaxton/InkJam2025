//Jekyll & Hyde game script for InkJam 2025
//Written by Paxton
//Current state: Rough Pass ("just make it exist")

//vars

->new_game

=== new_game ===

The Last Will and Testament of Dr. Jekyll

+ [Tear open the envelope]

- "Dearest cousin, 

You have no doubt come into possession of this package, along with all my other earthly troubles, by inheriting the laboratory on Whitbury Lane. Permit me one last eccentricity, though I do not deserve it, and allow me to guide you through my end here in this very room." //Since this is a rough draft the tone of the piece will be in wild flux - this first sentence is a bit purple but close-ish to what I think would be interesting. Watch out, silliness ahead

+ [Immerse yourself]
    ->act_i

=== act_i ===
January 24th, 1878

"I did a bunch of bad stuff." //dialog lines to be recorded will be in quotes, the rest will be read by the player but not accompanied by voiceover

The last thing I did was

+ Kill myself
    I was a coward to the end, hiding my face from justice as well as all who once called me friend.
    
    The End
    
    ++ Reread the letter from the beginning
        ->act_i

+ Go to jail
    Twas the right thing to do.
    
    The End
    
    ++ Reread the letter from the beginning
        ->act_i
        
+ Took a drink
    You know, people say I'm a different person after I get a couple drinks in me.
    -> act_ii


=== act_ii ===
//note: this section is intended to be real-time, maybe a 2 min timer?

// vars // these will probably need some sort of smart reset mechanic
VAR luck = 2
VAR seconds = 120

The handwriting of the letter noticably changes becoming cramped and steeply sloped, fitful and irregular as if the author is in great pain.

"It's Hyde time, baby!"
->hyde_choices

= hyde_choices
* Look in the mirror
    Yikes! No wonder the police want to lock you up.
    ~ luck --
    ->hyde_choices
    
* (drink_1) Take another drink
    //sound effect of drinking and slamming shot glass

    It doesn't change me any more, but it does taste foul going down and gives me a splitting headache - and isn't that what drinking is all about?
    ~ luck --
    ->hyde_choices
    
* {drink_1} Take yet ANOTHER drink
    "Now THAT'S what I'm talking about!" 
    
    All at once my pain melts away and I am suffused with superhuman strength. Or at least the belief in such - and really, what is the difference?
    ~ luck += 2
    ->hyde_choices
    
* (clues)Look around for clues
    "Cleaning is for those of weak consitution." 
    
    I say while frantically tossing everything from drawer and table onto the floor. There is so much paperwork, literally all of it quibbling legalities they would use to put me away forever.
    ->hyde_choices
    
* (weapon){clues}Grab a weapon
    "Bah! Rubbish, all of it!" 
    
    An inkpot? A beaker of ethanol? My diploma from Frankenstein university?? Ah-ha! A penknife - just like me it's short but deadly.
    ->hyde_choices
    
* (evidence_destroyed){clues} Destroy evidence
    "Only one way to cleanse a rot this deep." //mad cackle
    
    I grab a torch and set the mess ablaze. Let the beaurocrats sift through the ashes, today we ACT.
    ->hyde_choices
    
* (barred) Bar the door
    "You won't get me, bastards"
    
    With haste an antique cabinet is pushed in front of the main entrance - yet this buys me precious little time.
    ~ seconds += 60
    ->hyde_choices
    
+ Time to make my escape
    "Let's blow this popsicle stand!"
    ->attempt


= attempt
I've done all I can do to prepare.

- (attempt_choices)
* Try to escape out the window
    {luck:
    - 0: "Bother that." I'm not crawling out a <i>window</i>. If I die it will at least be with dignity. ->attempt_choices
    - 1: "Curse these stubby legs!" I could not make it up to the window, much less out of it. ->attempt_choices
    - 2: "You will remember today as the day you ALMOST caught-" I began to say, when I slipped and broke my neck. ->dead_end
    - 3: "Long live the king." ->escape_end
    - else: "How the devil did that happen?" I say as I collapse of a heart attack. ->dead_end
    }
* Try to fight the cops
    {!weapon: "None of you are a match for me!" Hyde was reported to shout as he was squarely knocked cold by a dozen of her majesty's finest. ->caught_end} 
    {weapon: "Taste steel" I whispered as I bled the lot dry. ->escape_end}
    ->DONE
* Try to talk your way out
    "Officers, officers, what seems to be the trouble?"
    {evidence_destroyed: "You're burning the place down, obviously." ->caught_end}
    "We've had reports of a disturbance." The bobbies came in and saw the science lab {clues: in complete disarray|in all its glory} and started asking after Dr. Jekyll.
    ** "Dr. Who? Never heard of him"
    ** "Look, it's Jack the Ripper!"
    ** "How bribable are you? 50 pounds?"
    
    -- {luck >= 2: Shockingly, that worked. ->escape_end}
        {luck <2: Obviously, that didn't work. ->caught_end}

// endings

= dead_end
The coronoer's report showed Hyde had the strangest bout of luck ever to be medically recorded. {evidence_destroyed: Burned to a crisp, so the coroner was taking some liberties.}
->end

= caught_end
Mr. Hyde went to jail for all the bad stuff he done. {evidence_destroyed: Including arson.}
->end

= escape_end
Hyde was never found, though he was reported seen fleeing the scene of Dr. Jekyll's probable murder {evidence_destroyed: (who can tell when the place burned to the ground?)} and has a bounty on his head in all corners of the country.
->end

=== end ===
You close the package and look around the room which bears the truth of experience of which the narrative describes.

+ Reread the letter from the beginning
    ->act_i
+ Reread the letter from when the handwriting changed
    ->act_ii //note: currently replays will NOT work since * choices are used. A different method must be put in place, until then test by restarting the story completely


