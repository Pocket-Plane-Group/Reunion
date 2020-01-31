/* The Reunion */

// Castle

// a man near the bridge, bridge lowered, line overhead: "Got to get out of here!"

BEGIN O#DAEGUY

CHAIN IF ~Global("O#DAEHelpfulDyingGuy","GLOBAL",3)~ THEN O#DAEGUY g1
@0 /* By the love of Waukeen, run away! This place is pure madness. What are you doing here, anyway? */
END
++ @1 /* I saved this castle from the trolls once. */ + g1.1
++ @2 /* My name is <CHARNAME>. I am a Child of Bhaal. */ + g1.1
+ ~Global("PCKeepOwner","GLOBAL",1)~ + @3 /* I am the <PRO_LADYLORD> of this keep, actually. */ + g1.1
++ @4 /* Never mind that. Who are you? */ + g1.1

CHAIN O#DAEGUY g1.1
@5 /* Wait, I recognize you. You destroyed... a nest of vampires in Athkatla, right? Too bad I'm too much in a hurry to leave this place. */
== O#DAEGUY @6 /* I am a demon hunter. Name's Leon... well, it's not important right now. I heard demons were seen in these parts, and came to see if I could help. Instead, I got my ass handed to me. */
== JAHEI25J IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @7 /* If was foolish of you to go in alone. */
== SAREV25J IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @8 /* You were weak. */
== IMOEN25J IF ~InParty("Imoen") InMyArea("Imoen") !StateCheck("Imoen",CD_STATE_NOTVALID)~ THEN @9 /* Uh-oh. <CHARNAME>, you're sure you want to go in? */
== NALIA25J IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @10 /* What is going on inside? Do you know? */
== O#DAEGUY @11 /* During the fight, I heard your name mentioned. This man, Daemon, a Cyricist dressed in black... he must really hate you. He summoned demons inside the walls... oh, Tymora, I ran away just in time. */
END
++ @12 /* Who is he? */ EXTERN O#DAEGUY g1.2
++ @13 /* Demons? Again? Why can't these people summon butterflies for a change? Why all the horns and fangs? Why the hoods and the black outfits? */ EXTERN O#DAEGUY g1.3
++ @14 /* Predictable as always. I'm surprised he hasn't kidnapped Nalia yet. */ EXTERN O#DAEGUY g1.3a
++ @15 /* How did you manage to run away? */ EXTERN O#DAEGUY g1.3b
++ @16 /* Thank you for your help. */ EXTERN O#DAEGUY g1.4

CHAIN O#DAEGUY g1.2
@17 /* An assassin, I think. He's young, but dangerous. */
END
IF ~~ EXTERN O#DAEGUY g1.4

CHAIN O#DAEGUY g1.3
@18 /* Heh. No fashion sense, maybe? I wish I could still crack a joke, too, but my ribs hurt too much.  */
END
IF ~~ EXTERN O#DAEGUY g1.4

CHAIN O#DAEGUY g1.3a
@19 /* He was only interested in you. I've never seen such hatred in my life. Ouch, my ribs still hurt. */
END
IF ~~ EXTERN O#DAEGUY g1.4

CHAIN O#DAEGUY g1.3b
@20 /* I don't think he really wanted to kill me, exactly. That Daemon guy even let some of the villagers go. His only target is you. */
END
IF ~~ EXTERN O#DAEGUY g1.4

CHAIN O#DAEGUY g1.4
@21 /* Just be careful. You got to watch yourself, or you're toast. */
== VICON25J IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @22 /* The fool overexerted himself, it seems. Come on, <CHARNAME>: he is no longer useful. */
== NALIA25J IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @23 /* Thank you for coming to help. I really appreciate this. */
== MAZZY25J IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @24 /* May you get home safely. We will deal with the demons ourselves, do not worry. */
== MINSC25J IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @25 /* Worry not, friend. Minsc and Boo and friends will fight for you, and we shall meet in happier times, where there would be ale and dancing and friendly ladies without too much clothes on! */
== KORGA25J IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @26 /* Bah! Leave him alone, I say. */
== O#DAEGUY @27 /* One last thing. I saw a ghost inside. A woman, and she, too, spoke your name. Find her - or, perhaps, she'll find you. */
DO ~AddJournalEntry(@10001,QUEST) SetGlobal("O#DAEHelpfulDyingGuy","GLOBAL",4) DestroySelf()~
EXIT

// First floor: Evil Majordomo

BEGIN O#DAEMAJ

APPEND O#DAEMAJ

IF ~Global("O#DAEMajordomo1","GLOBAL",1)~ d1
SAY @28 /* Ah, my <PRO_LADYLORD>. Would you like a drink? Some fresh virgin blood for you today. Or do you prefer tanar'ri milkshakes? That can be arranged, too. */
++ @29 /* Majordomo! I've always suspected you were secretly evil! */ + d1.1
++ @30 /* Are you possessed by a demon or something? */ + d1.2
++ @31 /* No more words. DIE! */ + d1.0
END

IF ~~ d1.0
SAY @32 /* It's your funeral, my <PRO_LADYLORD>. Get <PRO_HIMHER>! */
IF ~~ DO ~SetGlobal("O#DAEMajordomo1","GLOBAL",2)~ EXIT
END

IF ~~ d1.1
SAY @33 /* And I've always suspected that you suspected. No doubt you even had one of your lackeys to cast a spell that detects any evil intent! */
IF ~~ + d1.3
END

IF ~~ d1.2
SAY @34 /* Hahaha! No, my dear <PRO_LADYLORD>, it's all me. Do you mean to say you've never suspected this humble Majordomo? */
IF ~~ + d1.3
END

IF ~~ d1.3
SAY @35 /* I've been enduring suspicion for years. "Evil", they said. "He must be evil!" BUT NOBODY COULD ACTUALLY PROVE ANYTHNIG! MYAHAHAHA! */
IF ~~ + d1.3a
IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ EXTERN NALIA25J MAJORDOMO
END

IF ~~ d1.3a
SAY @36 /* I asked a magician to mask my aura. A simple fix, so people could no longer detect my EEEEVIL presence! */
= @37 /* And, oh, it worked so well. Too bad it all went to waste when the Prince of Lies' servant invaded the keep. */
++ @38 /* Why would you even side with the invaders? */ + d1.4
++ @39 /* What does this man want, anyway? */ + d1.5
++ @40 /* And now I can finally kill you. */ + d1.0
END

IF ~~ d1.4
SAY @41 /* Why do you think? To get rid of the likes of you, of course! */ 
IF ~~ + d1.6
END

IF ~~ d1.5
SAY @42 /* What do you think? To get rid of you, of course! */ 
IF ~~ + d1.6
END

END

CHAIN O#DAEMAJ d1.6
@43 /* When people started whispering that mistress Nalia became an archmage, I realized what was about to happen. */
= @44 /* Of course she would come back and rule the keep herself! Helping the less fortunate, admitting dirty beggars inside my shiny halls, reduce my nice, sweet, precious taxes... GRRRRR! Never! */
== ANOME25J IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @45 /* Demon! Worry not, you will face justice. */
== KELDO25J IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @46 /* I should have seen through this monster, but I failed. This time my sword shall strike true. */
== EDWIN25J IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @47 /* A man after my own heart. Or should I say, a demon? (Won't prevent me from fireballing this idiot to death, though. Oh, no.) */
== JAN25J IF ~InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @48 /* Aunt Silvesta used to have a very polite bookkeeper. Silent, quick, oily, a brilliant mind, a deft hand with numbers - you name it. Ran away with Aunt Silvesta's youngest daughter and snatched family diamonds, too. Never trust first appearances, I say. */
== O#DAEMAJ @49 /* Why couldn't it be kind, good master Isaea? I expected HIM to be our new master! I even oiled the chains in the dungeon! */
= @50 /* Lord Isaea never possessed much sense beyond slave trading and pirating, but oh, what a lovely marionette ruler he would have been! */
= @51 /* Ah, never mind. You're about to challenge me in my own keep, I expect? */
END
IF ~~ EXTERN O#DAEMAJ d1.0

CHAIN NALIA25J MAJORDOMO
@52 /* I thought you looked suspicious! But Auntie always liked you so much, and then those Radiant Heart paladins haven't found anything... How? How did you hide your evil designs? */
END
IF ~~ EXTERN O#DAEMAJ d1.3a

// in the secret room - Lady Delcia, screeching at her maidservant, dialogue is in the setup.tra

// Daemon, Alianna, Alianna, Daemon, Daemon, Deamon, Alianna

// First vision of Alianna

BEGIN O#DAEALI

APPEND O#DAEALI

// 1.

IF ~Global("O#DAEAlianna1","GLOBAL",2)~ a1
SAY @53 /* My child. You came. */
++ @54 /* Alianna? */ + a1.1
++ @55 /* Mother? */ + a1.1
++ @56 /* Aren't you the crazy priestess of Bhaal who nearly killed me? */ + a1.1
++ @57 /* I came, but not for you. Out of my way, ghost! */ + a1.1
END

IF ~~ a1.1
SAY @58 /* We must talk. The Solar shut me up before I could speak to you, explain myself to you. */
++ @59 /* What is there to explain? You planned to sacrifice me. */ + a1.2
++ @60 /* Talk. I'm listening. */ + a1.4
++ @61 /* And apologize, I hope. */ + a1.3
END

IF ~~ a1.2
SAY @62 /* Yet here you stand, alive. Will mere words hurt? */
IF ~~ + a1.4
END

IF ~~ a1.3
SAY @63 /* An apology is not nearly enough. Only regret and understanding would bring us closer... my regret and your understanding. */
IF ~~ + a1.4
END

IF ~~ a1.4
SAY @64 /* You only saw me as a fanatic priestess of Bhaal, ready to sacrifice her own child. And it's the truth, but not the whole truth. */
= @65 /* I have not always been as you see me now. Once I was a gardener's daughter, sleeping under the stars in summer, watching apple trees bloom, gathering harvest. */
= @66 /* Once I was young, innocent. I had a family. I had a son... */
++ @67 /* A son? */ + a1.5
+ ~Gender(Player1,MALE)~ + @68 /* Do you mean me? */ + a1.5
++ @69 /* What changed? */ + a1.6
END

IF ~~ a1.5
SAY @70 /* I had another child with a human husband, a son. Is that so hard to believe? */
= @71 /* And then... */
IF ~~ + a1.6
END

IF ~~ a1.6
SAY @72 /* My husband abandoned me. Such a simple story, isn't it? But my father worshipped Bhaal, and so did his father before him. */
= @73 /* We may have been gardeners, but my father's father was an assassin of the highest order, and he taught his son all he knew. As my father taught me. As I taught my son... */
= @74 /* My husband could not bear it, could not see me tutoring Daemon in fumes and poisons. He called me a witch, and abandoned his child without a word. */
++ @75 /* Daemon... wait. You mean the guy who just attacked me? */ + a1.7
++ @76 /* Wait, so your son Daemon isn't a Bhaalspawn? */ + a1.7
++ @77 /* So that guy who's rampaging here is my brother? */ + a1.7
++ @78 /* That was cruel. And your husband never tried to come back, to talk to either of you? */ + a1.9
++ @79 /* I understand him. */ + a1.8
END

IF ~~ a1.7
SAY @80 /* Yes. My son Daemon has no divine blood, but he is a strong enemy. */
IF ~~ + a1.10
END

IF ~~ a1.8
SAY @81 /* Indeed. But Gorion did not abandon you. You did not have to grow up on the streets, begging whenever you thought you could get something, and stealing when you could not. */
IF ~~ + a1.10
END

IF ~~ a1.9
SAY @82 /* Why would he? That part of his life was over. Neither Daemon nor I ever saw him since. */
IF ~~ + a1.10
END

IF ~~ a1.10
SAY @83 /* For a year after my husband left me, I spent my days tending to the farm, gathering apples and crying in the moonlight. And then everything changed. */
= @84 /* The land shook. The sun grew bloody and razed the leaves. Death kissed me - and left me naked and trembling. */
= @85 /* Seeing a living god for the first time... it shatters you. Your old life is nothing. In fire and blood, you are cleansed - and a new life begins. */
= @86 /* Lord Bhaal broke me completely... and he remade me again. Do you know what it's like when a god loves you? When your very life is song? */
++ @87 /* You do know that Bhaal was a homicidal killer, right? */ + a1.11
++ @88 /* So Bhaal came in blood and fire... and you fell in love all of a sudden? */ + a1.11
++ @89 /* It's hard to resist, I agree. */ + a1.11
END

IF ~~ a1.11
SAY @90 /* I loved him. That's all I have to say. He was my god, my king, a higher being - and a man. And I was lost. */
= @91 /* But my time here grows short, and I feel demons nearby. I will find you later. */
IF ~~ DO ~AddJournalEntry(@10003,QUEST) SetGlobal("O#DAEAlianna1","GLOBAL",3) DestroySelf()~ EXIT
END

// Second vision of Alianna

// 2.

IF ~Global("O#DAEAlianna1","GLOBAL",5)~ a2
SAY @92 /* Daemon always loved books. I knew he would not let any demons in here. So we are safe, for the moment. */
++ @93 /* A charming fellow, to be sure. */ + a2.2
++ @94 /* He's completely nuts. Does it run in the family? */ + a2.2
++ @95 /* Mother. You never finished your story. */ + a2.3
++ @96 /* Hello again. Let me guess, you're going to tell me the rest of your story, whether I want to or not? */ + a2.1
END

IF ~~ a2.1
SAY @97 /* So perceptive. But you had to listen to the Solar's rantings, right? Maybe I should get a pair of blue wings, too, so you'd be more appreciative? */
++ @98 /* Red ones would suit you better. */ + a2.1a
++ @99 /* My mother, a personal summonable Dark Planetar. I like the sound of that. */ + a2.1a
++ @100 /* Just go on with the story. */ + a2.3
++ @101 /* Keep laughing. One of these days I'll tell you MY life story, and trust me, it's a very long one. With two expansions. */ + a2.1b
END

IF ~~ a2.1a
SAY @102 /* I should look good with wings, huh? Perhaps some plume, too. */
IF ~~ + a2.3
END

IF ~~ a2.1b
SAY @103 /* Ha! I can't wait. */
IF ~~ + a2.3
END

IF ~~ a2.2
SAY @104 /* You should have seen him the night the Harpers showed up on our doorstep. All fire and fervor. */
IF ~~ + a2.3
END

IF ~~ a2.3
SAY @105 /* I told you how I met Lord Bhaal. By that time, Daemon was my pride and joy. */
= @106 /* To an outsider, he was just a quiet boy who loved fishing. But he lived his own life: at the age of eleven, my son had already completed seven contracts. */
++ @107 /* He was an accomplished assassin. */ + a2.4
++ @108 /* Not bad. I wish Gorion allowed me out of the keep. */ + a2.5
++ @109 /* He is much older than me, them. */ + a2.6
END

IF ~~ a2.4
SAY @110 /* That he was. Not as good as you are now, I bet... though he thinks otherwise. */
IF ~~ + a2.7
END

IF ~~ a2.5
SAY @111 /* You were lucky Gorion held you within. Daemon spent an entire month trying to get into Candlekeep, many years ago, when you and Gorion just arrived. Poor boy, he was so disappointed. */
IF ~~ + a2.7
END

IF ~~ a2.6
SAY @112 /* Not that much older. I bet you've seen much in the past year: enough for your experiences to rival Daemon's. */
IF ~~ + a2.7
END

IF ~~ a2.7
SAY @113 /* Ah, Daemon. A brilliant young assassin, then a fervent servant of the Prince of Lies. I should be mad at him for betraying our Lord to Cyric, but I can't. */
= @114 /* Not if it gives his life meaning. My own turned to ashes the moment Gorion ripped you out of my hands. */
++ @115 /* Because Gorion didn't let you sacrifice me? */ + a2.8
++ @116 /* He had no other choice! You wanted to kill me! */ + a2.8
++ @117 /* The luckiest moment of my life, I bet. */ + a2.8
END

IF ~~ a2.8
SAY @118 /* That was my life's work. My Lord's hope for resurrection. My knife was at your throat! */
= @119 /* You have a lover, don't you? How would you feel if your lover was dying, and someone kicked a healing potion out of your hands? */
++ @120 /* That's different! */ + a2.10
++ @121 /* Don't try to justify yourself. That won't work. */ + a2.10
++ @122 /* I think I understand what you're trying to say. */ + a2.10
END

IF ~~ a2.10
SAY @123 /* Believe me, regret is bitter in my mouth. */
= @124 /* I'd gladly have killed someone else. If it let both you and Lord Bhaal live, I would. Anyone but Daemon: I'd go mad. */
= @125 /* But there was no other choice if I wanted to bring my Lord Bhaal back. */
= @126 /* Love can do strange and terrible things to us. And when one love is stronger than another... pray that you'll never have to make a choice. */
++ @127 /* I understand where you're coming from. But there are lines one should not cross. */ + a2.10a
++ @128 /* You should have let Bhaal go. */ + a2.10a
++ @129 /* For what it's worth, I am sorry. */ + a2.10b
++ @130 /* Just stop. Stop saying these things. */ + a2.10d
END

IF ~~ a2.10a
SAY @131 /* Easier said than done, child. */
IF ~~ + a2.10c
END

IF ~~ a2.10b
SAY @132 /* You understand. */
IF ~~ + a2.10c
END

IF ~~ a2.10c
SAY @133 /* When your lover's ghostly lips touch your own every time you go to sleep at night, when you feel hair on his neck and remember what it was like to nestle your head on the crook of his elbow... when you smell him in the air and in the water... */
= @134 /* You cannot forget. And little by little, you break. */
IF ~~ + a2.10d
END

IF ~~ a2.10d
SAY @135 /* Are you wondering why I'm telling you this? Do you know what I want to accomplish? */
++ @136 /* Forgiveness? */ + a2.11
++ @137 /* You want something from me, I think. */ + a2.12
++ @138 /* No, I have no idea. */ + a2.13
++ @139 /* I don't care. I'm bored, actually. */ + a2.13
END

IF ~~ a2.11
SAY @140 /* I do not need forgiveness, child: I am damned. What I want is your understanding. */
IF ~~ + a2.13
END

IF ~~ a2.12
SAY @141 /* Shrewd, and pragmatic, too, I see. But what I want isn't for myself. */
IF ~~ + a2.13
END

IF ~~ a2.13
SAY @142 /* Thanks to me, you no longer have a mother. But Daemon is still your brother who cares about you, however hotly he denies it. */
= @143 /* When you were a bundle of blankets in my arms, he would come by and look at you. Ask me questions. Maybe he doesn't remember now, but he often asked if we could run away, the three of us, and start a new life somewhere far away. */
= @144 /* To the last he was hoping I would change my mind. Daemon would never admit it now, I know. He blames you for ruining his life, and in his little universe, it is so. */
= @145 /* But it needn't be. Daemon and you are a family, <CHARNAME>. You're his <PRO_BROTHERSISTER>. And Daemon is all you have left of your blood. */
++ @146 /* This guy wants to kill me! */ + a2.14
++ @147 /* He didn't seem very friendly when we met. */ + a2.14
++ @148 /* Imoen and Gorion are my family. Not him. */ + a2.15
++ @149 /* Don't make me laugh. My brothers and sisters are everywhere. */ + a2.15
END

IF ~~ a2.14
SAY @150 /* And? Sarevok sent assassins after you, yet you brought him back to life. */
IF ~~ + a2.15
END

IF ~~ a2.15
SAY @151 /* Oh, you have divine siblings, the ones who fought for you and plotted against you. But once their interests are sated, they will abandon you in a blink. Start a thieves' guild, leave for Kara-Tur... you'll never be a family again. */ 
= @152 /* But Daemon went through the same hell as you did. He lost the only person who cared about him. He spent years on his own, desperate and alone. */
= @153 /* I do not know how loyal he is to Cyric... but his heart, once given, is a powerful gift. He could be your greatest ally. Loyal to you forever... and lonely no more. */
= @154 /* Think on it. And - for everything I've done to you - forgive me. */
IF ~~ DO ~AddJournalEntry(@10004,QUEST) SetGlobal("O#DAEAlianna1","GLOBAL",6) DestroySelf()~ EXIT
END

// Third vision of Alianna, after the quest is done

// 3.

IF ~Global("O#DAEAlianna1","GLOBAL",8)~ a3
SAY @155 /* <CHARNAME>! I was afraid I would come too late... and I am too late, I see. */
= @156 /* I saw what happened between you and Daemon. */
IF ~!Dead("O#DAEMON")~ DO ~AddJournalEntry(@10008,QUEST_DONE)~ + a3.5
IF ~Dead("O#DAEMON")~ DO ~AddJournalEntry(@10006,QUEST_DONE)~ + a3.6
END

IF ~~ a3.questions
SAY @157 /* Now I must go. But I know we have things unsaid between us, so if you wish to ask me anything, now is the time. */
++ @158 /* I have so many questions for you. */ + a3.00
++ @159 /* Goodbye. Don't write. */ + a3.final
END

IF ~~ a3.other
SAY @160 /* Do you have anything else you would like to know? */
++ @161 /* I want to know about the night you died. */ + a3.0a
++ @162 /* Gorion and you. Did you share a bond before, like you wrote? Was he your friend, and, on occasion, lover? */ + a3.0b
+ ~!Dead("O#Daemon")~ + @163 /* Tell me more about your old life with you and Daemon. */ + a3.0c
++ @164 /* How could you? How could you look me in the eye and sacrifice me? */ + a3.0d
++ @165 /* What should I do, mother? At the end of the road, which way should I take? */ + a3.0e
++ @166 /* No more questions. */ + a3.final
END

IF ~~ a3.00
SAY @167 /* Ask your questions. I shall be here for you for as long as I can. */
++ @161 /* I want to know about the night you died. */ + a3.0a
++ @162 /* Gorion and you. Did you share a bond before, like you wrote? Was he your friend, and, on occasion, lover? */ + a3.0b
+ ~!Dead("O#Daemon")~ + @163 /* Tell me more about your old life with you and Daemon. */ + a3.0c
++ @164 /* How could you? How could you look me in the eye and sacrifice me? */ + a3.0d
++ @165 /* What should I do, mother? At the end of the road, which way should I take? */ + a3.0e
++ @166 /* No more questions. */ + a3.final
END

IF ~~ a3.0a
SAY @168 /* Ah, the night Harpers attacked us. My fear, my desperation, Daemon's desire to protect me... */
= @169 /* We were so scared. Daemon was but a child, and with my sisters falling left and right, children screaming, you crying in my arms, I did not know what to do. */
= @170 /* I do not deserve your pity, I know. But he... on that night, I think you would have pitied Daemon. */
= @171 /* A Harper shot him straight through the chest in the first moments of battle. He was lying on the grass, so pale... but I saw him breathing. Terrified. Wanting to live. And terrible fury rose inside me. */
= @172 /* Gorion was at the head of them all, so I unleashed my magic at him. My fury, betrayal, my Lord's divine magic, tried and true; I lost myself in them. Other Deathstalkers fell around me, trying to buy me time. */
= @173 /* I knew there would be no mercy if I lost. And there was none. */
= @174 /* But as I fell, for the briefest moment, I knew peace. Because I would see Lord Bhaal again. Because you and Daemon were alive, and you had your whole lives ahead of you. */
= @175 /* Because I did not have to sacrifice you, after all. */
++ @176 /* So you didn't want to sacrifice me. */ + a3.4a
++ @177 /* We could have been a family. */ + a3.4b
++ @178 /* I regret it had to happen like this. */ + a3.4b
++ @179 /* Sorry, I'm on Gorion's side here. */ + a3.4c
END

IF ~~ a3.4a
SAY @180 /* No, child, of course I did not. What mother would, if she had a choice? What woman? */
IF ~~ + a3.4b
END

IF ~~ a3.4b
SAY @181 /* What I truly wanted was for you to live, to grow up, to laugh at your older brother's jokes, wear homespun shirts and munch on ginger cookies. Become the best assassin of an ancient order, the most infamous ruler, the most intrepid adventurer. */
= @182 /* But you have accomplished even more, I see. */
IF ~~ + a3.4d
END

IF ~~ a3.4c
SAY @183 /* Naturally. Seeing you, I am on Gorion's side, too. */
IF ~~ + a3.4b
END

IF ~~ a3.4d
SAY @184 /* Regret is all that's left for me, now. But for what it's worth, I never regretted that you survived that night. */
IF ~~ + a3.other
END

IF ~~ a3.0b
SAY @185 /* (sigh) So long ago. Before the gods were made flesh and forced to walk the earth. Pendulum swings, and lives are forever changed. */
= @186 /* Gorion's road led him past our farm one day. I brought him some water and invited him to stay the night. My husband was long gone, and Daemon was but a small child; I missed company. And Gorion could carry a conversation like no other. */
= @187 /* He was younger then, with darker hair and a charming smile. His tanned face was lined even then... but he was a man, strong-willed and lean, so I took him to my bed. */
= @188 /* We talked through the night. We talked as the morning came, and as I made us breakfast, and as Daemon woke up... */
= @189 /* We both understood it was not to last. But Gorion's path led to your farm twice more, before Lord Bhaal took me, broke me and remade me, and I forgot all about other men. */
= @190 /* Sometimes I still hear Gorion's voice in my head, laughing, and then I feel cold steel in my heart and know no more. But enough. */
++ @191 /* Did you love him? Gorion? */ + a3.01
++ @192 /* Do you think he regretted killing you after all this? */ + a3.02
++ @193 /* I see. */ + a3.other
++ @194 /* All right, that was way too much information. */ + a3.other
END

IF ~~ a3.01
SAY @195 /* I do not think I did, child. I do not think he did, either. */
= @196 /* But we both saw a moment when it could be. And we let it go. Sometimes you think it's for the best... especially when your son does not like the grey-eyed stranger, and that stranger is a Harper. */
IF ~~ + a3.other
END

IF ~~ a3.02
SAY @197 /* Perhaps. I saw something like pity in his eyes... but by that moment, we were both too far gone, and my elder son was writhing on the ground, white and sweating. */
= @198 /* There was no mercy in our hearts that night. */
IF ~~ + a3.other
END

IF ~~ a3.0c
SAY @199 /* Daemon read to me in the evenings. Our favorite hours were after dinner, when the fire was low, the chores were done, and we sat outside watching the stars. */
= @200 /* I sometimes wondered, which me was real? The one that went about the farm every morning, or the one that read the night sky without a map? Daemon once admitted to me he wondered the very same thing. */
++ @201 /* You two were close. */ + a3.80
++ @202 /* Why did you never visit him as a ghost? He asked about you. */ + a3.80
END

IF ~~ a3.80
SAY @203 /* I wanted to see him so much. My Daemon as a grown man, my son, an equal... */
= @204 /* But I could not. He was only a mortal, exempt from any divine power. You, on the other hand, are a key figure in a grand prophecy. */
= @205 /* When you see him again, tell him that I'm proud of him, and that I've always been proud of him. And of you. */
= @206 /* I wish I could see you two together. I cannot. For Daemon, I must be dead. But you are both strong, my children, and I know you will prevail anywhere. Even against the world, if need be. */
++ @207 /* We'll be all right. */ + a3.83
++ @208 /* I'm not so sure about Daemon. Especially if he keeps attacking castles like that. */ + a3.81
++ @209 /* Oh, I keep winning every time. Someone high above must like me. */ + a3.82
END

IF ~~ a3.81
SAY @210 /* If you talk to him, he'll listen. And some castles just beg to be taken in your name, don't they? */
IF ~~ + a3.83
END

IF ~~ a3.82
SAY @211 /* You are a living woven strand of fate. And while you still are, you cannot lose. */
= @212 /* But be careful, once the days of the prophecy run out. */
IF ~~ + a3.83
END

IF ~~ a3.83
SAY @213 /* When I think of the old days, when Daemon was a child and our life was still blissful... I wish I could show you every single day. */
= @214 /* But Daemon will tell you, when you two meet again. About our fishing trips and going deep into the forests, about the old boat and squeaky boards on its deck. About the kind ranger that taught Daemon archery, and the nasty fat lady that kept talking about her pregnant sister and kept stealing my flowers. About things, big and small, that made the days ours. */
= @215 /* Just know that we were happy back then. And maybe... maybe you could have been, too, if only I was a reasonable girl and married a braver man. */
= @216 /* But it happened as it happened, and seeing you, I cannot regret your heritage. Not one bit. */
IF ~~ + a3.other
END

IF ~~ a3.0d
SAY @217 /* That was a long time ago. */
++ @218 /* Even so. */ + a3.1a
++ @219 /* I know you've changed. But you remember. */ + a3.1a
++ @220 /* Do you have no answer for me? */ + a3.1a
END

IF ~~ a3.1a
SAY @221 /* You know what love is, don't you? That moment, real, true, tangible when you meet someone and realize that you would walk through the fire for him? */
= @222 /* It lasts, that moment. The world turns, and you are there for each other. */
= @223 /* Until one day, you're not. He is dead, they say, and nothing ever makes sense again, except one thing: you need to bring him back. */
++ @224 /* Do you still love him? Bhaal, I mean. */ + a3.1c
++ @225 /* And for that, you needed to sacrifice me. */ + a3.1b
++ @226 /* I might have done the same. */ + a3.1b
++ @227 /* The ends do not justify the means. Not if it means killing a helpless child. */ + a3.1b
END

IF ~~ a3.1b
SAY @228 /* I am sorry. Whatever I say, my only excuse sounds feeble for you, and I know it. But you wanted the truth, and I can only repeat it. I was loved, and then I was alone, and wanted to be lonely no longer. */
IF ~~ + a3.1d
END

IF ~~ a3.1c
SAY @229 /* After all these years, and death, and you? I do. */
IF ~~ + a3.1d
END

IF ~~ a3.1d
SAY @230 /* Now Lord Bhaal is dead. Ao the Overfather decreed it, and even if he did not, no priestess would perform the sacred rite. */
= @231 /* But I still remember. His word, his gaze, the burning fire. You have much of him in you, even if you don't know it. */
++ @232 /* That's a disturbing thought. */ + a3.1e
++ @233 /* Oh? Interesting. */ + a3.1e
++ @234 /* Please stop. */ + a3.1e
END

IF ~~ a3.1e
SAY @235 /* Regardless, I've tried to do the unthinkable. And I am regret now. I dream of that moment; I anticipate it and dread it, and dream of it again. */
= @236 /* Forgive me, <CHARNAME>. If you can. */
++ @237 /* I forgive you, mother. */ + a3.1f
++ @238 /* I cannot. */ + a3.1g
++ @239 /* Let's just speak of other things. */ + a3.00
END

IF ~~ a3.1f
SAY @240 /* ... I will remember this. Always. */
= @241 /* Thank you. */
IF ~~ + a3.other
END

IF ~~ a3.1g
SAY @242 /* Then just know I regret things. And I know how it sounds, but - I love you. */
IF ~~ + a3.other
END

IF ~~ a3.0e
SAY @243 /* You should not hesitate. Seize your heritage and never let go. Or stay and lead a long life full of ashes and regret... but first look at me and ask: would you really want to? */
++ @244 /* I may regret it either way. Leaving my loved ones behind... */ + a3.5a
++ @245 /* What about my friends? */ + a3.5a
++ @246 /* Somehow I knew you would say that. */ + a3.5b
++ @247 /* I will think on this. */ + a3.5b
++ @248 /* Enough about this. I have other questions for you. */ + a3.00
END

IF ~~ a3.5a
SAY @249 /* Your loved ones would never truly leave you. What sort of comrades in arms would they be, if they just stopped loving the one who's literally been to hell and back with them? */
= @250 /* And why would they? Just because you would become so much more than them? Lord Bhaal was many leagues above me, but I would carve my own heart for him regardless. */
++ @251 /* Or, rather, MY heart. */ + a3.5aa
++ @252 /* You may have a point. */ + a3.5b
++ @253 /* I disagree. */ + a3.5b
END

IF ~~ a3.5aa
SAY @254 /* (sigh) You are dead set on reminding me, aren't you? Can't blame you. */
IF ~~ + a3.5b
END

IF ~~ a3.5b
SAY @255 /* You are who you are, my child. Letting go of the taint would change you - and forever more you shall be empty, incomplete. */
= @256 /* I would not want such a fate on anyone. */
IF ~~ + a3.other
END

IF ~~ a3.final
SAY @257 /* Then we part here. My path will take me away... for good, perhaps, but I will think of you always. */
++ @258 /* Where are you going? Heaven? Pandemonium? The Nine Hells? Fugue Plane? Carceri? */ + a3.2
++ @259 /* I can't believe I'm saying this, but I'll miss you. */ + a3.1
++ @260 /* All right. Go with my blessings. */ + a3.final1
++ @261 /* Finally. */ + a3.final1
END

IF ~~ a3.1
SAY @262 /* And I will miss you more than you know. When Gorion tore you out of my hands, he did us both a great favor. */
IF ~~ + a3.final1
END

IF ~~ a3.2
SAY @263 /* I do not want you to know, child. It is not a friendly place. But I will find my redemption, in time. */
IF ~~ + a3.final1
END

IF ~~ a3.5
SAY @264 /* I am happy. You stayed your hand, and you made peace. Somehow, things will be all right. */
IF ~~ + a3.55
END

IF ~~ a3.55
SAY @265 /* I do not know what lives you are going to lead. But I feel it in my bones that both of my children will be alive, and safe, and happy. */
++ @266 /* You think Daemon will ever be happy? */ + a3.555a
++ @267 /* Tell that to the people in Nalia's Keep. Daemon ripped the place apart. */ + a3.555b
++ @268 /* We'll see. But I'm glad I didn't kill Daemon. */ + a3.555c
END

IF ~~ a3.555a
SAY @269 /* Who knows? Nobody knows. But I'd like you to find out. */
IF ~~ + a3.555c
END

IF ~~ a3.555b
SAY @270 /* Just as you ripped Firkraag's lair apart. Or the troll village near Trademeet. It all depends on the point of view. And Daemon haven't killed anyone, at least. */
IF ~~ + a3.555c
END

IF ~~ a3.555c
SAY @271 /* I watched your conversation from afar. If my heart could beat, it would stop in horror. */
= @272 /* I know how different you are. I know the two of you have a long road to walk before you can truly call Daemon brother. But I am glad he is on your side. */
IF ~~ + a3.questions
END

IF ~~ a3.6
SAY @273 /* If only lights were brighter or dimmer, or the dice rolled differently, Daemon would be standing here instead of you. */
++ @274 /* That is self-delusion. I was stronger. */ + a3.6a
++ @275 /* Perhaps. */ + a3.6b
++ @276 /* Do you hate me now? */ + a3.6b
++ @277 /* I had no other choice. I had to defend myself. */ + a3.6c
END

IF ~~ a3.6a
SAY @278 /* In your eyes, yes. You're the hero of your story. But Daemon was the hero, too - of his. */
= @279 /* And now his story's over. */ 
IF ~~ + a3.6b
END

IF ~~ a3.6b
SAY @280 /* I close my eyes and I see his smile, hear his voice... and I know I'll never hold him in my arms again. */
= @281 /* Never. */
= @282 /* Everything feels so ironic. I wanted to slay you, my child - and my beloved elder son is taken from me. Is this my punishment? I do not know, but I... I feel empty. */
= @283 /* I could never hate you, but I would never stop mourning Daemon, either. It is a sad day - and a sad afterlife that awaits me. */
IF ~~ + a3.questions
END

IF ~~ a3.6c
SAY @284 /* He gave you a choice. You just didn't take it. */
IF ~~ + a3.6b
END

IF ~~ a3.final1
SAY @285 /* I... */
IF ~!Dead("O#DAEMON")~ + a3.lastnotdead
IF ~Dead("O#DAEMON")~ + a3.lastdead
END

IF ~~ a3.lastnotdead
SAY @286 /* So many things I would like to say to you. To Daemon. But... */
= @287 /* Goodbye. One day, perhaps, I shall be allowed to speak to you both. */
= @288 /* But this day hasn't yet come, so - until then. */
IF ~~ DO ~EraseJournalEntry(@10000)
EraseJournalEntry(@10001)
EraseJournalEntry(@10002)
EraseJournalEntry(@10003)
EraseJournalEntry(@10004)
EraseJournalEntry(@10005)
EraseJournalEntry(@10007)
SetGlobal("O#DAEAlianna1","GLOBAL",9) DestroySelf()~ EXIT
END

IF ~~ a3.lastdead
SAY @289 /* Be well, my child. I hope your fate will be better than mine. */
IF ~~ DO ~EraseJournalEntry(@10000)
EraseJournalEntry(@10001)
EraseJournalEntry(@10002)
EraseJournalEntry(@10003)
EraseJournalEntry(@10004)
EraseJournalEntry(@10005)
SetGlobal("O#DAEAlianna1","GLOBAL",9) DestroySelf()~ EXIT
END

END

// Gorion, back in the Pocket Plane

BEGIN O#DAEGOR

APPEND O#DAEGOR

IF ~Global("O#GorionTalk","GLOBAL",2)~ g1
SAY @290 /* Hello, my child. */
++ @291 /* Gorion? Is this really you this time? */ + g1.1
++ @292 /* I've been dreaming of these words. */ + g1.4
++ @293 /* Hey, you. Yep, Abyss, Pocket Plane, that's me. Did you ask Cespenar for directions? */ + g1.2
++ @294 /* Oh, gods, not you again. */ + g1.3
++ @295 /* Do not call me that! */ + g1.3
END

IF ~~ g1.1
SAY @296 /* It is me. No demon or apparition could have made it here, to the heart of your domain. Only the challenges you set for yourself. */
IF ~~ + g1.4
END

IF ~~ g1.2
SAY @297 /* Still the same indomitable spirit, I see. It warms my heart to see you unchanged. */
IF ~~ + g1.4
END

IF ~~ g1.3
SAY @298 /* We've had our differences, but I am not going to let them cloud our last meeting. I have words for you. */
IF ~~ + g1.4
END

IF ~~ g1.4
SAY @299 /* The gods felt it was fair to grant us this meeting, after you met your own mother. How are you? */
++ @300 /* I'm... all right. Not perfect, but all right. */ + g1.5
++ @301 /* After everything that happened? Overwhelmed, to say the least. */ + g1.5
++ @302 /* Hurting. My family in shambles, and then I saw my mother... */ + g1.5
++ @303 /* Does it matter? Just say your piece. */ + g1.6
END

IF ~~ g1.5
SAY @304 /* You are strong, my child. I saw it in you as you grew up, as you opened your very first books with villains and heroes. I longed to tell you this: with years, you would overshadow them all, if only you would remember what was right and fair. */
IF ~~ + g1.6
END

IF ~~ g1.6
SAY @305 /* I cannot fault your choices. Sarevok was to drown the Sword Coast in blood, Imoen was kidnapped, your very soul was stolen - you did what you had to. I love you, <CHARNAME>, whether you be a hero or a villain of your own tale. */
= @306 /* But I come with a warning. Soon you will have to make a choice, once that maybe will change the Realms forever. */
= @307 /* Be wise, my child. And be strong. */
++ @308 /* Thank you. I will try to be. */ + g1.7
++ @309 /* Choice? What choice? */ + g1.8
++ @310 /* Cryptic words and vague warnings again. Can't you tell anything useful? */ + g1.8
++ @311 /* You're not getting off the hook so easily. We WILL talk. */ + g1.8
END

IF ~~ g1.7
SAY @312 /* I have always been proud of you. Candlekeep scholars will be telling tales about your deeds for the years to come. But it is for you to decide which ones. */
++ @313 /* I am sure it will be fine. */ + g1.10a
++ @314 /* Up to me! Please! Those storytellers never listen when I try to explain that it's never my fault! */ + g1.10a
++ @315 /* Good and evil. Again. Boo-ring! */ + g1.10a
END

IF ~~ g1.8
SAY @316 /* I cannot say more than I have. But... there is one thing. */
= @317 /* There is a life with your loved ones waiting for you here. Do not rush to abandon it. */
++ @318 /* My thoughts exactly. I just wish I could leave the war behind. */ + g1.10a
++ @319 /* I will decide myself, thanks. */ + g1.10a
++ @320 /* Loved ones? Please. Nobody ever loved me, not even you. */ + g1.10b
END

IF ~~ g1.10a
SAY @321 /* We all must do what we must with the time we are given. I regret that I can say no more. */
IF ~~ + g1.10
END

IF ~~ g1.10b
SAY @322 /* I will always love you, <CHARNAME>. Though you are a child no longer, you are always in my thoughts. */
IF ~~ + g1.10
END

IF ~~ g1.10
SAY @323 /* Much has happened to you recently. The Bhaalspawn war, the choice that will soon be upon you... But another thought plagues my mind. */
= @324 /* I am uneasy about the happenings in de'Arnise castle. You've met your brother, and came through many revelations. */
++ @325 /* Yes, starting with you. Why haven't you told me who I was, Gorion? Why? */ + g1.13a
++ @326 /* My mother told me the truth, for one. */ + g1.12
++ @327 /* Actually, my revelations started when I found a certain letter at Candlekeep. And then there was Irenicus, who said that Imoen was my sister. And then the Solar said you killed my mother. You never told me any of this! */ + g1.13
++ @328 /* Indeed I have. But you concealed it from me. */ + g1.13
++ @329 /* I've been waiting for this conversation for a long time. */ + g1.12a
END

IF ~~ g1.12
SAY @330 /* I doubt it was the whole truth. And yet... */
IF ~~ + g1.14
END

IF ~~ g1.12a
SAY @331 /* So have I. I saw you through the mirrors of time and space, and all I heard was "why?" "Why didn't you tell me?" */
IF ~~ + g1.13a
END

IF ~~ g1.13
SAY @332 /* Yes, I... */
IF ~~ + g1.14
END

IF ~~ g1.13a
SAY @285 /* I... */
IF ~~ + g1.14
END

IF ~~ g1.14
SAY @333 /* I could not do this to you, <CHARNAME>. You were a child, a <PRO_GIRLBOY> with shining eyes and unruly hair. And then you entering adolescence, becoming restless, rash and full of doubts. */
= @334 /* Whenever I looked at you, all I could see in my mind was your terror. Your eyes becoming wide and frightened with dark knowledge, your lips trembling... */
= @335 /* Being little more than a child, you would share that knowledge with others. Half the Keep would treat you like a monster, and another half would turn us out. Ulraunt granted us refuge, but our trust was fragile, and you were too strong-willed for him to handle. */
= @336 /* But those are just lamentations of an old man. I could not do this to you - and that is all there is to it. */
++ @337 /* It was my life! You could have told me when I turned sixteen, at least. */ + g1.16
++ @338 /* And that gave you the right to keep me in the dark? */ + g1.16
++ @339 /* I disagree. Strongly. But I believe you have done your best. */ + g1.15
++ @340 /* You gave your life for me. I believe you had the best intentions in mind, even though it did not work out like you hoped. */ + g1.15
++ @341 /* I understand, Gorion. You cared. */ + g1.15
END

IF ~~ g1.15
SAY @342 /* Thank you, child. It means much to me. */
IF ~~ + g1.17
END

IF ~~ g1.16
SAY @343 /* Then I hope you will forgive me one day. */
IF ~~ + g1.17
END

IF ~~ g1.17
SAY @344 /* As for Sarevok... */
++ @345 /* I never had a chance to thank you for saving me that night outside of Candlekeep. Thank you, Gorion. */ + g1.18a
+ ~!Dead("Sarevok")~ + @346 /* I brought him back to life. Does that bother you? */ + g1.18
+ ~InParty("Sarevok")~ + @347 /* He is a useful ally and a friend. */ + g1.18
++ @348 /* What about him? */ + g1.18
END

IF ~~ g1.18a
SAY @349 /* I would do it again, child. I wanted to protect you with my life, and I did. */
= @350 /* But you have grown, and need my help no longer. */
IF ~~ + g1.18
END

IF ~~ g1.18
SAY @351 /* I was afraid revenge would poison your heart. I only wanted you to be safe. You stopped Sarevok's plans, but you did not become him, and for that, I am grateful. */
= @352 /* As for bringing him back to life... it was your choice, <CHARNAME>, if you even had a choice in the matter. And I trust you made a wise one. Everyone in this wide world deserves a second chance. */
= @353 /* Even, perhaps, your mother. */
++ @354 /* I expected to find a fanatic. But she seemed remorseful. */ + g1.19
++ @355 /* She was not what I was expecting. */ + g1.19
++ @356 /* It pains me to know you killed her. */ + g1.20
++ @357 /* I do not know what I would have done in her shoes. Back then, when her lover, Bhaal, was gone. */ + g1.21
++ @358 /* She wanted to kill me. I am grateful to you for saving me. End of story. */ + g1.22
END

IF ~~ g1.19
SAY @359 /* Every person is a hero of their story, in their eyes. But only the eyes of others can truly judge us. */
= @360 /* I, too, have my memories. And I will never forget how frightened I was for you, helpless before the sharp knife in her hand. */
= @361 /* We knew each other before she became a fanatic priestess of Bhaal. She was a gentle and a loving woman then. We... were close once. */
= @362 /* But that was a long time ago, and on the night she died, every shred of good in her evaporated. I looked into her eyes and saw no trace of the girl I used to know. */
= @363 /* I am sorry for killing your mother, <CHARNAME>. But when I say she gave me no choice, I say this honestly. */
IF ~~ + g1.24
END

IF ~~ g1.20
SAY @364 /* I would have done otherwise, if I could. Restrain her, if I dared. But there was no time. A second's hesitation would've cost you your life. */ 
IF ~~ + g1.23
END

IF ~~ g1.21
SAY @365 /* Torn with grief and desire to do right. But you would have not done the same as her. Love does not kill; love does not murder. */
IF ~~ + g1.23
END

IF ~~ g1.22
SAY @366 /* If that is all there is to say. But she came to warn you of your brother, <CHARNAME>. Despite Ao's edict, she risked her afterlife and her very soul. */
IF ~~ + g1.24
END

IF ~~ g1.23
SAY @367 /* As for your mother's remorse... I do not know if it was genuine, child. But I know one thing. */
IF ~~ + g1.19
END

IF ~~ g1.24
SAY @368 /* But as if your mother's ghost was not enough, you had to face another. Your elder brother, who was jealous of you, and spent many years nursing his hatred. Too many, I fear. */
+ ~Dead("O#Daemon")~ + @369 /* Yes, and I did not just face him. I killed him. */ + g1.26
+ ~Dead("O#Daemon")~ + @370 /* Was I right when I dealt the killing blow? */ + g1.26
+ ~!Dead("O#Daemon")~ + @371 /* I did face him. It was a revelation. */ + g1.25
+ ~!Dead("O#Daemon")~ + @372 /* We are family now. A strange family, granted, but still. */ + g1.25
END

IF ~~ g1.25
SAY @373 /* I do not know what becomes of you and him. But I am glad that young man was able to put his hatred aside. */
IF ~~ + g1.27
END

IF ~~ g1.26
SAY @374 /* Were you in the right? That I cannot know. Only your heart and your own regret will tell you whether your choice was true, in time. */
IF ~~ + g1.27
END

IF ~~ g1.27
SAY @375 /* So strange, the way our fortunes twist and turn. I remember the clearing where we fought the remaining priesthood of Bhaal. Two boys survived. */
= @376 /* One, Sarevok, nearly started a war, and another, Daemon, led one of Cyric's most dangerous cults. And it was partly my fault. */
++ @377 /* Imagine what I could have done, were I not raised by you. And I defeated them both. */ + g1.28
++ @378 /* You have done your best, Gorion. And I am grateful. */ + g1.28
++ @379 /* Yes, it was. */ + g1.28a
++ @380 /* The Harpers should have done something. They were worse than the cultists. */ + g1.28a
END

IF ~~ g1.28
SAY @381 /* You have grown into an unstoppable force, my child. I only have one wish: make it a force for good. */
IF ~~ + g1.29
END

IF ~~ g1.28a
SAY @382 /* Alas. I am truly sorry, my child. */
IF ~~ + g1.29
END

IF ~~ g1.29
SAY @383 /* My time here grows short. I fear we must say our goodbyes now, while we can. */
++ @384 /* Will I ever see you again? */ + g1.32
++ @385 /* I am glad you came. */ + g1.33
++ @386 /* Farewell. */ + g1.35
++ @387 /* Why did you come? */ + g1.30
++ @388 /* Goodbye, Gorion. I love you. */ + g1.31
END

IF ~~ g1.30
SAY @389 /* I came tonight because I felt you needed warmth, and support, and a warning - about trials and choices that stand before you. And because I miss you every day. */
IF ~~ + g1.35
END

IF ~~ g1.31
SAY @390 /* My thoughts shall always be with you, child. Whatever happens. */
IF ~~ + g1.35
END

IF ~~ g1.32
SAY @391 /* Not until this ordeal is done, and your destiny complete. All must step aside before it, myself first of all. But I believe in you. */
IF ~~ + g1.35
END

IF ~~ g1.33
SAY @392 /* Even if only to wish you a very fond farewell. */
IF ~~ + g1.35
END

IF ~~ g1.35
SAY @393 /* Be brave, my child. Be happy. */
IF ~~ DO ~SetGlobal("O#GorionTalk","GLOBAL",3)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#DECut4")~ EXIT
END

END

BEGIN O#DAEMON 

APPEND O#DAEMON

// Daemon, the main hall

// 1.

IF ~Global("O#DaemonTalk1","GLOBAL",2)~ d1
SAY @394 /* So, this is you? A scrawny <PRO_GIRLBOY> with a few shiny baubles? Pah. */
++ @395 /* Not impressed, huh? */ + d1.1
++ @396 /* Who the hell are you? */ + d1.2
++ @397 /* You're the guy in black, right? The one that leads the invasion? */ + d1.3
++ @398 /* Know me by my best name, mortal. You face <CHARNAME>, a Child of Bhaal! */ + d1.1a
END

IF ~~ d1.1
SAY @399 /* You don't know half of it, and now you never will. */
IF ~~ + d1.4
END

IF ~~ d1.1a
SAY @400 /* Ah, yes, posturing. Do all your enemies have to hear that? */
IF ~~ + d1.4
END

IF ~~ d1.2
SAY @401 /* Me? I am the bad guy. The one who steps on your throat in the end. */
IF ~~ + d1.4
END

IF ~~ d1.3
SAY @402 /* The one and only. */
IF ~~ + d1.4
END

IF ~~ d1.4
SAY @403 /* But this shouldn't concern you. You know the mistake all the villains make? They start talking, and bragging, and asking questions. I'll just kill you and save the bragging for the moment you're writhing on the floor. */
IF ~~ + d1.5
IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID) Alignment("Sarevok",MASK_EVIL)~ EXTERN SAREV25J DAEMON1
IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID) !Alignment("Sarevok",MASK_EVIL)~ EXTERN SAREV25J DAEMON4
END

IF ~~ d1.5
SAY @404 /* To arms. Let's see this fabled Bhaal blood of yours! */
IF ~~ DO ~AddJournalEntry(@10002,QUEST) SetGlobal("O#DaemonTalk1","GLOBAL",3) Enemy() CreateCreatureObject("GOLBUR01",Myself,0,0,0) CreateCreatureObject("GOLBUR01",Myself,0,0,0)~ EXIT
END

IF ~Global("O#DaemonTalk1","GLOBAL",5)~ d1.last
SAY @405 /* Damn you! Well, this is not over. We shall see each other very soon... <PRO_BROTHERSISTER>. */
IF ~~ DO ~SetGlobal("O#DaemonTalk1","GLOBAL",6) ApplySpell(Myself,DRYAD_TELEPORT)~ EXIT 
END

// 2, after second talk with Alianna

IF ~Global("O#DaemonTalk2","GLOBAL",2)~ d2
SAY @406 /* And here <PRO_HESHE> comes again. Do my eyes deceive me? Were you talking to my mother? */
++ @407 /* Our mother, Daemon. */ + d2.1
++ @408 /* I was, and I learnt the truth. You are my brother. */ + d2.1
++ @409 /* Let me get this straight. You are no Child of Bhaal, but we share a mother. Right? */ + d2.1
END

IF ~~ d2.1
SAY @410 /* You. Spoke. To my mother. */
= @411 /* How many times I longed for her voice? Her hand in my hair? She was slain so many years ago, and in all that time I never heard as much as a whisper! */
= @412 /* And then you come, brazen as you please, and brag about your long and fulfilling conversation. Gods, how I hate you. */
++ @413 /* What have I ever done to you? */ + d2.2
++ @414 /* Jealous that mommy loves me more? */ + d2.2
++ @415 /* We were talking about you, actually. */ + d2.3
++ @416 /* Brother... */ + d2.4
END

IF ~~ d2.2
SAY @417 /* Fool. */
IF ~~ + d2.5
END

IF ~~ d2.3
SAY @418 /* So she was discussing me with you behind my back. Lovely. */
IF ~~ + d2.5
END

IF ~~ d2.4
SAY @419 /* Don't you dare call me that. Not you. */
IF ~~ + d2.5
END

IF ~~ d2.5
SAY @420 /* We had a simple, sheltered life. I had a family, a house, a fire in the grate, a place to come home to! */
IF ~~ + d2.5a
IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ EXTERN IMOEN25J DAEMON1
END

IF ~~ d2.5a
SAY @421 /* And then came you. You. Many years ago, but I remember it all too well. */
++ @422 /* Now I'm starting to understand why you hate me. */ + d2.5e
++ @423 /* I was a baby. What happened wasn't my choice. */ + d2.5b
++ @424 /* You are blaming the wrong person, you know. */ + d2.5b
++ @425 /* Poor you. */ + d2.5b
END

IF ~~ d2.5e
SAY @426 /* Understanding comes with respect, they say. But we hardly have any for each other, do we? */
IF ~~ + d2.5b
END

IF ~~ d2.5b
SAY @427 /* Whatever you were, however old you were, you took my mother from me. You brought the Harpers to that glade. You caused my mother's death, and you escaped with Gorion. */
= @428 /* You broke our family; you grew up cherished and educated while I starved on the streets. It was you. All you. */
= @429 /* And now you stand before me, the champion of the Sword Coast and the fabled savior of the elven city, and I have nothing. I cannot even have a word from the lips of my mother, the only person who ever loved me. And you would dare say you had nothing to do with this? */
++ @430 /* That's very unfair. */ + d2.6
++ @431 /* None of this was my fault! */ + d2.6
++ @432 /* My life wasn't idyllic, either. I resented Gorion. I would have saved my mother, if I could. */ + d2.6
++ @433 /* Yes, it was me. I am sorry. */ + d2.6
++ @434 /* I wish our lives were different. But I am as much a victim as you are. */ + d2.6
++ @435 /* And now you're whining like a spoilt child. Grow up and deal with it. */ + d2.5f
++ @436 /* You're talking like I should care. What are you to me? */ + d2.5f
END

IF ~~ d2.5f
SAY @437 /* I don't know why I'm even explaining myself to you. I should just snap your neck and be done. */
IF ~~ + d2.7
END

IF ~~ d2.6
SAY @438 /* Words, words, words. Worth less than air, less than dirt. Whatever you've said, whatever you'll say - it pales before one simple thing. */
= @439 /* If not for you, my mother would have been alive. If not for you, my life would have turned out quite differently. */
IF ~~ + d2.7
END

IF ~~ d2.7
SAY @440 /* (sigh) Yet here you stand, my gut burns with bile, but I linger. */
IF ~~ + d2.77
IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID) Alignment("Sarevok",MASK_EVIL)~ EXTERN SAREV25J DAEMON2
IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID) !Alignment("Sarevok",MASK_EVIL)~ EXTERN SAREV25J DAEMON5
END

IF ~~ d2.77
SAY @441 /* Mother. What did she say? */
++ @442 /* Interested, aren't you? */ + d2.7a
++ @443 /* That we were family. That she didn't want me to kill you. */ +d2.7b
++ @444 /* It doesn't matter. I am going to kill you now. */ + d2.7c
END

IF ~~ d2.7a
SAY @445 /* I am. Surprised? */ 
++ @446 /* Not really. But she didn't say much. Mostly she just defended you. */ + d2.7b
++ @447 /* She said that she loved us both and didn't want us to fight. */ + d2.7b
++ @448 /* No, I just don't care. Defend yourself, Cyricist! */ + d2.7c
END

IF ~~ d2.7b
SAY @449 /* Did she? Then she... */
= @450 /* No. That does not change anything. Actually, it should only make me hate you more. */
++ @451 /* Should? */ + d2.7bb
++ @452 /* But does it? */ + d2.7bb
++ @453 /* I do not hate you, Daemon. */ + d2.7bb
++ @454 /* Then we fight. */ + d2.7c
END

IF ~~ d2.7bb
SAY @455 /* Do you think a few loving words can criss-cross years of loathing? Bah. */
= @456 /* Nothing can. Even her voice. Even if you're telling the truth... even if it's really her... */
IF ~~ + d2.7e
END

IF ~~ d2.7c
SAY @457 /* Oh, I do intend to fight you - and kill you, mark my words. But before you die, I need to know. */
IF ~~ + d2.7e
END

IF ~~ d2.7e
SAY @458 /* Why you? Why would she risk everything and come to you, not me? */
++ @459 /* Maybe she felt guilty for trying to kill me. */ + d2.7f
++ @460 /* You are a mortal, I am a child of a god. */ + d2.7f
++ @461 /* She couldn't, I think. The Solar called her to life only a short time ago. She must have been in some sort of limbo before. */ + d2.7f
++ @462 /* I have no idea. Does it matter? */ + d2.7g
++ @463 /* Perhaps I'm her favorite child. */ + d2.7h
END

IF ~~ d2.7f
SAY @464 /* It makes sense, but whatever reason... */
IF ~~ + d2.7i
END

IF ~~ d2.7g
SAY @465 /* Aren't you even a little bit curious? If all Bhaalspawn are as thick as you, no wonder Saradush was butchered so easily. */
IF ~~ + d2.7i
END

IF ~~ d2.7h
SAY @466 /* Oh, ha-ha-ha. */
IF ~~ + d2.7i
END

IF ~~ d2.7i
SAY @467 /* I want to talk to her. I want to see her. I... */
= @468 /* I need to find her. One of my men said he saw a ghost on the lower levels. If she's going to be here in the castle for as long as you are here, then perhaps I have a chance. */
++ @469 /* Hey, where are you going? */ + d2.7j
++ @470 /* Oh, very nice. Abandoning your mortal enemy to have a nice cosy talk with Mom. */ + d2.7j
++ @471 /* I'll come with you. */ + d2.7k
END

IF ~~ d2.7j
SAY @472 /* Killing you can wait. */
IF ~~ + d2.7last
END

IF ~~ d2.7k
SAY @473 /* So you could stab me in the back? Nice try, but no. */
IF ~~ + d2.7last
END

IF ~~ d2.7last
SAY @474 /* Enjoy the castle. I'll see you when I see you. To the lower levels! */
IF ~~ DO ~AddJournalEntry(@10005,QUEST) SetGlobal("O#DaemonTalk2","GLOBAL",3) ApplySpell(Myself,DRYAD_TELEPORT)~ EXIT 
END

// 3.

IF ~Global("O#DaemonTalk3","GLOBAL",2)~ d3
SAY @475 /* Mother wasn't in the basement. She wasn't anywhere. This is pointless. */
++ @476 /* Very. Let's kill each other already and go home. */ + d3.1
++ @477 /* Look, I'm the chosen one. Maybe she got permission to talk to me, but not to you. */ + d3.2
++ @478 /* Sorry. Looks like luck isn't on your side. */ + d3.3
++ @479 /* You will stop hiding from me! */ + d3.4
END

IF ~~ d3.1
SAY @480 /* Fine with me. */
IF ~~ + d3.5
END

IF ~~ d3.2
SAY @481 /* Rub your superiority in my face a little more, wouldn't you? */
IF ~~ + d3.5
END

IF ~~ d3.3
SAY @482 /* Yeah, like you've ever felt sorry about anything, the golden <PRO_GIRLBOY> of the Sword Coast. */
IF ~~ + d3.5
END

IF ~~ d3.4
SAY @483 /* Who's hiding? */
IF ~~ + d3.5
END

IF ~~ d3.5
SAY @484 /* I was so careful when I started this attack. I gave those idiots enough time to escape; I've done everything to avoid deaths, lure you in and not to attract outside attention. And all for naught. */
IF ~~ + d3.5a
IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID) Alignment("Sarevok",MASK_EVIL)~ EXTERN SAREV25J DAEMON3
IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID) !Alignment("Sarevok",MASK_EVIL)~ EXTERN SAREV25J DAEMON6
END

IF ~~ d3.5a
SAY @485 /* Even if I strike you down where you stand, I'll never see my mother again. And if your words are to be believed, killing you was not what she wanted anyway. */
++ @486 /* Strange days. */ + d3.6
++ @487 /* What do you want to do, anyway? */ + d3.7
++ @488 /* ENOUGH! We'll fight here and now, understand? */ + d3.fight
END

IF ~~ d3.6
SAY @489 /* You're telling me. */
IF ~~ + d3.7
END

IF ~~ d3.7
SAY @490 /* My mother wants me to think of you as family. Strange, isn't it? */
++ @491 /* Kind of. */ + d3.8
++ @492 /* Until today, I did not even know you existed. */ + d3.8c
++ @493 /* Believe me, after an entire city of siblings, nothing surprises me anymore. */ + d3.8b
END

IF ~~ d3.8b
SAY @494 /* Pff. I should consider myself lucky I'm not a Bhaalspawn, I imagine. */
IF ~~ + d3.8
END

IF ~~ d3.8c
SAY @495 /* I guess it is rather one-sided. You knew not of me, and I knew of you, but I never knew you. */
IF ~~ + d3.8
END

IF ~~ d3.8
SAY @496 /* I've been obsessed with killing you. I even came near Candlekeep for that very purpose, did you know? */
= @497 /* I was barely twelve then. I slept in wet grass, and the sirens on the shore had nearly been the death of me. Alas, Gorion hid you too well, but I regret nothing. I tried. */
IF ~~ + d3.8a
IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ EXTERN JAHEI25J DAEMON1
END

IF ~~ d3.8a
SAY @498 /* But sometimes I wondered, when the fire was low, the ground was hard and I had no one to turn to. What if we grew up together as siblings, alone against the whole world? What would my life be like? Yours? */
++ @499 /* I often wondered that about my life, myself. */ + d3.10
++ @500 /* Interesting. And dangerous, I'm sure. */ + d3.10
++ @501 /* Thanks, but no thanks. */ + d3.10
++ @502 /* I had Imoen. She was a fine sister and a good friend. */ + d3.9
++ @503 /* Better you than Imoen. I've had enough of that girl. */ + d3.9
END

IF ~~ d3.9
SAY @504 /* Believe it or not, I have no idea who that is, and neither do have I any desire to find out. */
IF ~~ + d3.10
IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ EXTERN IMOEN25J DAEMON4
END

IF ~~ d3.10
SAY @505 /* You were luckier than me, I imagine: in your blissful childhood, you had friends. I had no one. None but Cyric would have me. */
= @506 /* So I had a very good reason to wonder and dream... hope that life would be a little kinder on me, perhaps. But there was little point. */ 
++ @507 /* And you turned to Cyric. */ + d3.11
++ @508 /* Sorry to hear that. */ + d3.11
++ @509 /* Seriously, will you stop whining? Let's FIGHT already! */ + d3.fight
END

IF ~~ d3.11
SAY @510 /* Cyric found me when I barely turned fourteen. True, most of his flock are rabid and senseless, but I saw the Prince of Lies in my dreams, and he appeared quite lucid. That, and he allows for certain... volatility in his favored agents. */
++ @511 /* So, you joined Cyric because of the wine, gold and girls? */ + d3.16
++ @512 /* Cyric won't help you. I've beaten you once, and I'll beat you again. */ + d3.17
++ @513 /* That's a betrayal, isn't it? Our family line was faithful to Bhaal. */ + d3.18
END

IF ~~ d3.16
SAY @514 /* And revenge. Never forget revenge, dear <PRO_BROTHERSISTER>. */
IF ~~ + d3.19
END

IF ~~ d3.17
SAY @515 /* Pah. */
IF ~~ + d3.19
END

IF ~~ d3.18
SAY @516 /* Beggars cannot be choosers, <PRO_BROTHERSISTER>. And I needed to find you. */
IF ~~ + d3.19
END

IF ~~ d3.19
SAY @517 /* So. Here we stand, you and me. */
IF ~~ + d3.19a
IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ EXTERN IMOEN25J DAEMON2
END

IF ~~ d3.19a
SAY @518 /* What do we do? */
++ @519 /* I do not want to kill you. */ + d3.nofight
++ @520 /* We fight to the death. No second chances, you die. */ + d3.fight
END

IF ~~ d3.nofight
SAY @521 /* You would just let me go? I have attacked Nalia's castle, have you forgotten? With a demon army, no less. */
++ @522 /* Speaking of which, how's that demon army? */ + d3.20
++ @523 /* I haven't forgotten. */ + d3.20
++ @524 /* That's pretty cool, actually. How did you manage that? */ + d3.20
END

IF ~~ d3.20
SAY @525 /* Yes, about that... */
= @526 /* You see, when I said I had a demon army, I might have exaggerated the part about it being at my command. */
++ @527 /* Uh-oh. */ + d3.22
++ @528 /* And what does THAT mean? */ + d3.22
++ @529 /* Okay, I changed my mind. I am going to strangle you right now, brother. */ + d3.21
END

IF ~~ d3.21
SAY @530 /* Too late, <CHARNAME>. We're in the same boat now. */
IF ~~ + d3.22
END

IF ~~ d3.22
SAY @531 /* Well, I... accidentally summoned a couple of extra succubi. Sort of. With no extra purposes whatsoever. */
= @532 /* Why are you looking at me? The spell just went out of control, all right? It's quiet here now, but I have no idea when the portal is going to appear, so they might start rampaging at any moment. */
++ @533 /* And now I have to clean up your mess. Thank you very much, brother. */ + d3.23
++ @534 /* What, you wanted to get laid that badly? */ + d3.23
++ @535 /* (sigh) All right, let's deal with your demons. */ + d3.24
END
 
IF ~~ d3.23
SAY @536 /* Well, nobody is perfect. */
IF ~~ + d3.24
END

IF ~~ d3.24
SAY @537 /* I'll help you from the shadows. Be ready. */
IF ~~ DO ~AddJournalEntry(@10007,QUEST) SetGlobal("O#DaemonTalk3","GLOBAL",3) DestroySelf()~ EXIT 
END

IF ~~ d3.fight
SAY @538 /* Very well. At your service. */
= @539 /* Now, to arms! And may the best one win. */
IF ~~ DO ~DestroyItem("minhp1")
CreateCreatureObject("GOLBUR01",Myself,0,0,0)
CreateCreatureObject("hgmis01",Myself,0,0,0)
CreateCreatureObject("demosum1",Myself,0,0,0)
CreateCreatureObject("elairg01",Myself,0,0,0)
CreateCreatureObject("telalu1",Myself,0,0,0)
SetGlobal("O#DaemonTalk3","GLOBAL",100)
SetGlobal("O#DaemonTalk4","GLOBAL",100)
Enemy()~ EXIT 
END

// 4.

IF ~Global("O#DaemonTalk4","GLOBAL",2)~ d4
SAY @540 /* Phew! Well, thanks for helping. */
++ @541 /* Those demons? Just an ordinary day for me. */ + d4.1
++ @542 /* Anytime. Hot girls, bad boys – what's not to like? */ + d4.2
++ @543 /* Is that all? No more demons? */ + d4.3
END

IF ~~ d4.1
SAY @544 /* Aaand my dear <PRO_BROTHERSISTER> is bragging again. Why am I not surprised? */
IF ~~ + d4.3
END

IF ~~ d4.2
SAY @545 /* Well, glad you liked the adventure, at any rate. */
IF ~~ + d4.3
END

IF ~~ d4.3
SAY @546 /* No more demons, the castle is safe, and it is time for us to... what, actually? What do we do now? */
++ @547 /* You can go, if you wish. */ + d4.4
++ @548 /* We'll stay in touch, I hope. I'd like to know you better. */ + d4.5
++ @549 /* Whatever should I do with a crazy stranger-assassin who tried to invade my friend's castle? Oh, wait, the guy is also my brother? And I'm going to unleash him on the unsuspecting world? I must be nuts. */ + d4.6
++ @550 /* Finally, I get to kill you. */ + d4.fight
END

IF ~~ d4.fight
SAY @551 /* Truly? I thought... but never mind. */
IF ~~ + d3.fight
END

IF ~~ d4.4
SAY @552 /* Why, thank you so much, oh magnanimous <PRO_BROTHERSISTER> of mine. Truly, I cannot find words fitting for the occasion. I am free to go! Oh, however shall I repay you? */
++ @553 /* Hey, stop that! */ + d4.4a
++ @554 /* Oh, I take all forms of currency. */ + d4.6
++ @555 /* Be my friend. It could work. */ + d4.5
END

IF ~~ d4.4a
SAY @556 /* Not a chance. */
IF ~~ + d4.7
END

IF ~~ d4.5
SAY @557 /* That... doesn't sound too bad, come to think of it. */
IF ~~ + d4.7
END

IF ~~ d4.6
SAY @558 /* Hey, so you are not totally hopeless. Good to know. */
IF ~~ + d4.7
END

IF ~~ d4.7
SAY @559 /* You truly think it would work, you and I? A family? */
++ @560 /* Maybe. Join my party, let's figure it out. */ + d4.8
++ @561 /* Not right away. But one day, maybe. */ + d4.9
++ @562 /* We could try writing to each other. Talking, maybe. Then we'll see. */ + d4.10
++ @563 /* You and I? Not a chance. Not one chance in the Nine Hells. */ + d4.11
END

IF ~~ d4.8
SAY @564 /* Ah, no, no, no. I have to make things right with Cyric and a certain demon-summoning amulet, and something tells me the Prince of Lies would NOT be pleased about that. Ao's edict, remember? Gods cannot interfere in your business, and Cyric kind of did - through me. */
IF ~~ + d4.12
END

IF ~~ d4.9
SAY @565 /* Yeah, in another twenty years or so. Sounds like a plan. */
IF ~~ + d4.12
END

IF ~~ d4.10
SAY @566 /* Good plan. You do that. */
= @567 /* Sorry, bad habit. I will... write to you, too. I suppose. */
IF ~~ + d4.12
END

IF ~~ d4.11
SAY @568 /* What was it in that old play? The <PRO_LADYLORD> doth protest too much, methinks. */
IF ~~ + d4.12
END

IF ~~ d4.12
SAY @569 /* But maybe you're right. It takes time. We can't jump from mortal enemies to best friends in a blink, can we? Feelings don't change that quickly. */
IF ~~ + d4.12s
END

IF ~~ d4.12s
SAY @570 /* Or, when they do, there's too much emotion, and emotion makes you vulnerable, confused... even a little lost. Not that I'm talking about myself, of course. */
++ @571 /* Of course not. */ + d4.12x
++ @572 /* Uh-huh. */ + d4.12x
++ @573 /* I understand. */ + d4.12y
END

IF ~~ d4.12x
SAY @574 /* I know that tone. I use that tone. */
= @575 /* ... You really are my <PRO_BROTHERSISTER>, aren't you? */
IF ~~ + d4.12y
END

IF ~~ d4.12y
SAY @576 /* So, yeah, I'd delay actual family bonding for a bit. Especially in a dreary dark castle filled with demons and old ghosts. Not the best place to start sharing childhood stories, is it? */
++ @577 /* Yeah. We should at least wait for someone to clean this mess up. */ + d4.12a
++ @578 /* Trust me, this is a lovely picnic compared to my pocket plane. */ + d4.12b
++ @579 /* I know what you mean. */ + d4.12c
++ @580 /* What do you propose, then? */ + d4.12z
END

IF ~~ d4.12a
SAY @581 /* And that someone is never you, huh? I bet if heroes had to scrub the floors, we'd have a far lower mortality rate. */
IF ~~ + d4.12z
END

IF ~~ d4.12b
SAY @582 /* I'd be lying if I said I wasn't curious. But... I am not eager to go there. Not one bit. */
IF ~~ + d4.12z
END

IF ~~ d4.12c
SAY @583 /* Which is why I propose a different setting. Somewhere without fresh demon corpses, at least. */
IF ~~ + d4.12z
END

IF ~~ d4.12z
SAY @584 /* Let's meet somewhere after this business of yours is over. Baldur's Gate? Busy and noisy enough to get lost in, I suppose. Also I have business there. But if you choose, say, Neverwinter, I could relocate. It’s negotiable. */
++ @585 /* Good. Try not to be late. */ + d4.12m
++ @586 /* And if I ascend? */ + d4.13
++ @587 /* (sigh) I hate you already. */ + d4.14
++ @588 /* We'll see. */ + d4.15
END

IF ~~ d4.12m
SAY @589 /* Oh, I have eyes in the city. They will alert me the moment you enter, so don't worry about me missing a family gathering. */
IF ~~ + d4.15
END
IF ~~ d4.13
SAY @590 /* Then we'll drink in Curst and celebrate in Carceri. */
IF ~~ + d4.15
END

IF ~~ d4.14
SAY @591 /* Then everything is going according to plan. */
IF ~~ + d4.15
END

IF ~~ d4.15
SAY @592 /* So many questions... so many things to ask. But I know they can wait. */
= @593 /* I got to take this amulet back to Cyric's priesthood and not get killed, and you have to deal with Bhaal's essence and all your *other* siblings. And not get killed. */
= @594 /* But you'll be all right. After all, your most dangerous sibling is standing right here in front of you. */
++ @595 /* Oh, ha-ha. */ + d4.15b
++ @596 /* Riiiight. */ + d4.15b
++ @597 /* You really have a high opinion of yourself, don't you? */ + d4.15c
++ @598 /* Don't push your luck. */ + d4.15d
++ @599 /* I could take you with both my arms tied behind my back! */ + d4.15e
END

IF ~~ d4.15b
SAY @600 /* What, because I can't turn into a dragon and sexy drow priestesses in spider silk lingerie are't at my beck and call, you suddenly think I'm not a worth opponent? Remember, <PRO_BROTHERSISTER>, it's always the quiet ones. */
IF ~~ + d4.15z
END

IF ~~ d4.15c
SAY @601 /* If I don't, who else will? Live dangerously, <CHARNAME>. When stakes are high, double them. */
IF ~~ + d4.15z
END

IF ~~ d4.15d
SAY @602 /* That's what I've been doing for my entire life, and you know what? I like it. You do, too, judging by the tales of your exploits. */
IF ~~ + d4.15z
END

IF ~~ d4.15e
SAY @603 /* How colorful. We should try that sometime. */
IF ~~ + d4.15z
END

IF ~~ d4.15z
SAY @604 /* I'd almost like to stay and talk more, but you're on a clock, I know. Tricky things, prophecies. Hope yours won't drag you under. I wasn't so lucky. */
IF ~~ + d4.15a
IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ EXTERN IMOEN25J DAEMON3
END

IF ~~ d4.15a
SAY @605 /* Do take care of youself. I'd hate to lose my newfound <PRO_BROTHERSISTER> to some random dracolich. */
++ @606 /* Your concern is appreciated. It's pretty touching, actually. */ + d4.19
++ @607 /* I eat dracoliches for breakfast, bro. Don't you worry. */ + d4.20
++ @608 /* Dracoliches should be afraid of ME. */ + d4.20
++ @609 /* We should hunt one together sometime. I'd like to look at your technique. */ + d4.21
END

IF ~~ d4.19
SAY @610 /* Who's concerned? I'm just making sure you don't get killed by someone else. I got dibs, you know. */ 
IF ~~ + d4.22
END

IF ~~ d4.20
SAY @611 /* Keep bragging like this, and some lucky assassin might just get an opening. Hope I'll get a front-row seat for this. */ 
IF ~~ + d4.22
END

IF ~~ d4.21
SAY @612 /* We will, and that's a promise. Got to give the junior some pointers, right? */ 
IF ~~ + d4.22
END

IF ~~ d4.22
SAY @613 /* Funny, that. A part of me still wants to find your weak spots and drown you in irrefutable sarcasm, but the rest of me has this warm and fuzzy knowledge that I'll never need to. Is this what they call trust, I wonder? */
IF ~~ + d4.22z
IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID)~ EXTERN SAREV25J DAEMON9
END

IF ~~ d4.22z
SAY @614 /* Might be the beginning of a beautiful friendship, might be something else, but I'm glad I finally met you. Maybe. Probably. */
IF ~~ + d4.22a
IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ EXTERN IMOEN25J DAEMON5
END

IF ~~ d4.22a
SAY @615 /* So... I guess that's it, right? Good luck, <PRO_BROTHERSISTER>. */
++ @616 /* Where will you go? */ + d4.17
++ @617 /* Thanks. I'm almost glad I didn't kill you. */ + d4.18
++ @618 /* And you. */ + d4.16
END

IF ~~ d4.16
SAY @619 /* Give them hell. I'll see you when I see you. */
IF ~~ DO ~SetGlobal("O#DaemonTalk4","GLOBAL",3) DestroySelf()~ EXIT 
END

IF ~~ d4.17
SAY @620 /* You talked to mother; I haven't. So I am going to take a long route to a small grove, bend my knees before an old tombstone and just sit there for a while. */
= @621 /* Nothing interesting, is there? */
IF ~~ + d4.16
END

IF ~~ d4.18
SAY @622 /* I'm almost glad you haven't tried. */
IF ~~ + d4.16
END

END

CHAIN IMOEN25J DAEMON1
@623 /* Don't tell me. This guy is going to blame you for everything, right? */
END
IF ~~ EXTERN O#DAEMON d2.5a

CHAIN IMOEN25J DAEMON2
@624 /* <CHARNAME>, I don't know if he is really your brother, but... maybe he deserves a chance. Don't you think? */
END
IF ~~ EXTERN O#DAEMON d3.19a

CHAIN IMOEN25J DAEMON3
@625 /* Yeah. I wasn't so lucky, either. */
END
IF ~~ EXTERN O#DAEMON d4.15a

CHAIN IMOEN25J DAEMON4
@626 /* Ahem. I am standing right here, guys! Can you see me at all? */
== O#DAEMON IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @627 /* Nope. */
END
IF ~~ EXTERN O#DAEMON d3.10

CHAIN IMOEN25J DAEMON5
@628 /* I'm glad you guys made peace. Guess I'll see you in Baldur's Gate, too, huh? */
== O#DAEMON IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @629 /* (groan) I'm not just getting <CHARNAME> as a <PRO_BROTHERSISTER>, am I? Unless a passing Demogorgon eats the lot of you, I'm getting the whole happy family. Wonderful. Just wonderful. */
== IMOEN25J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @630 /* Hey, no worries! I make great cookies, and anyway, I'll leave you guys alone, if you want. Just know that you might have another friend. */
== O#DAEMON IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @631 /* You don't even know me. But... thanks, I guess? */
END
IF ~~ EXTERN O#DAEMON d4.22a

CHAIN JAHEI25J DAEMON1
@632 /* I wonder why none of the Watchers tried to approach the boy. Feed him, at least. They should have seen him out there, frightened, alone. Were they all so heartless? */
END
IF ~~ EXTERN O#DAEMON d3.8a

CHAIN SAREV25J DAEMON1
@633 /* He is in for a surprise, isn't he? Ha ha ha ha ha. */
END
IF ~~ EXTERN O#DAEMON d1.5

CHAIN SAREV25J DAEMON2
@634 /* Good choice. He is not entirely stupid, this one. */
END
IF ~~ EXTERN O#DAEMON DAEMON8

CHAIN SAREV25J DAEMON3
@635 /* And yet you failed. A massacre would have served much better - <CHARNAME> saw me in action. But what would a mortal like you know about a true war of sacrifice? */
END
IF ~~ EXTERN O#DAEMON DAEMON7

CHAIN SAREV25J DAEMON4
@636 /* Good choice, but wrong enemy. <CHARNAME> will wipe the floor with you, boy. */
END
IF ~~ EXTERN O#DAEMON d1.5

CHAIN SAREV25J DAEMON5
@637 /* You should. I fought with my <PRO_BROTHERSISTER> thrice; once <PRO_HESHE> escaped and twice <PRO_HESHE> killed me. Do not repeat my mistake. */
END
IF ~~ EXTERN O#DAEMON DAEMON8

CHAIN SAREV25J DAEMON6
@638 /* And yet it was all for naught. If only you approached <CHARNAME> and talked to <PRO_HIMHER>, like I did, everything would have been much easier. */
END
IF ~~ EXTERN O#DAEMON DAEMON7

CHAIN O#DAEMON DAEMON7
@639 /* You and <CHARNAME> share a bond, too. Bhaal's taint and so forth. Was that how your sudden frienship come about? Did you take a leap of faith, or did you just have no choice? */
== SAREV25J IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID)~ THEN @640 /* You are going to compare notes now? */
== O#DAEMON IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID)~ THEN @641 /* Yeah, like that'll work. Two older brothers, vying for <CHARNAME>'s attention; we'll tear this poor castle to shreds. */
== O#DAEMON IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID)~ THEN @642 /* No, I am here for <CHARNAME> and <PRO_HIMHER> alone. And now that my attack failed, I honestly do not know what to do. Do you, <PRO_BROTHERSISTER>? */
END
IF ~~ EXTERN O#DAEMON d3.5a

CHAIN O#DAEMON DAEMON8
@643 /* So sure of yourself, so calm and indifferent. What is it like for you, Sarevok? To know that everything's been taken from you by one person? */
== SAREV25J IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID)~ THEN @644 /* Bitter, as you know. But I am Sarevok, a Child of Bhaal, and my part is hardly done. You are nothing. */
== O#DAEMON IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID)~ THEN @645 /* Your part? What part? To be <PRO_HISHER> lapdog, <PRO_HISHER> sword, to be used and discarded as <PRO_HESHE> pleases? */
== O#DAEMON IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID)~ THEN @646 /* And yet all this time <PRO_HISHER> life's been in your hands. See, <PRO_HISHER> neck is so close, so unprotected. Doesn't the temptation burn you? */
== SAREV25J IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID)~ THEN @647 /* If you think I have learnt nothing, then more the fool are you. */
END
IF ~~ EXTERN O#DAEMON d2.77

CHAIN SAREV25J DAEMON9
@648 /* Ugh. Nauseating. */
== O#DAEMON IF ~InParty("Sarevok") InMyArea("Sarevok") !StateCheck("Sarevok",CD_STATE_NOTVALID)~ THEN @649 /* Shh. Don't spoil the moment. */
END
IF ~~ EXTERN O#DAEMON d4.22z

// NALIA'S DIALOGUE 

APPEND NALIA25J

// Chapter 9

IF WEIGHT #-1 ~Global("O#DAEQuest","GLOBAL",2)~ n1
SAY @650 /* <CHARNAME>, something terrible happened in my castle. We need to return there at once. */
++ @651 /* What? Something happened to the keep? */ + n1.1
+ ~Global("PCKeepOwner","GLOBAL",1)~ + @652 /* My castle? How dare they! */ + n1.0
++ @653 /* Why? What happened? */ + n1.1
++ @654 /* How do you know? */ + n1.1
END

IF ~~ n1.0
SAY @655 /* This is still my castle, <CHARNAME>. Remember, you're just a figurehead... though I appreciate your help, of course. I am the one responsible for my people. */
IF ~~ + n1.1
END

IF ~~ n1.1
SAY @656 /* I haven't heard from the castle in a while. After all this business with Isaea... it was a mistake to leave. */
= @657 /* But today I received a message from Captain Arat. The keep has been attacked, and the attacker is searching for you! There are demons inside the walls! */ 
++ @658 /* They came for me? So this is all my fault? */ + n1.2
++ @659 /* That's horrible. We must help! */ + n1.3
+ ~Global("PCKeepOwner","GLOBAL",1)~ + @660 /* I'll show them what <PRO_LADYLORD> <CHARNAME> does to intruders! */ + n1.3
++ @661 /* Why should I care? */ + n1.4
END

IF ~~ n1.2
SAY @662 /* Don't say that, of course not! But these are my people we are talking about, and we must go and help them! */
IF ~~ + n1.5
END

IF ~~ n1.3
SAY @663 /* Thank you. I knew I could count on you when I really needed to. */
IF ~~ + n1.5
END

IF ~~ n1.4
SAY @664 /* <CHARNAME>, please. I know this is an important fight for you, but my people are in danger! */
IF ~~ + n1.5
END

IF ~~ n1.5
SAY @665 /* I have a teleportation stone here. Use it when you are ready. */
IF ~~ DO ~AddJournalEntry(@10000,QUEST) GiveItemCreate("O#DAEGem",Player1,1,1,0) SetGlobal("O#DAEQuest","GLOBAL",3) SetGlobalTimer("O#DAEQuestNaliaRemTimer","GLOBAL",ONE_DAY)~ + n1.6
END

IF ~~ n1.6
SAY @666 /* But we have to be careful. These people seem well-armed and prepared. If... things go badly, use the stone. It will teleport us back to Amkethran. */
++ @667 /* Very well, I am ready. */ + n1.7
++ @668 /* I don't want you in danger, Nalia. */ + n1.8
++ @669 /* Why should I be risking my neck for your keep again? */ + n1.9
++ @670 /* We shouldn't go. The Five will not be idle forever. */ + n1.10
END

IF ~~ n1.7
SAY @671 /* Then use the stone. We'll be teleported to the keep at once. */
= @672 /* Just... please, do not rush into danger. */
IF ~~ EXIT
END

IF ~~ n1.8
SAY @673 /* If you tell me to stay here, I will. But please don't. I would hate to be on my own, waiting and wondering. */
IF ~~ + n1.11
END

IF ~~ n1.9
SAY @674 /* For my undying gratitude? For the lives of the people in the castle? */
= @675 /* If you want gold, weapons and pretty baubles, there'll be plenty of these around, I suppose. Not that you haven't cleaned the coffers well and good the first time. */
IF ~~ + n1.11
END

IF ~~ n1.10
SAY @676 /* I do not know what the Five are planning. But right now our power demands we help people in need, especially those that depend on us! Don't you see? */
IF ~~ + n1.11
END

IF ~~ n1.11
SAY @677 /* Please, come. To find out who's targeting you, if nothing else. */
IF ~~ EXIT
END

// a day later, variable is still at 3, timer

IF WEIGHT #-1 ~Global("O#DAEQuestNaliaRem","GLOBAL",2)~ n2
SAY @678 /* <CHARNAME>, you're still planning to go to the castle, aren't you? */
++ @679 /* Yes, and right away. */ + n2.1
++ @680 /* Of course, Nalia. I just need to complete a task, first. */ + n2.1
++ @681 /* I'm not sure. */ + n2.2
END

IF ~~ n2.1
SAY @682 /* Good. I was afraid you changed your mind. */
= @683 /* I'll be waiting, then. */
IF ~~ DO ~SetGlobal("O#DAEQuestNaliaRem","GLOBAL",3)~ EXIT
END

IF ~~ n2.2
SAY @684 /* Then be sure! How can you claim to be better than the Five, or even fight the essence of Bhaal, if you refuse to care about other people? */
= @685 /* There is still time. Please go. */
IF ~~ DO ~SetGlobal("O#DAEQuestNaliaRem","GLOBAL",3)~ EXIT
END

// Just apparated

IF WEIGHT #-1 ~Global("O#DAENaliaAmbush0","GLOBAL",2)~ n2a
SAY @686 /* The bridge is lowered. A bad sign. */
++ @687 /* Very much so. */ + n2c
++ @688 /* Ha, you think? */ + n2c
++ @689 /* You never know. Maybe someone will come to greet us with flowers. And cake. */ + n2b
END

IF ~~ n2b
SAY @690 /* The cake is always a lie, <CHARNAME>. You should know that by now. */
IF ~~ + n2c
END

IF ~~ n2c
SAY @691 /* We should check the palisade to the south of the keep. If there are any survivors, they will be there. */
IF ~~ DO ~SetGlobal("O#DAENaliaAmbush0","GLOBAL",3)~ EXIT
END

// inside the keep

IF WEIGHT #-1 ~Global("O#DAENaliaAmbush1","GLOBAL",2)~ n3
SAY @692 /* That's... not good. */
++ @693 /* Putting it mildly. */ + n3.3
++ @694 /* Since when has this keep become an outpost of the Nine Hells? Should we send an eviction notice? */ + n3.1
++ @695 /* Doesn't matter. We'll kill everything that moves. */ + n3.2
END

IF ~~ n3.1
SAY @696 /* Ha ha. Do you think demons can read? */
++ @697 /* Clever ones, surely. */ + n3.1a
++ @698 /* Hmm. You know, I never stop to ask. */ + n3.1a
END

IF ~~ n3.1a
SAY @699 /* Oh, <CHARNAME>, you're incorrigible. Too bad this isn't the time. */
IF ~~ + n3.3
END

IF ~~ n3.2
SAY @700 /* Just use moderation. Innocent people may still be inside. */
IF ~~ + n3.3
END

IF ~~ n3.3
SAY @701 /* Trolls were bad enough, but this... */
= @702 /* Let us just move on. */
IF ~~ DO ~SetGlobal("O#DAENaliaAmbush1","GLOBAL",3)~ EXIT
END

// PC met Daemon for the first time

IF WEIGHT #-1 ~Global("O#DAENaliaSecondFloor","GLOBAL",2)~ n4
SAY @703 /* That man said he was your brother. Does it mean he, too, is a Child of Bhaal? */
++ @704 /* Probably. Just not a member of the Five. */ + n4.1
++ @705 /* A Child of Bhaal who worships Cyric? That would be strange. */ + n4.1
++ @706 /* I don't think so. It's more complicated than that. */ + n4.1
END

IF ~~ n4.1
SAY @707 /* No? But then - who is he? And how?.. */
= @708 /* We will find out soon enough, I suppose. Just... end this, <CHARNAME>. End this fast. */
IF ~~ DO ~SetGlobal("O#DAENaliaSecondFloor","GLOBAL",3)~ EXIT
END

// PC met Alianna for the first time

IF WEIGHT #-1 ~Global("O#DAENaliaAlianna","GLOBAL",1)~ n6
SAY @709 /* I can hardly believe my own eyes. Was that... was that the ghost of your mother? In my castle? */
++ @710 /* It was, I think. She looked real, though. */ + n6.3
++ @711 /* Technically, the castle belongs to the demons now. */ + n6.1
++ @712 /* I can hardly believe it, myself. */ + n6.2
END

IF ~~ n6.1
SAY @713 /* Never mind that. */
IF ~~ + n6.3
END

IF ~~ n6.2
SAY @714 /* Incredible. And it scares me, too, but... */
IF ~~ + n6.3
END

IF ~~ n6.3
SAY @715 /* I wish I could see Father here. Corporeal, solid, familiar, and there for me. */
= @716 /* But I know I won't. Oh, <CHARNAME>, I envy you. */
++ @717 /* Your father loved you. My mother almost killed me. */ + n6.4
++ @718 /* You shouldn't. My family relations are... complicated. */ + n6.4
++ @573 /* I understand. */ + n6.5
END

IF ~~ n6.4
SAY @719 /* Still, a mother is a mother. Once upon a time she loved you, didn't she? I hope. */
IF ~~ + n6.5
END

IF ~~ n6.5
SAY @720 /* I know it must be a shock. How are you holding on? */
++ @721 /* She sounded so forlorn and lost... I almost pity her. */ + n6.7
++ @722 /* I want to hear what else she has to say. */ + n6.6
++ @723 /* Can I even trust her words? She wanted to sacrifice me! */ + n6.8
++ @724 /* I don't know what to say. It seems surreal. */ + n6.6
END

IF ~~ n6.6
SAY @725 /* Whatever her reasons are, her regret seems sincere. I hope she appears again. Perhaps you will understand each other at last. */
IF ~~ DO ~SetGlobal("O#DAENaliaAlianna","GLOBAL",2)~ EXIT
END

IF ~~ n6.7
SAY @726 /* I do, too, though I am not the one to judge. You are. */
IF ~~ + n6.6
END

IF ~~ n6.8
SAY @727 /* And now she wants to tell you something important. Do not waste this opportunity. */
IF ~~ + n6.6
END

// Daemon gone downstairs

IF WEIGHT #-1 ~Global("O#DAENaliaDaemonMercy","GLOBAL",1)~ n7
SAY @728 /* And so he flees again. It's almost as if your brother does not want to fight you. */
++ @729 /* I guess he wants to see our mother much more. */ + n7.00
++ @730 /* But I do, and I will kill him, be easy. */ + n7.0
++ @731 /* I do not want to kill him, either. */ + n7.1
++ @732 /* Maybe. What's your point? */ + n7.1
END

IF ~~ n7.0
SAY @733 /* That's what I was wondering about. */
IF ~~ + n7.1
END

IF ~~ n7.00
SAY @734 /* I can understand that. Losing my mother... was hard. */
IF ~~ + n7.1
END

IF ~~ n7.1
SAY @735 /* Can you get him to talk? Find some common ground, before you tear the castle to shreds? He is not who I'd call a decent person, but he is not a true villain, either. */
++ @736 /* Nalia, if he and I talk some more, blood will start pouring out of my ears. */ + n7.2
++ @737 /* Is that all you're worried about? The castle? */ + n7.3
++ @738 /* We'll see. I can't promise anything. */ + n7.4
++ @739 /* I hope so. */ + n7.5
++ @556 /* Not a chance. */ + n7.6
END

IF ~~ n7.2
SAY @740 /* Ha! All right, I see your point. But, seriously, <CHARNAME>... sometimes listening can be the answer. */
IF ~~ + n7.6
END

IF ~~ n7.3
SAY @741 /* Of course not! I am worried about you, and what killing your brother can do to you. Sarevok started by killing your siblings, and it cost him his life and soul at the end. */
IF ~~ + n7.6
END

IF ~~ n7.4
SAY @742 /* You do not have to promise me anything, <CHARNAME>. You are here; for me, it is enough. */
IF ~~ + n7.7
END

IF ~~ n7.5
SAY @743 /* I hope so, too. */
IF ~~ + n7.6
END

IF ~~ n7.6
SAY @744 /* Daemon has not killed anyone yet. Not like Torgal, or Irenicus, or Isaea. */
= @745 /* I think it matters. */
IF ~~ + n7.7
END

IF ~~ n7.7
SAY @746 /* To the secret passage we go again, I guess. (sigh) I am ready. */
IF ~~ DO ~SetGlobal("O#DAENaliaDaemonMercy","GLOBAL",2)~ EXIT
END

// Everything is over

IF WEIGHT #-1 ~Global("O#DAENaliaOver","GLOBAL",1)~ n5
SAY @747 /* Thank the gods, it is over. My people are safe. */
= @748 /* Thank you, <CHARNAME>. I knew I could count on you, always. */
++ @749 /* Of course you can, Nalia. You know you can. */ + n5.1
+ ~Global("PCKeepOwner","GLOBAL",1)~ + @750 /* I couldn't leave my castle to the demons. */ + n5.2
++ @751 /* People were in danger; I had to help. */ + n5.3
++ @752 /* Never mind. Where is my money? */ + n5.4
END

IF ~~ n5.1
SAY @753 /* You'll always have my gratitude. And perhaps much more than that. */
IF ~~ + n5.5
END

IF ~~ n5.2
SAY @754 /* Oh, again with "my castle"! <CHARNAME>, you could have dozens of castles on the Sea of Swords by now; why would you even need mine? */
IF ~~ + n5.5
END

IF ~~ n5.3
SAY @755 /* You always do. That's why we all love you so much. */
IF ~~ + n5.5
END

IF ~~ n5.4
SAY @756 /* (sigh) Your reward, of course. I haven't forgotten. */
IF ~~ + n5.5
END
IF ~~ n5.5
SAY @757 /* Part of me thinks this could be spent helping less fortunate, but you need it more. So take it, and use it well. */
IF ~~ DO ~GiveItemCreate("RODS03",Player1,1,0,0)~ + n5.6
END

IF ~~ n5.6
SAY @758 /* Would you like to talk? About your brother? You had family, and nobody ever told you, even Gorion... */
++ @759 /* I'm all right, Nalia. We do not need to talk about this. */ + n5.7
++ @760 /* I'm pretty shaken by all this. */ + n5.8
++ @761 /* Nobody ever tells me anything, it seems. */ + n5.8
+ ~Dead("O#Daemon")~ + @762 /* Well, it's over. I'm the only kid in the family again, and things are back to normal. */ + n5.9
+ ~!Dead("O#Daemon")~ + @763 /* I have family. Somehow, it makes me feel... hopeful. */ + n5.10
END

IF ~~ n5.7
SAY @764 /* ... All right. But we can always talk, if you like. */ 
IF ~~ + n5.12
END

IF ~~ n5.8
SAY @765 /* I can understand. */
IF ~~ + n5.12
END

IF ~~ n5.9
SAY @766 /* You talk about murdering your brother so easily, <CHARNAME>. I truly fear you sometimes. */
= @767 /* But you had ample reason, I admit. I only wish Gorion told you the truth much earlier. */
IF ~~ + n5.12
END

IF ~~ n5.10
SAY @768 /* I wish you both well. You'll walk a slow road, I suppose, but it might lead somewhere. */
IF ~~ + n5.12
END

IF ~~ n5.12
SAY @769 /* Father... he always kept secrets from me. Big decisions, important meetings. I wish... now I wish I could tell him that it was all right. That I knew he was trying to protect me. */
= @770 /* Even with this unbelievable marriage contract, he was only acting out of love. And paid for it... but first and always, he loved me. I wish I could tell him that now. */
++ @771 /* He knew, Nalia. He always knew. */ + n5.13
++ @573 /* I understand. */ + n5.13
++ @772 /* Let's just go. I am tired. */ + n5.11
END

IF ~~ n5.11
SAY @773 /* (sigh) It has been a long day. Let's get some rest. */
= @774 /* And <CHARNAME>? Thank you again. */
IF ~~ DO ~SetGlobal("O#DAENaliaOver","GLOBAL",2)~ EXIT
END

IF ~~ n5.13
SAY @775 /* I miss him so much. Thank you for listening. */
= @776 /* And you, <CHARNAME>? After all that transpired, what do you think of your mother now? */
++ @777 /* I could have loved her, I think. If only things were different. */ + n5.14
++ @778 /* I have forgiven her. I hope she finds peace. */ + n5.15
++ @779 /* I still think she is a crazy fanatic, but I understand her better now. */ + n5.16
+ ~!Dead("O#Daemon")~ + @780 /* I would like to see her again one day. Daemon would, too. */ + n5.17
+ ~Dead("O#Daemon")~ + @781 /* I doubt she wants me anymore after I killed her precious boy. */ + n5.18
++ @782 /* Nothing. She's gone. Good riddance. */ + n5.19
++ @783 /* I do not know. */ + n5.20
++ @784 /* I do not want to talk about it. */ + n5.11
END

IF ~~ n5.14
SAY @785 /* If only. (sigh) If only indeed. */
IF ~~ + n5.21
END

IF ~~ n5.15
SAY @786 /* If it means your heart is calmer, I am glad. */
IF ~~ + n5.21
END

IF ~~ n5.16
SAY @787 /* I could not understand her at all, but she paid for what she did. Perhaps there is redemption even for her. */
IF ~~ + n5.21
END

IF ~~ n5.17
SAY @788 /* You truly feel like she is your family, now. And so is your brother. */
= @789 /* Perhaps you needed something real in your life. Perhaps we all do. */
IF ~~ + n5.21
END

IF ~~ n5.18
SAY @790 /* A choice you both will have to live with. I am so sorry. */
IF ~~ + n5.21
END

IF ~~ n5.19
SAY @193 /* I see. */
IF ~~ + n5.21
END

IF ~~ n5.20
SAY @791 /* Of course. It was unfair of me to put you on the spot. I am sorry. */
IF ~~ + n5.21
END

IF ~~ n5.21
SAY @792 /* You've been through so much, and yet you're the same old <CHARNAME>. A friend in need. A comrade in arms. Someone who will come, and help, and listen. */
= @793 /* I admire you for that, and in many ways, I want to be you, this amazing person I know and love. But I also know about the burdens you bear, and I would not wish those on anyone. */
= @794 /* Just know that I am here for you. Whatever you need. */
++ @795 /* Thank you, Nalia. */ + n5.11
++ @796 /* And I am here for you. */ + n5.11
++ @797 /* I know. */ + n5.11
END

END

// Palisade: people who survived and are asking you for help, four mini-quests

// Miniquest 1: find Captain Arat's son

BEGIN O#DAECAP
BEGIN O#DAEBOY

CHAIN IF ~Global("O#DAECaptain","GLOBAL",0)~ THEN O#DAECAP c1
@798 /* <CHARNAME>, what in the Nine Hells is this? Demons from the blackest corners of the hells, dark follower of Cyric searching for you - what is going on? We thought you left for Tethyr! */
END
++ @799 /* Captain Arat? I thought you had retired. */ EXTERN O#DAECAP c1.1
++ @800 /* Do you think I summoned the demons? */ EXTERN O#DAECAP c1.2
++ @801 /* Don't forget who you're talking to. */ EXTERN O#DAECAP c1.2

CHAIN O#DAECAP c1.1
@802 /* I had. And then I chose a bad time to visit. */
END
IF ~Global("O#DAECaptainSonFound","GLOBAL",1)~ EXTERN O#DAECAP c3.1
IF ~!Global("O#DAECaptainSonFound","GLOBAL",1)~ EXTERN O#DAECAP c1.3

CHAIN O#DAECAP c1.2
@803 /* I know, and I am sorry. But this madness must stop, and I sincerely hope you're the one to put an end to it. */
END
IF ~Global("O#DAECaptainSonFound","GLOBAL",1)~ EXTERN O#DAECAP c3.1
IF ~!Global("O#DAECaptainSonFound","GLOBAL",1)~ EXTERN O#DAECAP c1.3

CHAIN O#DAECAP c1.3
@804 /* 'Tis by Cyric's foul curse I ended up here alone, without my lad. I brought my son to the keep, see. He missed the place badly, and, truth be told, so did I. Who could know... */
DO ~SetGlobal("O#DAECaptain","GLOBAL",1)~
== AERIE25J IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @805 /* Is your son lost? Oh, no! We m-must help, <CHARNAME!> */
== HAERD25J IF ~InParty("Haerdalis") InMyArea("Haerdalis") !StateCheck("Haerdalis",CD_STATE_NOTVALID)~ THEN @806 /* A triumph of chaos, indeed. Yet this sparrow feels sorrow for yon babe, as such feelings are natural. */
== VALYG25J IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @807 /* When we return from the keep, I shall bring you news of your son, or his body to mourn and bury, I promise you that. */
== CERND25J IF ~InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @808 /* A lost child, you say? I would weep with you as is nature's wont, but pray tell us first: is there hope for your son yet? Is he still alive? */
== NALIA25J IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @809 /* Nobody could know. Do not blame yourself, Captain. */
== O#DAECAP IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @810 /* Thank you, mistress Nalia. */
== O#DAECAP @811 /* I was leading people out when Lenny ran away. He always liked to play on the banisters, but I fear this castle's walls are deadly tonight. */
END
++ @812 /* I will find your son, I promise you. */ EXTERN O#DAECAP c1.4
++ @813 /* Why did he run away? Do you know? */ EXTERN O#DAECAP c1.5
++ @814 /* I see. Well, sorry to hear that. */ EXTERN O#DAECAP c1.4

CHAIN O#DAECAP c1.4
@815 /* I can't ask you to find him. Too many lives depend on you defeating the demons in the castle. But if you kill those monsters and search the walls - then, perhaps, you will find my son. */
= @816 /* Go with my blessings. May every Cyric's enemy watch over you. */
DO ~AddJournalEntry(@10009,QUEST)~
EXIT

CHAIN O#DAECAP c1.5
@817 /* I... I do not know. I heard him shouting something about a ghost, but I cannot be sure. He is just a child. */
END
IF ~~ EXTERN O#DAECAP c1.4

CHAIN IF ~Global("O#DAECaptainSonFound","GLOBAL",0)~ THEN O#DAECAP c2
@818 /* Good luck, <CHARNAME>. Give 'em hell! */
EXIT

CHAIN IF ~Global("O#DAECaptainSonFound","GLOBAL",1)~ THEN O#DAECAP c3
@819 /* He's back! My son is back! */
END
IF ~~ EXTERN O#DAECAP c3.1

CHAIN O#DAECAP c3.1
@820 /* I can't thank you enough for saving Lenny. He is my heart and soul. */
= @821 /* Please, take this for your efforts. It belonged to my wife, but I think she'd want you to have it. */
DO ~EraseJournalEntry(@10009)
EraseJournalEntry(@10010)
AddJournalEntry(@10011,QUEST_DONE)
GiveItemCreate("ring31",Player1,1,1,0)
AddExperienceParty(60000)
SetGlobal("O#DAECaptain","GLOBAL",1)
SetGlobal("O#DAECaptainSonFound","GLOBAL",2)~
EXIT

CHAIN IF ~Global("O#DAECaptainSonFound","GLOBAL",2)~ THEN O#DAECAP c4
@822 /* Thank you for saving my son. Call on me if you need anything. */
EXIT

CHAIN IF ~Global("O#DAECaptainSonFound","GLOBAL",0)~ THEN O#DAEBOY k1
@823 /* Who are you? I'm hiding here, you know. */
END
++ @824 /* I can see that. */ EXTERN O#DAEBOY k1.1
++ @825 /* Who are you hiding from, young man? */ EXTERN O#DAEBOY k1.1
+ ~GlobalGT("O#DAECaptain","GLOBAL",0)~ + @826 /* Lenny? Your father asked me to find you. He said you ran away. */ EXTERN O#DAEBOY k1.1

CHAIN O#DAEBOY k1.1
@827 /* Shhh. I'm hiding from the ghost. She's a scary lady who promised to introduce me to a big and terrible Child of Bhaal, if I make a sound. Um... did she mean that, or did she just want me to be quiet? */
END
++ @828 /* I don't know. */ EXTERN O#DAEBOY k1.2
++ @829 /* Who was she? */ EXTERN O#DAEBOY k1.1b
++ @830 /* I'll deal with her. You should run to the palisade. */ EXTERN O#DAEBOY k1.2
+ ~GlobalGT("O#DAEAlianna1","GLOBAL",2)~ + @831 /* She is my mother, actually. */ EXTERN O#DAEBOY k1.1a
++ @832 /* I'm that terrible Child of Bhaal, if you must know. */ EXTERN O#DAEBOY k1.1c

CHAIN O#DAEBOY k1.1a
@833 /* Wish I could see my mom again, even as a ghost. She seemed sad, your mother. Maybe you'll see her again? */
END
IF ~~ EXTERN O#DAEBOY k1.2

CHAIN O#DAEBOY k1.1b
@834 /* She looked a little bit like you, I guess. */
END
IF ~~ EXTERN O#DAEBOY k1.2

CHAIN O#DAEBOY k1.1c
@835 /* Really? Wow! All the kids in Athkatla will be envious of me! Will you sign my shirt? */
END
IF ~~ EXTERN O#DAEBOY k1.2

CHAIN O#DAEBOY k1.2
@836 /* The way out is free, right? I'll run to father right now, I promise. Just be careful. Lots of really big demons inside. */
DO ~AddJournalEntry(@10010,QUEST) SetGlobal("O#DAECaptainSonFound","GLOBAL",1) JumpToPoint([636.3290])~
EXIT

CHAIN IF ~Global("O#DAECaptainSonFound","GLOBAL",1)~ THEN O#DAEBOY k2
@837 /* Hey! You're still alive! Did you see the ghost lady? */
EXIT

// Miniquest 2: Find Chanelle for Jessup, a useless drunk(he courted Chanelle once, but she spurned him)

BEGIN O#DAEJES
BEGIN O#DAECHA

CHAIN IF ~Global("O#DAEJessup","GLOBAL",0)~ THEN O#DAEJES j1
@838 /* Um, hello. Do you remember me? */
DO ~SetGlobal("O#DAEJessup","GLOBAL",1)~
END
++ @839 /* No idea who you are, sorry. */ EXTERN O#DAEJES j1.1
++ @840 /* One of the lads from the castle, I presume. */ EXTERN O#DAEJES j1.1
++ @841 /* Sure, Nalia told me about you. You're Jessup, a local ranger. */ EXTERN O#DAEJES j1.2
++ @842 /* You were sweet on Chanelle the maid, right? She said you were drinking a lot. */ EXTERN O#DAEJES j1.3

CHAIN O#DAEJES j1.1
@843 /* My name's Jessup. I joined the castle's guard a few tendays ago. */
END
IF ~~ EXTERN O#DAEJES j1.4

CHAIN O#DAEJES j1.2
@844 /* That's right. */
END
IF ~~ EXTERN O#DAEJES j1.4

CHAIN O#DAEJES j1.3
@845 /* Then you already know why I'm so scared for her. */
END
IF ~~ EXTERN O#DAEJES j1.4

CHAIN O#DAEJES j1.4
@846 /* I used to court Chanelle, one of Mistress Nalia's maids, but we never made it to the altar. I drank more and more, and she... well. Malvolio with his presents and his sweet words didn't help any, either. And then the attackers came, and we got separated. */
END
IF ~Global("O#DAEChanelleFound","GLOBAL",1)~ EXTERN O#DAEJES j3.1
IF ~!Global("O#DAEChanelleFound","GLOBAL",1)~ EXTERN O#DAEJES j1.4a

CHAIN O#DAEJES j1.4a
@847 /* Now Chanelle's disappeared, and I'm worried about her. I fear she is still in the castle. God knows what these demons may be doing to her, too. */
END
++ @848 /* Are you asking me to find her and free her? */ EXTERN O#DAEJES j1.5
++ @573 /* I understand. */ EXTERN O#DAEJES j1.5
++ @849 /* Of course I'll look for her. */ EXTERN O#DAEJES j1.5

CHAIN O#DAEJES j1.5
@850 /* I ain't asking you to bring her back to me. I know I'm not good enough for her. But knowing she is alive and well... that's all I want. */
= @851 /* I have an old magical quiver I've been saving to sell and pay for our wedding, but since it's never to be... well, it's yours, if you want it. Just please, please, get her out of that place alive. */
DO ~AddJournalEntry(@10012,QUEST)~
EXIT

CHAIN IF ~Global("O#DAEChanelleFound","GLOBAL",0)~ THEN O#DAEJES j2
@852 /* Have you found Chanelle? Please, I know she must be in the castle! */
EXIT

CHAIN IF ~Global("O#DAEChanelleFound","GLOBAL",1)~ THEN O#DAEJES j3
@853 /* You made it! Finally, you both made it! */
END
IF ~~ EXTERN O#DAEJES j3.1

CHAIN O#DAEJES j3.1
@854 /* You found her, and I can't thank you enough. Chanelle met with her aunt here, and now they're both on the way to Beregost, but she also wanted to pass her most sincere thanks once again. She... wasn't quite herself when you found her, but she will recover. */
= @855 /* Here, this magical quiver will serve you well. And... I made a sacred vow to Tyr. I may be a failed bridegroom and a fallen ranger, but from this moment on I shall stop drinking. I swear. */
DO ~EraseJournalEntry(@10012)
EraseJournalEntry(@10013)
AddJournalEntry(@10014,QUEST_DONE)
GiveItemCreate("quiver01",Player1,1,1,0)
AddExperienceParty(60000)
SetGlobal("O#DAEChanelleFound","GLOBAL",2)~
EXIT

CHAIN IF ~Global("O#DAEChanelleFound","GLOBAL",2)~ THEN O#DAEJES j4
@856 /* Thank you for rescuing Chanelle. May the gods protect you. */
EXIT

CHAIN IF ~Global("O#DAEChanelleFound","GLOBAL",0)~ THEN O#DAECHA c1
@857 /* Hello? Who's there? */
END
++ @858 /* Lo and behold, <CHARNAME> the Rescuer hath come! */ EXTERN O#DAECHA c1.1
++ @859 /* Do not be afraid. I am here to help. */ EXTERN O#DAECHA c1.1
++ @860 /* Who in the Nine Hells are you? */ EXTERN O#DAECHA c1.1
++ @861 /* Chanelle! Poor child, what have they done to you? */ EXTERN O#DAECHA c1.1
++ @862 /* Run for the palisade, fool! */ EXTERN O#DAECHA c1.1

CHAIN O#DAECHA c1.1
@863 /* Oh. Oh, gods. Stay away from me! I won't go with you - with any of you! */
= @864 /* No, no, no... NOT AGAIN! Run, Chanelle, RUN! */
DO ~AddJournalEntry(@10013,QUEST) SetGlobal("O#DAEChanelleFound","GLOBAL",1) EscapeArea()~
EXIT

// Miniquest 3: Help the woman and the girl - her real husband is an initiate paladin, and your job is to find him/get safely away from the castle(lathrine duty guy).

BEGIN O#DAEMOM
BEGIN O#DAEKID
BEGIN O#DAEDAD

CHAIN IF ~Global("O#DAEMom","GLOBAL",0)~ THEN O#DAEKID m11
@865 /* Hi! Are you here to help us? */
EXIT

CHAIN IF ~Global("O#DAEMom","GLOBAL",0)~ THEN O#DAEMOM m1
@866 /* Lanie, dear, don't be scared. Even demons have kids: we'll find you a proper daddy yet. That Glabrezu could actually make a fairly decent parent... */
DO ~SetGlobal("O#DAEMom","GLOBAL",1)~
== O#DAEKID @867 /* But Tanar'ri have wings! I want a Tanar'ri for a dad, so he could fly me around like a rocking horse! Mommy, please? */
== O#DAEMOM @868 /* (sigh) Fine. But don't blame me when your ice creams melt in the Abyss. Now, what do you need, stranger? Wait, haven't I met you before? */
END
+ ~Gender(Player1,MALE)~ + @869 /* Sure. You were trying to pawn your kid on me. */ EXTERN O#DAEMOM m1.1
+ ~Gender(Player1,FEMALE)~ + @870 /* Sure. You were trying to pawn your kid on one of my friends. */ EXTERN O#DAEMOM m1.1
++ @871 /* Well, you were in the Temple District for a while, offering your kid to any who'd claim him. */ EXTERN O#DAEMOM m1.1
++ @872 /* No, I don't think so. We've never met. */ EXTERN O#DAEMOM m1.2

CHAIN O#DAEMOM m1.1
@873 /* What? No! It wasn't like that! We just needed money to get food and clothes! A growing girl needs new shoes every few months, you know how it goes. */
END
IF ~~ EXTERN O#DAEMOM m1.3

CHAIN O#DAEMOM m1.2
@874 /* Ah, good. I mean... good. */
END
IF ~~ EXTERN O#DAEMOM m1.3

CHAIN O#DAEMOM m1.3
@875 /* Look, I may need your help. Or somebody's help. And it's not about the money. */
== O#DAEKID @876 /* But, mommy, you told me everything is about the money! Or food. */
== O#DAEMOM @877 /* All right, I lied. This is about the money. But it's also about Lanie's real father. */
== O#DAEKID @878 /* Oh. I have a real father? So I can't have a Tanar'ri and a Cowled Wizard and a candy merchant for a daddy? */
== O#DAEMOM @879 /* We'll think of something, honey. But Lanie's real father is a squire in the Radiant Heart. Always on latrine duty, but Wes is a kind-hearted guy. */
END
++ @880 /* Why doesn't Wes take care of his daughter and you? */ EXTERN O#DAEMOM m1.4
++ @881 /* Does Wes even know about you and Lanie? */ EXTERN O#DAEMOM m1.4
++ @193 /* I see. */ EXTERN O#DAEMOM m1.4

CHAIN O#DAEMOM m1.4
@882 /* I never told him about Lanie being his. We've only been together a few times, and then the prelate forbade Wes to... well, you know. If he wanted to be a paladin, he had to give me up. And I didn't have the heart to tell him he gave Lanie up. */
== O#DAEKID @883 /* Maybe we don't tell him? We have a nice life, mom. We don't need him to ruin it. */
== O#DAEMOM @884 /* No, we don't, sweetheart. But Wes is not that bad. He bought me cake and braided my hair... and we dreamt of a house with a garden. Of doing woodwork together. He could make you a rocking horse, you know. */
== O#DAEKID @885 /* Can I eat cake on a rocking horse? */
== O#DAEMOM @886 /* If we find your daddy, sure. Look, stranger, I got a job here as a maid, so this is probably my fault: when the demons came, Wes volunteered to come here with other paladins and initiates, and now he's gone. We are scared witless, though Lanie doesn't show it, but I'm scared for him, as well. */
== O#DAEMOM @887 /* Please... find Wes. Tell him we're worrying about him. If he's wounded, or dying... tell him about Lanie. Even if Wes really wants to be a stuck-up paladin, he needs to know. */
END
++ @888 /* I'll see what I can do. */ EXTERN O#DAEMOM m1.5
++ @889 /* I'm not sure I want to be involved. */ EXTERN O#DAEMOM m1.5
++ @890 /* Of course I'll help. */ EXTERN O#DAEMOM m1.5

CHAIN O#DAEMOM m1.5
@891 /* Waukeen's blessings go with you. ... Lanie, no, this is a skull, not a toy! */
DO ~AddJournalEntry(@10015,QUEST)~
EXIT

CHAIN IF ~Global("O#DAEMom","GLOBAL",1)~ THEN O#DAEMOM m2
@892 /* You haven't found Wes yet, right? Of course you haven't. I'm sorry, it's all right. */
EXIT

CHAIN IF ~Global("O#DAEMom","GLOBAL",1)~ THEN O#DAEKID m3
@893 /* Demons don't eat ice cream!
Demons don't eat ice cream!
I have a daddy! */
EXIT

CHAIN IF ~Global("O#DAEMom","GLOBAL",1)~ THEN O#DAEDAD m4
@894 /* Oh, hi there. You probably might want to leave - there're demons all over the place, you know. */
END
++ @895 /* That's why I'm here. */ EXTERN O#DAEDAD m4.1
++ @896 /* You are Wes, right? */ EXTERN O#DAEDAD m4.2
++ @897 /* I'm not afraid of demons. */ EXTERN O#DAEDAD m4.3

CHAIN O#DAEDAD m4.1
@898 /* If you're here to fight demons, I'd lend a hand, but I'm actually looking for someone. There's a girl, Miranda... I haven't seen her in years, but I got to make sure she's all right. It's important. */
END
++ @899 /* Do you love her? */ EXTERN O#DAEDAD m4.4
++ @900 /* More important than your duty? */ EXTERN O#DAEDAD m4.5
++ @901 /* I actually have some news for you... */ EXTERN O#DAEDAD m4.7

CHAIN O#DAEDAD m4.2
@902 /* I am! Weird, somebody knows my name. I'm used to being invisible here. */
END
IF ~~ EXTERN O#DAEDAD m4.1

CHAIN O#DAEDAD m4.3
@903 /* Who are you, a Bhaalspawn? Demons are scary, everybody knows that! */
END
IF ~~ EXTERN O#DAEDAD m4.1

CHAIN O#DAEDAD m4.4
@904 /* Of course! I've always... I... */
END
IF ~~ EXTERN O#DAEDAD m4.6

CHAIN O#DAEDAD m4.5
@905 /* Yes! And I don't care what Prelate Wessalen would say. Between you and me, he's an idiot. And Miranda... I'd have married her long ago, if not for his stupid rules! */
END
IF ~~ EXTERN O#DAEDAD m4.6

CHAIN O#DAEDAD m4.6
@906 /* Wait... why are you looking at me like that? */
END
IF ~~ EXTERN O#DAEDAD m4.7

CHAIN O#DAEDAD m4.7
@907 /* Do you know what happened to her? How is she? */
END
++ @908 /* She is looking for you. She and your little daughter. */ EXTERN O#DAEDAD m4.8
++ @909 /* You'd better find out for yourself, and right now. */ EXTERN O#DAEDAD m4.10
++ @910 /* She is raising your daughter. Didn't you know this? */ EXTERN O#DAEDAD m4.8
++ @911 /* Miranda is all right, and she still cares for you. */ EXTERN O#DAEDAD m4.10

CHAIN O#DAEDAD m4.8
@912 /* What? WHAT? */
= @913 /* You're not joking, right? Tell me you are not joking. */
END
++ @914 /* Usually guys say the opposite. */ EXTERN O#DAEDAD m4.9
++ @915 /* Her name is Lanie, and she loves ice cream and rocking horses. */ EXTERN O#DAEDAD m4.10
++ @916 /* Why would I be joking? */ EXTERN O#DAEDAD m4.9

CHAIN O#DAEDAD m4.9
@917 /* I never knew... gods, my head is a mess right now. */
END
IF ~~ EXTERN O#DAEDAD m4.10

CHAIN O#DAEDAD m4.10
@918 /* I need to find Miranda right away. Just point the way... please. I shouldn't be wasting a single minute. */
END
++ @919 /* Of course. She's outside in the palisade. */ EXTERN O#DAEDAD m4.11
++ @920 /* You'll be all right. Just follow the corpses. */ EXTERN O#DAEDAD m4.11
++ @921 /* Yes, but don't hurt her. She's been through a lot. */ EXTERN O#DAEDAD m4.11

CHAIN O#DAEDAD m4.11
@922 /* I will protect her with my life. Thank you, thank you! */
DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("O#DECut5")~
EXIT

CHAIN IF ~Global("O#DAEMom","GLOBAL",2)~ THEN O#DAEKID m5.0
@923 /* I'm going to get a rocking horse for my birthday! Maybe two! */
END
IF ~~ EXTERN O#DAEMOM m5.2

CHAIN IF ~Global("O#DAEMom","GLOBAL",2)~ THEN O#DAEDAD m5.1
@924 /* I cannot thank you enough. */
END
IF ~~ EXTERN O#DAEMOM m5.2

CHAIN IF ~Global("O#DAEMom","GLOBAL",2)~ THEN O#DAEMOM m5.2
@925 /* See, Lanie, <PRO_HESHE> is alive! And you were worried. Wouldn't be pretty if our savior was eaten by demons. */
== O#DAEKID @926 /* Daddy is home! */
== O#DAEDAD @927 /* Well, this is not exactly home... */
== O#DAEMOM @928 /* We'll make our own home. Perhaps on the outskirts of Trademeet, or near the lake. As long as we stay together. */
== O#DAEDAD @929 /* Always. Thank you, miracle stranger. */
END
++ @930 /* I'm that awesome! */ EXTERN O#DAEDAD m5.3
++ @931 /* All in a day's work. */ EXTERN O#DAEDAD m5.3
++ @932 /* And how about a reward for the miracle <PRO_GIRLBOY>? */ EXTERN O#DAEDAD m5.3

CHAIN O#DAEDAD m5.3
@933 /* Here, I don't think I'll need these anymore. Wear them well. */
DO ~SetGlobal("O#DAEMom","GLOBAL",3)
GiveItemCreate("BRAC10",Player1,1,0,0) AddExperienceParty(60000)
EraseJournalEntry(@10015)
EraseJournalEntry(@10016)
AddJournalEntry(@10017,QUEST_DONE)~ 
== O#DAEKID @934 /* We're going to build a house now! Maybe two! */
== O#DAEMOM @935 /* Ever thought about moving to real estate, honey? Certainly pays better than paladinhood. */
== O#DAEDAD @936 /* I just want a life with you two. Quiet or loud - time will show. */
== O#DAEMOM @937 /* Oh, loud, that's for sure! Lanie may need a brother or two down the way. */
== O#DAEDAD @938 /* Goodbye! */
== O#DAEKID @939 /* Bye-bye! */
EXIT

// Miniquest 4: Gheed – Lathander statue from the castle, no reward except XP

BEGIN O#DAEGHE

CHAIN IF ~Global("O#DAEGheed","GLOBAL",0)~ THEN O#DAEGHE g1
@940 /* Hello to you, partner! Looking for some easy coin? I have just the offer for you! */
DO ~SetGlobal("O#DAEGheed","GLOBAL",1)~
END
++ @941 /* Slow down! Who are you? */ EXTERN O#DAEGHE g1.2
++ @942 /* Coin? I could buy the City of Coin thrice over! */ EXTERN O#DAEGHE g1.1
++ @943 /* Get lost, scum. */ EXTERN O#DAEGHE g1.0

CHAIN O#DAEGHE g1.0
@944 /* Ah, too bad. Hey, you! You, over there! No, I don't care you're a demon, I got an offer you can't refuse! */
DO ~SetGlobal("O#DAEGheed","GLOBAL",100) EscapeArea()~
EXIT

CHAIN O#DAEGHE g1.1
@945 /* I knew I saw talent when I saw you! But psst, I am not just talking about coin! Come closer, now: you don't want to miss this. */
END
IF ~~ EXTERN O#DAEGHE g1.2

CHAIN O#DAEGHE g1.2
@946 /* I am your new best friend in this messy adventure! Look: have you heard about some idiots robbing the Temple of Amaunator? Oh, sorry, Lathander. It's so hard to keep with the sun gods these days. */
END
++ @947 /* So? */ EXTERN O#DAEGHE g1.3
++ @948 /* What of it? */ EXTERN O#DAEGHE g1.3
++ @949 /* Who are you calling an idiot? */ EXTERN O#DAEGHE g1.3

CHAIN O#DAEGHE g1.3
@950 /* I do not mean to offend, but surely you are looking for some work? I have solid intelligence that one of the idols of Lathander made it into the castle. The thieves had a relative who worked here, probably. */
= @951 /* So, you find it, you bring it, you give it to me, and I, my friend, will find some poor Lathanderite to close the deal. You'll get a nice artifact for your trouble. */
END
+ ~PartyHasItem("MISC4X")~ + @952 /* I already have the idol. */ DO ~SetGlobal("O#DAEGheed","GLOBAL",2) TakePartyItem("MISC4X")~ EXTERN O#DAEGHE g2.1
++ @953 /* It's a deal. I'll find the Lathander idol and bring it to you. */ EXTERN O#DAEGHE g1.4
++ @954 /* Sure, why not? */ EXTERN O#DAEGHE g1.4
++ @955 /* Not interested. */ EXTERN O#DAEGHE g1.0

CHAIN O#DAEGHE g1.4
@956 /* Just the answer I was hoping for! You go, friend. I'll be here safe and sound... oh, yes. */
DO ~AddJournalEntry(@10018,QUEST)~
EXIT

CHAIN IF ~Global("O#DAEGheed","GLOBAL",1)~ THEN O#DAEGHE g2
@957 /* No luck, hey? Keep looking. */
END
+ ~PartyHasItem("MISC4X")~ + @958 /* I got it! */ DO ~SetGlobal("O#DAEGheed","GLOBAL",2) TakePartyItem("MISC4X")~ EXTERN O#DAEGHE g2.1
++ @959 /* Where do I have to find the idol of Lathander again? */ EXTERN O#DAEGHE g2.2
++ @960 /* See you around. */ EXIT

CHAIN O#DAEGHE g2.1
@961 /* Excellent! I wasn't mistaken in you, after all, heheheh. Always good to work with honest heroes... they are so naive. */
= @962 /* Well, friend, now that I'm a little richer and you're, sadly, not, I'll take my leave. There's trouble brewing in Westmarch, or so I hear. And where's trouble, there's Gheed looking for a pretty bauble! */
DO ~AddExperienceParty(60000) EraseJournalEntry(@10018) AddJournalEntry(@10019,QUEST_DONE) ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

CHAIN O#DAEGHE g2.2
@963 /* The statuette is somewhere in the castle. Hurry, before someone else gets our money! */
EXIT

// Teleportation stone

BEGIN O#DAEGEM

APPEND O#DAEGEM

IF ~!AreaCheck("O#DAE0") !AreaCheck("O#DAE1") !AreaCheck("O#DAE2") !AreaCheck("O#DAE3")~ outside
SAY @964 /* This teleportation stone can transport you and your companions to Nalia's castle, if you wish. */
++ @965 /* I do wish it. */ + to_castle
++ @966 /* Not at this time. */ EXIT
END

IF ~~ to_castle
SAY @967 /* You will be teleported to the castle momentarily. */
IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("O#DAET1")~ EXIT
END

IF ~OR(4) AreaCheck("O#DAE0") AreaCheck("O#DAE1") AreaCheck("O#DAE2") AreaCheck("O#DAE3")~ inside
SAY @968 /* This teleportation stone can transport you and your companions back to Amkethran, if you wish. */
++ @965 /* I do wish it. */ + to_town
++ @966 /* Not at this time. */ EXIT
END

IF ~~ to_town
SAY @969 /* You will be teleported to Amkethran momentarily. */
IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("O#DAET2")~ EXIT
END

END