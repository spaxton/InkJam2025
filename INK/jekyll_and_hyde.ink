//Jekyll & Hyde game script for InkJam 2025
//Written by Paxton
//Current state: Rough Pass ("just make it exist")

//vars
VAR currentAct = "act1"

// example play sfx (change "effects" to "dialog" for lines)
// ~ playClip("/audio/effects/page-turning-sound-effect.mp3")

->title_screen

=== title_screen ===

The Last Will and Testament of Dr. Jekyll #title

An Interactive Audio Drama #subtitle

+ [Tear open the envelope]
/*
+ [Credits]
-> credits -> title_screen
*/

- Dearest cousin, 

You have no doubt come into possession of this tragic account, along with all my other earthly troubles, by inheriting the laboratory on Whidbury Lane. Permit me one last eccentricity, though I do not deserve it, to lay bare the reasons for my unhappy end in this very room. #dialog
~ playClip("/audio/dialog/act_i_01_dearest_cousin.wav")

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

~ currentAct = "act1"

//todo: reveal vars (focus/resolve)

January 24th, 1878

There is a corrupting force in all our souls, and I have nearly lost the battle for mine. Which is why tonight I go to my end before I lose it entire. #dialog
~ playClip("/audio/dialog/act_i_02_there_is_a_corrupting_force.wav")

+ [Threaten]
    Your soul has shriveled, Jekyll, it will burn as fuel for my own. #dialog
    ~ playClip("/audio/dialog/act_i_03_your_soul_has_shriveled.wav")
    ~ focus --
    

+ [Console]
    Poor Jekyll, unwilling slave to passion, your servitude will soon be over. #dialog
    ~ playClip("/audio/dialog/act_i_04_poor_jekyll.wav")
    ~ resolve --
    
    
+ [Mock]
    Lost the battle? You have played traitor to both sides: Jekyll the hypocrite whose oath was always to herself. #dialo_hyde
    ~ playClip("/audio/dialog/act_i_05_lost_the_battle.wav")
    ~ focus --
   
//todo: write
- ->variable_display->
+[Continue]

->beat_2

= beat_2

//todo: reveal vars (influence)

Hyde. This insurgent horror is knit closer than a wife, closer than an eye; caged in my flesh I hear it mutter and feel it struggle to be born. #dialog
~ playClip("/audio/dialog/act_i_06_hyde_this_insurgent_horror.wav")

//todo: explain influence

//todo: write responses

+ [Berate (-3 Influence)]
    Too late, too late. I've always been here, ignored, feared,  hated -- now you wish to blot me out again but no, oh no. Too late.
    ~ playClip("/audio/dialog/act_i_07_too_late_too_late.wav")
    ~ focus -= 2
    ~ influence -= 3
    
+ [Write (-2 Influence)]
    While Jekyll is distracted Hyde scratches out the last sentence, replacing it with a series of profanities.
    ~ focus --
    ~ influence -=2
    
+ [Thirst (-1 Influence)]
    The shared body yearns to slake a mortal thirst. Hyde pushes it to the surface, reminding Jekyll of all she is putting at stake.
    ~ resolve --
    ~ influence --

- ->variable_display->
//todo: write
    
+[Continue]
    ~ playClip("act_i_08_long_sigh.wav")

//explain influence pt. 2

-> beat_3

= beat_3
However far from home and duty I may stray she is with me, to cut the devil out is to sever my own veins, and so it is to that inevitable surgery I turn. #dialog
~ playClip("/audio/dialog/act_i_09_however_far.wav")

//todo: explain resolve

+ [Overwhelm (-2)]
    Coward! Your weak consitution gave me the reins of life, you cannot wrest them from me now. #dialog
    ~ playClip("/audio/dialog/act_i_10_coward.wav")
    ~ focus --
    ~ influence -=2
    ~ resolve --
    
    
+ [Discourage (-1)]
    Why silence your own voice with mine? Stay the knife a few more months, there are always more experiments to attempt. #dialog
    ~ playClip("/audio/dialog/act_i_11_why_silence_your_own_voice.wav")
    ~ resolve --
    ~ influence --

- ->variable_display->
//todo: write
    
+[Continue]
    ->beat_4

= beat_4
Hyde's crimes are to me that of a drunkard, and I am guilty for stripping myself of all balancing instincts-- #dialog
    ~ playClip("/audio/dialog/act_i_12_hydes_crimes.wav")

//todo: explain focus

+ [Lust (-1)]
    I was a mask to hide your shame, cavorting in Soho, but you revel in those bodily memories. #dialog
    ~ playClip("/audio/dialog/act_i_13_i_was_a_mask.wav")
    ~ focus -= 2
    ~ influence --
    
+ [Pride (-1)]
    You never needed me to supply you with a pompous air of self importance. #dialog
    ~ playClip("/audio/dialog/act_i_14_you_never_needed_me.wav")
    ~ focus --
    ~ influence --
    
+ [Wrath (-1)]
    They deserve our fury! Ungrateful, imputent -- their scornful glances beg for a show of strength! #dialog
    ~ playClip("/audio/dialog/act_i_15_they_deserve_our_fury.wav")
    ~ influence --

- ->variable_display->
//todo: write
    
+[Continue]
    ->beat_5

= beat_5
I must keep myself aware of any change in temper; a greater boldness, contempt of danger, seeking a solution to the bonds of obligation. #dialog
    ~ playClip("/audio/dialog/act_i_16_i_must_keep.wav")

//todo: hint at not using every opportunity

//todo: write responses or cut

+ [Bide time]

- -> beat_6

= beat_6
A knock at the cabinet door breaks Jekyll's train of thought.
    ~ playClip("/audio/effects/door-knocking-sound-effect.mp3")
    ~ focus --

+ [Listen]
    "Who calls?"  #dialog
    ~ playClip("/audio/dialog/act_i_17_who_calls.wav")
    ++ [Wait for an opportunity]
        "Your friend, Utterson, your staff is worried. Will you permit me to enter?"  #dialog
        ~ playClip("/audio/dialog/act_i_18_your_friend_utterson.wav")
        +++[Be subtle]
            "I cannot see anyone tonight. Tomorrow." #dialog
            ~ playClip("/audio/dialog/act_i_19_i_cannot_see_anyone.wav")

- //todo: explain the threat of utterson

+ [Prey upon her insecurity (-1)]
    How tragic it will be when Mr. Utterson returns to see your body mangled by poisons. #dialog
            ~ playClip("/audio/dialog/act_i_20_how_tragic_it_will_be.wav")
    ~ resolve --
    ~ influence --
+ [Reveal subtlety (-1)]
    Those were my vocal chords, and Mr. Utterson could hear it. He quite hates me, you know. #dialog
            ~ playClip("/audio/dialog/act_i_21_those_were_my_vocal_chords.wav")
    ~ focus --
    ~ influence --

- ->variable_display->
//todo: write
    
+[Continue]
    -> beat_7

= beat_7
//todo: write Locking up the operating theatre, description of area

A worthy confession I cannot give, for my forsaken condition is nameless. God forgive me. #dialog
~ playClip("/audio/dialog/act_i_22_a_worthy_confession.wav")

+ [Distract with mess]
    This disordered cabinet reflects my disordered thoughts, a failed attempt to understand one's nature that has left it shattered. #dialog
    ~ playClip("/audio/dialog/act_i_25_this_disordered_cabinet.wav")
            
    ++ [Call attention to the door]
        //todo: write Act II opportunities: methods of escape
        
        Tis a sturdy door. And you're certain the villain has no other means of escape? #dialog
        ~ playClip("/audio/dialog/act_i_23_tis_a_sturdy_door.wav")
        
        +++ [Listen]
            None. The entrance through the operating theatre and exit here into the blind alley are the only affordances into the doctor's cabinet. #dialog
            ~ playClip("/audio/dialog/act_i_24_none_the_entrance.wav")

- //todo: write & weight

+ {resolve >=0}[Tick tock (-2)]
    The time awfully fails me, it is useless to prolong this description further. #dialog
    ~ playClip("/audio/dialog/act_i_26_the_time_awfully_fails_me.wav")
    ~ focus --
    ~ influence -=2
    
+ {focus >=0}[Glance in the mirror (-2)]
    This, then, is the last time, short of a miracle, that Dr. Jekyll shall think her own thoughts or see her own face (how sadly altered) in the glass. #dialog
    ~ playClip("/audio/dialog/act_i_27_this_then_is_the_last_time.wav")
    ~ resolve --
    ~ influence -=2
    
+ {resolve <=0}[Consider the potion (-1)]
    My punishment might have gone on for years had I not run out of that key ingredient: a salt of unknown impurity. #dialog
    ~ playClip("/audio/dialog/act_i_28_my_punishment.wav")
    ~ focus --
    ~ influence --
    
+ {focus <=0}[Let fear in (-1)]
    I know Hyde fears my power to cut her off by suicide. In my heart I pity her. #dialog
    ~ playClip("/audio/dialog/act_i_29_i_know_hyde_fears.wav")
    ~ resolve --
    ~ influence --

- ->variable_display->
//todo: write
    
+[Continue]
    -> beat_8

= beat_8
If my narrative has hitherto escaped destruction it has been by a combination of great prudence and great good luck."  #dialog
~ playClip("/audio/dialog/act_i_30_if_my_narrative.wav")

//todo: write Jekyll mixes a suicide poison

+ {resolve >= 0}[Shame]
    ~ focus --
    The rot in your soul will send you to hell, Jekyll, and I will be right there beside you the whole time. #dialog
    ~ playClip("/audio/dialog/act_i_31_the_rot_in_your_soul.wav")
    
+ {focus >= 0}[Doctor the drink]
    ~ resolve --
    Let us raise a toast, doctor, to your health and mine. #dialog
    ~ playClip("/audio/dialog/act_i_32_let_us_raise_a_toast.wav")
    
+ {influence == 0 or (resolve > 0 and focus > 0)} [Watch]
    "I will always envy your love of life, Hyde; were that passion a part of the best of me we might never have been sundered. #dialog
    ~ playClip("/audio/dialog/act_i_33_i_will_always_envy.wav")
    ++ [Disagree]
        "No part is the best of us, we simply are what we are. #dialog
        ~ playClip("/audio/dialog/act_i_34_no_part_is_the_best.wav")

- ->variable_display->

+ [Continue]
    -> beat_9

= beat_9

Will Hyde die upon the scaffold? Or will she find courage to release herself at the last moment? God knows I am careless, this is the true hour of my death, and what follows concerns another than myself.  #dialog
~ playClip("/audio/dialog/act_i_35_will_hyde_die.wav")

+ [Conclude]
    {resolve <= 0 and focus <= 0: ->act_i_conclusion}
    {resolve <= 0: ->surrender_end}
    ->suicide_end

= suicide_end
//todo: write
Here then, as I lay down the pen and proceed to seal up my confession, I bring the unhappy life of Dr. H. Jekyll to an end.  #dialog
~ playClip("/audio/dialog/act_i_36_here_then_as_i_lay.wav")

<- act_i_end_loop
-> DONE

= surrender_end
// todo: write
//todo: source/implement door breaking sound
Who is that? Hyde? Where is Dr. Jekyll? What have you done with her!?  #dialog
~ playClip("/audio/dialog/act_i_37_who_is_that.wav")
    + [Sneer]
    No use, she has been stilled by some prescription. Bedlam or Newgate, we'll not get an answer tonight.   #dialog
    ~ playClip("/audio/dialog/act_i_38_no_use.wav")
        ++ [Struggle]
        She was alive, and here this day, yet I fear she has been involved in some further catastrophe.  #dialog
        ~ playClip("/audio/dialog/act_i_39_she_was_alive.wav")

<- act_i_end_loop
-> DONE

= act_i_end_loop
//todo: write?
+ [Reread the letter from the beginning]
    ->act_i

/*
+ [Credits]
    -> credits -> title_screen
*/  

= act_i_conclusion
        
+ [Take hold]
    //todo: write
    ~ playClip("/audio/dialog/act_i_40_transformation_intermission_alt.wav")
    -> intermission
    
= intermission
Dr. Jekyll was never seen again, presumed dead after Mr. Utterson broke into the doctor's cabinet with the aid of London's finest only to find it ransacked. 

Ms. Hyde is wanted for arrest in all counties for multiple counts of murder, theft, lecherousness, and villainy.

~ playClip("/audio/dialog/act_ii_01_chuckles.wav")

<- act_i_end_loop
-> DONE

=== variable_display ===
Focus: {focus} Resolve: {resolve}
->->


//  *******************  ACT II  *******************  //


=== act_ii ===
//note: this section is intended to be real-time, maybe a 2 min timer?
~ currentAct = "act2"
// vars // these will probably need some sort of smart reset mechanic
VAR luck = 2
VAR seconds = 120

//todo: rewrite
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


// functions

//use full filepath from root folder for clipName for now
EXTERNAL playClip(clipName)

=== function playClip(clipName) ===
// fallback for testing within inky
 ~return 1