# TERMOVIE

Termovie is a terminal command line app written in Ruby that will reccomend film titles based off of a users mood and preferences.

## Features


* Inputing mood for movie reccomendations.

- Mood will be based off of movie genres. Included will be comedy, romance, drama, documentary, horror, action, and sci-fi.

* Selecting era that the movie was created.

- In addition to mood, the user will be able to pick out from what era they wish to view from. Limited to 80's, 90's, and modern (after 2000).

* Adding movies that the user wants to watch.

- The user will be have the option to add films to the database. Input will include: Title, Year, Rating, Director, Genre, URL, and Duration.

* Reviewing movies that the user has viewed.

- The user will have the option to review a movie in the database. The user will navigate through the database by viewing tables based off of genre (showing every movie in the table), or specific titles.

* Deleting movies from the users queue.

- The user will have full control over the database, and will be able to remove any movies that they wish. Navigation for the purposes of deletion will be the same path as that for editing and reviewing.

* Editing movie information.

- The user will be able to navigate through titles and edit any information in case of errors or change.

The program will kick back a random URL based upon the users input preference and what they have in the database.



Usage Example:

> ./termovie

1. How are you feeling: Funny?, In Love?, Dramatic?, Educational?, Scary?, Indestrutable?, or Out of this World?

> Funny

2. That's Great! I'm feeling pretty funny too. Let's Watch a funny movie from the 80's? Yes or No?

> No

3. Ok OK, What about the 90's? Yes or No?

> Yes

4. Great! Let's Try this one! http://www.netflix.com/WiPlayer?movieid=70000782&trkid=13463723&tctx=0,35,33841568-df9e-46a3-b2b9-5b349788edf8-29125479



