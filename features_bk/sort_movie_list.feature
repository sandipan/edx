Feature: display list of movies sorted by different criteria
 
  As an avid moviegoer
  So that I can quickly browse movies based on my preferences
  I want to see movies sorted by title or release date

Background: movies have been added to database
  
  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  And I am on the RottenPotatoes home page

Scenario: sort movies alphabetically
  When I follow "Movie Title"
  Then I should see "| 2001: A Space Odyssey   | G      | 6-Apr-1968   |" before "| Aladdin                 | G      | 25-Nov-1992  |"
  Then I should see "| Aladdin                 | G      | 25-Nov-1992  |" before "| Amelie                  | R      | 25-Apr-2001  |"
  Then I should see "| Amelie                  | R      | 25-Apr-2001  |" before "| Chicken Run             | G      | 21-Jun-2000  |"
  Then I should see "| Chicken Run             | G      | 21-Jun-2000  |" before "| Chocolat                | PG-13  | 5-Jan-2001   |"
  Then I should see "| Chocolat                | PG-13  | 5-Jan-2001   |" before "| Raiders of the Lost Ark | PG     | 12-Jun-1981  |"
  Then I should see "| Raiders of the Lost Ark | PG     | 12-Jun-1981  |" before "| The Help                | PG-13  | 10-Aug-2011  |"
  Then I should see "| The Help                | PG-13  | 10-Aug-2011  |" before "| The Incredibles         | PG     | 5-Nov-2004   |"
  Then I should see "| The Incredibles         | PG     | 5-Nov-2004   |" before "| The Terminator          | R      | 26-Oct-1984  |"
  Then I should see "| The Terminator          | R      | 26-Oct-1984  |" before "| When Harry Met Sally    | R      | 21-Jul-1989  |"

Scenario: sort movies in increasing order of release date
  When I follow "Release Date"
  Then I should see "| 2001: A Space Odyssey   | G      | 6-Apr-1968   |" before "| Raiders of the Lost Ark | PG     | 12-Jun-1981  |"
  Then I should see "| Raiders of the Lost Ark | PG     | 12-Jun-1981  |" before "| The Terminator          | R      | 26-Oct-1984  |"
  Then I should see "| The Terminator          | R      | 26-Oct-1984  |" before "| When Harry Met Sally    | R      | 21-Jul-1989  |"
  Then I should see "| Aladdin                 | G      | 25-Nov-1992  |" before "| Aladdin                 | G      | 25-Nov-1992  |"
  Then I should see "| Chicken Run             | G      | 21-Jun-2000  |" before "| Chocolat                | PG-13  | 5-Jan-2001   |"
  Then I should see "| When Harry Met Sally    | R      | 21-Jul-1989  |" before "| Chicken Run             | G      | 21-Jun-2000  |"
  Then I should see "| Chocolat                | PG-13  | 5-Jan-2001   |" before "| Amelie                  | R      | 25-Apr-2001  |"
  Then I should see "| Amelie                  | R      | 25-Apr-2001  |" before "| The Incredibles         | PG     | 5-Nov-2004   |"
  Then I should see "| The Incredibles         | PG     | 5-Nov-2004   |" before "| The Help                | PG-13  | 10-Aug-2011  |"
