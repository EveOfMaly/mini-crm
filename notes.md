Objects

Contacts_Visitors
- Belongs_to :contact
- belongs_to :visitor 


Contact  | Visitor 
   Sally        12345


Visitor - Person who visits the website
- Visitor has_many contacts_visitors 
- Visitor belongs to a Contact

- Visitor belongs to a User

Contacts - Person who gives email
- Contact has_many contacts_visitors 
- Contact has many visitors

- Contact belongs to a user

User - Person who owns the CRM
- User has many visitors 
- User has many contacts 


Controller Jobs
Contacts Controller - Job is to create when visitor gives email

sessions Controller - Know if the same user is coming in or not 



Validations to consider
/users#new 





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






