# TERMOVIE

Termovie is a terminal command line app written in Ruby that will reccomend film titles based off of a users mood and preferences.

## Features


* Inputing mood for movie reccomendations.

- Mood will be based off of movie genres. Included will be comedy, romance, drama, documentary, horror, action, and sci-fi.

* Selecting era that the movie was created.

- In addition to mood, the user will be able to pick out from what era they wish to view from. Limited to 60's, 70's, 80's, 90's, and modern (after 2000).

* Adding movies that the user wants to watch.

- The user will be have the option to add films to the database. Input will include: Title, Year, Rating, Director, Genre, and URL.

* Reviewing movies that the user has viewed.

- The user will have the option to review a movie in the database. The user will navigate through the database by viewing tables based off of genre (showing every movie in the table), or specific titles.

* Deleting movies from the users queue.

- The user will have full control over the database, and will be able to remove any movies that they wish. Navigation for the purposes of deletion will be the same path as that for editing and reviewing.

* Editing movie information.

- The user will be able to navigate through titles and edit any information in case of errors or change.

The program will kick back a random URL based upon the users input preference and what they have in the database.



Usage Example: Watching A Movie

> ./termovie

Hey, Movie Lover! What would you like to do?

1. Watch a movie
2. Add to your list
3. View Your list
4. Edit your list
5. Review a movie
6. Exit

> 1

How are you feeling?

1. Funny
2. In Love
3. Dramatic
4. Educational
5. Scary
6. Indestrutable
7. Out of this World

> 1

That's Great! I'm feeling pretty funny, myself. Let's Watch a funny movie from the 60's? Yes or No?

> No

OK OK, What about the 70's? Yes or No?

> No

OK OK, What about the 80's? Yes or No?

> No

OK OK, What about the 90's? Yes or No?

> Yes

Great! Let's Try this one! http://www.netflix.com/WiPlayer?movieid=70000782&trkid=13463723&tctx=0,35,33841568-df9e-46a3-b2b9-5b349788edf8-29125479 NOTE: If you hold command and double-click the link in the terminal, it will open the link in the default browser.


(Exit)


#Acceptance Criteria
#   * Program prints out menu with all prompts.
#   * Program follows with feeling and era prints if 1 is selected.
#   * Program prints out valid URL.
#   * Movie information will be added to the "watched" section of the database.

Usage Example: Adding A Movie to List

> ./termovie

Hey, Movie Lover! What would you like to do?

1. Watch a movie
2. Add to your list
3. View your list
4. Edit your list
5. Review a movie
6. Exit

> 2

Great! What is the name of the movie?

> Billy Madison

What year was the movie made?

> 1995

What is this movie rated?

> PG-13

Who is the director of this movie?

> Tamra Davis

What is the genre?

1. Comedy
2. Romance
3. Drama
4. Documentary
5. Horror
6. Action
7. Sci-Fi

> 1

And the URL?

> http://www.netflix.com/WiPlayer?movieid=70000782&trkid=13463723&tctx=0,35,33841568-df9e-46a3-b2b9-5b349788edf8-29125479

Great! Billy Madison has been added to your movie list.

(Exit)











