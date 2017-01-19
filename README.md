# Sextou


Sextou is a shop (it's a merge between top and show) app that lets your playlist be guided by the people who are listening to it


Don't be that guy who puts only songs that he would like to hear.

Sextou will help you and your friends listen to music together.

It simply logs into a spotify account, selects a playlist and turns it into a link to your friends. They will add songs that they want to hear with you.


## Setup

1. Create an [spotify app](https://developer.spotify.com/my-applications/#!/applications/create) then get the `client id` and the `secret id`. You also need to put a callback for your app, in development it's fine to use `http://localhost:3000/auth/spotify/callback`.

2. Edit the `.env.example` at the root directory with the key provided by Spotify.

3. Rename the `.env.example` to `.env`

4. Run: `bundle install`

5. Create the database `Rake db:create`

6. Run migrations `Rake db:migrate`

5. Run: `bundle exec rails s`
