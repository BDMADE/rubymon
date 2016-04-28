# Rubymon
<p>Rubymon is a mobile app that allows players to catch, collect monsters, and eventually
   battle them. The game is played on a mobile app but we want to store user and monster
   information in the cloud. We need you to create a RESTful backend API to store and
   organize the monsters.</p>
   
<h3>How to install</h3>
 Open in your terminal and write the following code:<br/> 
   Step 1:<code>$ git clone https://github.com/bdmade/rubymon</code><br/>
   Step 2:<code>$ cd rubymon</code><br/>
   Step 3:<code>$ bundle install</code><br/>
   Step 4:<code>$ rake db:drop</code><br/>
   Step 5:<code>$ rake db:create</code><br/>
   Step 7:<code>$ rake db:migrate</code><br/>
   Step 8:<code>$ rake db:seed</code><br/>
   Step 9:<code>$ rails server</code><br/>
   
 <h3>Feature</h3>
   1. User can signup/signin by facebook.<br/>
   2. User can use general authentication system if he want to avoid social registration. <br/>
   2. User can create maximum 3 teams.<br/>
   3. User can create maximum 20 Monsters and divide them into 3 teams.<br/>
   4. User can create,read,update and destroy each monster and team.<br/>
   5. An user can not edit or destroy another user's monster or team (full authorization advantages).<br/>
   6. User can create,read,update and destroy monster's type.<br/>
   7. User can view all their monsters and sort by name, power,or weakness.<br/>
   8. User can also search monster from admin panel.
   9. An admin user who have all rights to mange every user's monster CRUD system,He also make new user from his admin panel(Username:a@z.com,password:admin123). 
    
    
 <h3>API</h3>   
<p><code>current_user</code>: It will render current user (logged in user) information.</p>
<p><code>is_logged_in?</code>: This method will check that user is logged or not.</p>
<p><code>is_admin?</code>: This method render a boolean that current user is admin or not.</p>

<p><code>match_user</code>: This method is a private method and it is located in UsersController private section.It match current user with admin user and it prevent to  normal user to edit other user information.</p>

<p><code>sign_in_from_omniauth(auth)</code>:This method is created for facebook log in.</p>
<p><code>create_user_from_omniauth(auth)</code>:This method is created for registering through facebook.<p>