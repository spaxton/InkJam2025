//Jekyll & Hyde game script for InkJam 2025
//Written by Paxton
//Current state: Rough Pass ("just make it exist")

//vars

->title_screen

=== title_screen ===

The Last Will and Testament of Dr. Jekyll

An Interactive Audio Drama

+ [Tear open the envelope]

+ [Credits]
-> credits -> title_screen

- "Dearest cousin, 

You have no doubt come into possession of this account, along with all my other earthly troubles, by inheriting the laboratory on Whidbury Lane. Permit me one last eccentricity, though I do not deserve it, and allow me to guide you through my end here in this very room." //Since this is a rough draft the tone of the piece will be in wild flux - this first sentence is a bit purple but close-ish to what I think would be interesting. Watch out, silliness ahead #dialog_jekyll

+ [Immerse yourself]
    ->act_i

=== credits ===

Voices

Jekyll / Hyde - Katie Cofield
Mr. Utterson - Michael Mishkin
Officer Crowley - Brandi Hollsten

Development

Narrative Lead - Paxton
Design & Programming - Steven Ngu
Technical Audio - Ben Ash
Casting - Katie Cofield

Written in Ink
Built with Godot
Using the InkGD implementation

Fonts from DaFont.com
Audio from freesoundlibrary.com


+ [Back]
    ->->

=== act_i ===

//Act I vars
VAR influence = 10
VAR focus = 5
VAR resolve = 5

January 24th, 1878

"There is a corrupting force in all our souls, and I have nearly lost the battle for mine. Which is why tonight I go to my end before I lose it entire." //dialog lines to be recorded will be in quotes, the rest will be read by the player but not accompanied by voiceover #dialog_jekyll

+ [Threaten]
    "Your soul has shriveled, Jekyll, it will burn as fuel for my own." #dialog_hyde

+ [Console]
    "Poor Jekyll, unwilling slave to passion, your servitude will soon be over." #dialog_hyde
    
+ [Mock]
    "Lost the battle? You have played traitor to both sides: Jekyll the hypocrite whose oath was always to herself." #dialog_hyde 

- ->beat_2

= beat_2
"Hyde. This insurgent horror is knit closer than a wife, closer than an eye; caged in my flesh I hear it mutter and feel it struggle to be born." #dialog_jekyll

Spend influence to commit actions, with mixed results

+ [Big spend]

+ [Mid spend]

+ [Low spend]

- -> beat_3

= beat_3
"However far from home and duty I may stray she is with me, to cut the devil out is to sever my own veins, and so it is to that inevitable surgery I turn." #dialog_jekyll

Reduce Resolve to prevent Ending A

+ [Overwhelm]
    "Coward! Your weak consitution gave me the reins of life, you cannot wrest them from me now." #dialog_hyde
    
+ [Discourage]
    "Why silence your own voice with mine? Stay the knife a few more months, there are always more experiments to attempt." #dialog_hyde

- ->beat_4

= beat_4
"Hyde's crimes are to me that of a drunkard, and I am guilty for stripping myself of all balancing instincts--" #dialog_jekyll

Reduce Focus to prevent Ending B

+ [Lust]
    "I was a mask to hide your shame, cavorting in Soho, but you revel in those bodily memories." #dialog_hyde
+ [Pride]
    "You never needed me to supply you with a pompous air of self importance." #dialog_hyde
+ [Wrath]
    "They deserve our fury! Ungrateful, imputent -- their scornful glances beg for a show of strength!" #dialog_hyde

- ->beat_5

= beat_5
"I must keep myself aware of any change in temper; a greater boldness, contempt of danger, seeking a solution to the bonds of obligation." #dialog_jekyll

Sometimes it's better not to act at all

+ [High spend]
+ [Low spend]
+ [Bide time]

- -> beat_6

= beat_6
// knocking
"Who calls?" #dialog_jekyll
"Your friend, Utterson, your staff is worried. Will you permit me to enter?" #dialog_utterson
"I cannot see anyone tonight. Tomorrow." #dialog_jekyll

Act II problem: Mr. Utterson is asking after you

+ [Prey upon insecurity]
    "How tragic it will be when Mr. Utterson returns to see your body mangled by poisons." #dialog_hyde
    ~ resolve --
+ [Whose voice did we use?]
    "Those were *my* vocal chords, and Mr. Utterson could hear it. He quite hates me, you know." #dialog_hyde
    ~ focus --

- -> beat_7

= beat_7
Locking up the operating theatre, description of area

"A worthy confession I cannot give, for my forsaken condition is nameless. God forgive me." #dialog_jekyll

Act II opportunities: methods of escape

"Tis a sturdy door. And you're certain the villain has no other means of escape?" #dialog_crowley
"None. The entrance through the operating theatre and exit here into the blind alley are the only affordances into the doctor's cabinet." #dialog_utterson

+ [reduce focus if there]
    "The time awfully fails me, it is useless to prolong this description further." #dialog_jekyll
+ [reduce resolve if there]
    "This, then, is the last time, short of a miracle, that Dr. Jekyll shall think her own thoughts or see her own face (how sadly altered) in the glass." #dialog_jekyll
+ [reduce focus if no resolve]
    "My punishment might have gone on for years had I not run out of that key ingredient: a salt of unknown impurity." #dialog_jekyll
+ [reduce resolve if no focus]
    "I know Hyde fears my power to cut her off by suicide. In my heart I pity her." #dialog_jekyll

- -> beat_8

= beat_8
"If my narrative has hitherto escaped destruction it has been by a combination of great prudence and great good luck." #dialog_jekyll

Jekyll mixes a suicide poison

Have depleted focus or resolve to have a chance

+ {resolve==0}[Shame]
    ~ focus --
    "The rot in your soul will send you to hell, Jekyll, and I will be right there beside you the whole time." #dialog_hyde
    
+ {focus ==0}[Doctor the drink]
    ~ resolve --
    "Let us raise a toast, doctor, to your health and mine." #dialog_hyde
    
+ fallback: let it happen
    "I will always envy your love of life, Hyde; were that passion a part of the best of me we might never have been sundered." #dialog_jekyll
    "No part is the best of us, we simply are what we are." #dialog_hyde

- -> beat_9

= beat_9

"Will Hyde die upon the scaffold? Or will she find courage to release herself at the last moment? God knows I am careless, this is the true hour of my death, and what follows concerns another than myself." #dialog_jekyll

{resolve == 0 and focus == 0: ->act_i_conclusion}
{resolve == 0: ->surrender_end}
->suicide_end

= suicide_end

"Here then, as I lay down the pen and proceed to seal up my confession, I bring the unhappy life of Dr. H. Jekyll to an end." #dialog_jekyll

<- act_i_end_loop
-> DONE

= surrender_end

#door breaking sound
"Who is that? Hyde? Where is Dr. Jekyll? What have you done with her!?" #dialog_utterson
"No use, she has been stilled by some prescription. Bedlam or Newgate, we'll not get an answer tonight." #dialog_crowley
"She was alive, and here this day, yet I fear she has been involved in some further catastrophe." #dialog_utterson

<- act_i_end_loop
-> DONE

= act_i_end_loop

+ Reread the letter from the beginning
    ->act_i
    
+ [Credits]
    -> credits -> title_screen
    

= act_i_conclusion
        
+ Take the drink
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
    "Taste steel" I whispered as I bled the lot dry. ->escape_end
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


