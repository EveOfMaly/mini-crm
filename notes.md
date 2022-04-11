
Models

App - Instance of an CRM Application
- An App has many Users 
- An App has many Contacts  
- An App has many Visitors 
- An App has many Pages  

User - Individual who uses the CRM
- User belongs to Apps 
- User has many Contacts  
- User has many Visitors    
- User has  many Pages    
- User has many Ahoy::Visits  #turned off set ApplicationController to track all events if want to turn on
- User has many Ahoy::Events   #turned off set ApplicationController to track all events if want to turn on

Contacts - Person who gives email
- Contact Belongs to an App  
- Contact belongs to a User 
- Contact has many Visitors through Identities  
- Contact has many Identities 

(Join - with Many:Many x 2)
Visitor - Person who visits the website
- Visitor has many Identities 
- Visitor has many Contact through Identities 
- Visitor Belongs to an App  
- Visitor has many Ahoy::Visits
- Visitor has many Ahoy::Events
- Visitor has many Visitor_Pages
- Visiot has many Pages through Visitor_Pages
- Visitor has many Visitor_Pages

Identity
- belongs_to :contact
- belongs_to :visitor

Page - Page created by a User
- Page belongs to a User   
- Page belongs to a App 
- has_many :visitor_pages
- has_many :visitors, through: :visitor_pages
- has_many :ahoy_visits, class_name: "Ahoy::Visit"
- has_many :ahoy_events, class_name: "Ahoy::Event"


Ahoy Visit 
- Ahoy::Visit belongs_to :user
- Ahoy::Visit has_many events

Ahoy Event
- Ahoy::Event belongs_to :user
- Ahoy::Visit hbelongs_to :visit

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

See a list of all my contacts -> /app/XXX/contacts  -> contacts#index [X]
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



Controller Jobs
Contacts Controller - Job is to create when visitor gives email

sessions Controller - Know if the same user is coming in or not 





Validations 

Page 
- Title cannot be blank

User
- Create a before_action to set the owner 

Contact
- Age has to between 0 - 100
- First seen is a date - convert format
- Last seen is a date  - convert format
- Email is email format

Visitor






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








-------
What to Expect from the Project Review
Project reviews are focused on preparing you for technical interviews (Links to an external site.). Treat project reviews as if they were technical interviews in both attitude and technical presentation.

During your project review, be prepared to:

Explain your code from execution point to exit point. Use the best technical vocabulary you can. (15 minutes)
Live code. This could be refactoring, adding a new feature, or both. (20 minutes)
You will also be asked questions that test your knowledge of Rails fundamentals. (10 minutes)
If any requirements are missing or if significant gaps in understanding are found, be prepared to do one or all of the following:

Submit an improved version
Meet again for another Project Review
What won't happen:

You won't be yelled at, belittled, or scolded
You won't be put on the spot without support
There's nothing you can do to instantly fail or blow it
Requirements
Use the Ruby on Rails framework.

Your models must:

• Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships [X]

Models

App - Instance of an CRM Application
- An App has many Users [X]]
- An App has many Contacts  [X]
- An App has many Visitors [X]
- An App has many Pages  [X]

User - Individual who uses the CRM
- User belongs to Apps [X]
- User has many Contacts  [X]
- User has many Visitors    [X]
- User has  many Pages    [X]
- User has many Ahoy::Visits [X] #turned off set ApplicationController to track all events if want to turn on
- User has many Ahoy::Events  [X] #turned off set ApplicationController to track all events if want to turn on

Contacts - Person who gives email
- Contact Belongs to an App  [X]
- Contact belongs to a User [X]
- Contact has many Visitors through Identities  [X]
- Contact has many Identities [X]

(Join - with Many:Many x 2)
Visitor - Person who visits the website
- Visitor has many Identities [X]
- Visitor has many Contact through Identities [X]
- Visitor Belongs to an App  
- Visitor has many Ahoy::Visits
- Visitor has many Ahoy::Events
- Visitor has many Visitor_Pages
- Visiot has many Pages through Visitor_Pages
- Visitor has many Visitor_Pages

Identity
- belongs_to :contact
- belongs_to :visitor

Page - Page created by a User
- Page belongs to a User   
- Page belongs to a App 
- has_many :visitor_pages
- has_many :visitors, through: :visitor_pages
- has_many :ahoy_visits, class_name: "Ahoy::Visit"
- has_many :ahoy_events, class_name: "Ahoy::Event"


Ahoy Visit 
- Ahoy::Visit belongs_to :user
- Ahoy::Visit has_many events

Ahoy Event
- Ahoy::Event belongs_to :user
- Ahoy::Visit hbelongs_to :visit

• Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user [X]

Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.  [X]

You must include at least one class level ActiveRecord scope method (Links to an external site.). a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods (Links to an external site.) within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

Your application must provide standard user authentication, including signup, login, logout, and passwords. [X]

Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc... [X]

You must include and make use of a nested resource with the appropriate RESTful URLs. [X]

• You must include a nested new route with form that relates to the parent resource [X]

• You must include a nested index or show route[X]

Your forms should correctly display validation errors. [X]

a. Your fields should be enclosed within a fields_with_errors class [X]

b. Error messages describing the validation failures must be present within the view. [X]

Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app. [X]

• Logic present in your controllers should be encapsulated as methods in your models. [X]

• Your views should use helper methods and partials when appropriate. [X]

• Follow patterns in the Rails Style Guide (Links to an external site.) and the Ruby Style Guide (Links to an external site.). [X]

Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding. [X]