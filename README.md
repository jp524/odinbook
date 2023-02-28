# OdinBook
Built as part of [The Odin Project's Full Stack Ruby on Rails](https://www.theodinproject.com/paths/full-stack-ruby-on-rails?) curriculum: [Rails Final Project](https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project) lesson.

This is a clone of circa 2010 Facebook. Registers users can write posts, add comments and like posts. Users can also personalize their profile with personal information and a picture.

Users chose to accept or decline friend requests they receive in the notification section of the navigation bar. Once friendships are established users can see each other's posts.

https://user-images.githubusercontent.com/85654561/221715833-783a256d-f5fb-4d8c-a960-b99b1eb1d7c1.mp4


Profile Page | Posts Page | Users Page
:-------------------------:|:-------------------------:|:-------------------------:
![Profile Page](readme_files/Screenshot%20Profile%20Page.png) | ![Posts Page](readme_files/Screenshot%20Posts%20Page.png) | ![Users Page](readme_files/Screenshot%20Users%20Page.png)

## Techniques Implemented
* Working with multiple models and their associations (`Users`, `Profiles`, `Posts`, `Comments`, `Likes`, `Friend Requests`)
* Model and system tests using RSpec, fixtures and Capybara
* Hotwire (Turbo and Stimulus) to have a reactive single page application. Use of nested Turbo Frames where models were associated
* Styling following BEM (Block Element Modifier) methodology using SCSS
* User authentication using Devise gem
* Cloud hosted `ActiveStorage` for profile pictures

## Icon Credits

* Default profile picture: <a href="https://www.flaticon.com/free-stickers/anonymous" title="anonymous stickers">Anonymous stickers created by paulalee - Flaticon</a>
* <a href="https://www.flaticon.com/free-icons/notification" title="notification icons">Notification icons created by Pixel perfect - Flaticon</a>
* <a href="https://www.flaticon.com/free-icons/trash" title="trash icons">Trash icons created by Gregor Cresnar - Flaticon</a>
* <a href="https://www.flaticon.com/free-icons/like" title="like icons">Like icons created by Pixel perfect - Flaticon</a>
