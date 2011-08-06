This is a 3 column blog I created for http://diegopau.com. Feel free to fork it and ask any questions. It's quite simple and a work in progress yet.

It uses:

 - Omniauth for authentication. Users can leave comments using Facebook, Linkeding or Twitter. They can also leave messages without authentication.
 - RailsAdmin for creating new posts. You access in http://myapp.com/admin to the rails admin menu where you can manage your posts, comments or users.
 - The new posts are edited with the ckeditor; allowing you to format text, attach pictures or videos, etc..
 - Some jQuery for AJAX comment posting / deleting.
 - Blueprint for better CSS
 - Truncate_html plugin to truncate posts in index page

 Its ready to be deployed with Heroku.

 It allows to:

 - Create posts and associate tags.
 - Create languages and asociate them to posts.
 - Filter posts by tags, languages or both.
 - Authenticate users and allow them to leave comments. They can leave comments if they are not authenticated too.
 - See http://diegopau.com as an example.

 Intial configuration.

 - First you should give it some other title and logo as it is now configured for my blog :)

 - To be able to migrate de database you have to remove the content inside the file: /config/initializers/rails_admin.rb. Then do rake db:migrate and then put the back the content of the rails_admin.rb file.

 - To register an user for RailsAdmin you have to add :registerable to admin_user.rb so it looks like this:

    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable

 - Then after deploying it, if you don't want other people being able to use RailsAdmin you should (after registering an user for yourself) go back to admin_user.rb and delete :registerable.


 Let me know if I can improve it somehow!! but remember it is a work in progress ...