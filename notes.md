User Story

General Format
- As a <type of user>
- I want <some goal>
- So that <some reason>

Homepage of static#home []
- As a guest 
- I want to get information on the app
- So I can start to get information on my audience

More Information -> welcome-to-crm []
- As a guest
- I want to understand if this product is for me
- So I can start to get information on my audience

User Sign up  -> /signup []
- As a guest 
- I want to signup witouth oauth or without oauth
- So I can start to get information on my audience.


Login User - > /login []
- As a user 
- I want to login to my account and see my data
- So that I can continue my session.


Log out User  -> /logout  []
- As a user 
- I want to lougout of my account
- So that I end my session 

Below actions require logged in 

Have instructions on how to use the tool   -> /user/app/home

See a list of all my contacts -> /app/XXX/contacts  -> contacts#index
- As a user 
- I want to create a new contact
- So tha

Manually Add a contact -> /app/XXX/contacts/new  -> contacts#new 
- As a user 
- I want to create a new contact
- So tha



Create a page -> /users/page/new  
- As a user 
- I want to create a new page
- So that I can get tracking on that page

Button to fire traffic to a page



Information on what the user does 

See a view of all the users contact    -> /app
- As a user 
- I want to get a view of all the contacts  
- So that I can have insight to take action.

Create a new contact    -> /user/app/crm/new
- As a user 
- I want to get add a new contact 
- So that I can manage my relationships



See a view of a website visitors that visit page -> user/visitors 
- As a user 
- I want to get a view of all the visitors of my site 
- So that I can have insight to take action.






#design ability to create a page <---track that page. User has many pages 




Contact  | Visitor 
   Sally        12345



User - Person who owns the CRM
- User has many Apps [X]
- User has many contacts  [X]

- User has many visitors  []
- User can have many pages  []

App
- An App has many Users [X]
- An App has many Contacts  []

- An App has many Visitors []
- An App has many Pages  []

Contacts - Person who gives email
- Contact Belongs to an App  [X]
- Contact belongs to a user [X]



- Contact has_many contacts_visitors []
- Contact has many visitors []


Objects

(Join Table) Contacts_Visitors
- Belongs_to :contact
- belongs_to :visitor 




Visitor - Person who visits the website
- Contact Belongs to an App  []
- Visitor has_many contacts_visitors  []
- Visitor belongs to a Contact []
- Visitor has many Pages []






Page - Page created by a User
- Page belongs to a User
- Page belongs to a App
- Page has many visitors


Controller Jobs
Contacts Controller - Job is to create when visitor gives email

sessions Controller - Know if the same user is coming in or not 





Validations 







General User Flow
1. Anon Visits Site -> Connect Visitor to Session
2. Random Visitor ID 12345 (Sally Susa)
3. Connects all activity to Visitor ID
4. Visitor signs up
5. Call alias method
6. User logs in with email 
5. Identify called using contactname
6. Contacts Connected to (visitir)
7. Find all contacts with distinct ID connected 


























General User Flow

Sally visits website -> Assign Viewer a Distinct_id(12345) -> Connect Activity to Distinct_id(12345) -> Create a Visitor

Signup
-> sally signs up and call application.alias("sally@email.com) -> adds alias and connects ditinct_id (join table) -> Sally Logs in -> Calls Identify -> -> Finds all instance of alias (sally@gtest = 123456 -> maps to the visitor (first) -> Contact Created



                      

Identity Management - Track the actions of users across your website. Understand user journey.
                    - 1) When a user first visits the site
                      2) When a ser firs signs up for an account 
                      3) When a user logs in later

                      Sign up 
                      - call application.alias("Your_user_id) once. 
                      - creates a mapping between distinct_id and unique identifier 

                      Log In 
                      - calls application.identify("your_user_id)



Distinct ID 
Assigned to every user that is trackeds 
Connects all the events performed by an indivfual user


Visitor - Any unknown visitor to your site who is not logged in and has no conversation history.
        - Each visitor should have a unique distinct_id that represents the identity of the user.
               - If the distinct_ids already exist and it has a user profile tied to it, then the income user dates updates the existing profile. 
               - If the distinct_id does not already exist, a new user profile is created for the distint_id   

Contacts - As soon as a visitor starts a conversation with you. Visitor has given their email. 
     - If you engage a lead, and they click on a link which takes them back to your site you automatically identify them with the same email address when they start a conversation. 

Member - A lead becomes a user when they sign up to your product or log into an existing account. All of their information and conversation you had with them remains in the user profile. 




Associations

Distinct_ID 
belongs to visitor
belongs to user

Visitor 
 - Belongs to a User
 - Visitor belongs to a User

User
     Has many Distinct_Ids
     User has many Visitors

Visitor
- Name
- (Assigned) Distinct_ID (Assigned at random once a user visits page)
- Last Visit 
- Country Code 
- Region
- City
- Referring Domain
- Engagement Score (Object) - Future

Contacts
- (Assigned) ID 
- Name
- Age
- Email
- Gender
- Last Visit 
- Country Code 
- Region
- City
- Referring Domain


Event 
Lead Model






