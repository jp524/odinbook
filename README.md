# OdinBook
Built as part of [The Odin Project's Full Stack Ruby on Rails](https://www.theodinproject.com/paths/full-stack-ruby-on-rails?) curriculum: [Rails Final Project](https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project) lesson.

This is a clone of circa 2010 Facebook. Registers users can write posts, add comments and like posts. Users can also personalize their profile with personal information and a picture.

Users chose to accept or decline friend requests they receive in the notification section of the navigation bar. Once friendships are established users can see each other's posts.

*Demo GIF will be added*

## Techniques Implemented
* Working with multiple models and their associations (`Users`, `Profiles`, `Posts`, `Comments`, `Likes`, `Friend Requests`)
* User authentication using Devise gem
* Hotwire (Turbo and Stimulus) to have a reactive single page application. Use of nested Turbo Frames where models were associated
* Styling following BEM (Block Element Modifier) methodology using SCSS
* Cloud hosted `ActiveStorage` for profile pictures
* Model and system tests using RSpec, fixtures and Capybara

## Icon Credits

* Default profile picture: <a href="https://www.flaticon.com/free-stickers/anonymous" title="anonymous stickers">Anonymous stickers created by paulalee - Flaticon</a>
* <a href="https://www.flaticon.com/free-icons/notification" title="notification icons">Notification icons created by Pixel perfect - Flaticon</a>
* <a href="https://www.flaticon.com/free-icons/trash" title="trash icons">Trash icons created by Gregor Cresnar - Flaticon</a>
* <a href="https://www.flaticon.com/free-icons/like" title="like icons">Like icons created by Pixel perfect - Flaticon</a>