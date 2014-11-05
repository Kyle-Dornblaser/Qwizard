# QWIZARD

### Setup in Cloud 9
1. Register at [www.c9.io](http://www.c9.io).
2. Click *Create a New Workspace*.
3. Click *Clone from URL*.
4. Enter the Heroku Git URL in the *Source URL* text box.
5. Click *Ruby on Rails*.
6. Click *Create*.
7. Wait a minute for the workspace to create. You may need to refresh your page.
8. Click on the new workspace when it is created.
9. Click *Start Editing* and the C9 IDE will open. 
10. Run the following commands in the terminal.
```
bundle install
sudo apt-get remove --purge postgresql-9.3
sudo apt-get install postgresql-9.3
``` 

11. Run the following commands in the terminal.
```
sudo su postgres
createuser ubuntu --interactive
exit
```
**Important:** Make sure to make ubuntu a superuser.

12. Run `rake db:setup` in the terminal to setup the database.
13. Run `rails s -p $PORT -b $IP` to start the server up.


### Credits
* Kyle Dornblaser
* Logan Hasbrouck
* Jordan Smith
* Christopher Solomon
* Aida Syrkett
