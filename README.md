# twitter_search

Simple web app where you can display tweets based on search term provided. It can be a super simple page with input field on the top of it. Results can be shown right under the input.

## Setup your Twitter app

Twitter API v1.1 requires you to authenticate via OAuth, so you'll need to register your application with Twitter. Once you've registered an application, make sure to set the correct access level, otherwise you may see the error:

```bash
Read-only application cannot POST
```
Your new application will be assigned a consumer key/secret pair and you will be assigned an OAuth access token/secret pair for that application. You'll need to configure these values before you make a request or else you'll get the error:

```bash
Bad Authentication data
```

## Create the .env file

```bash
TWITTER_CONSUMER_KEY=YOUR_CONSUMER_KEY
TWITTER_CONSUMER_SECRET=YOUR_CONSUMER_SECRET
TWITTER_ACCESS_TOKEN=YOUR_ACCESS_TOKEN
TWITTER_ACCESS_SECRET=YOUR_ACCESS_SECRET
```

Those value will be load in the ENV when booting the app.

## Setup rails app and run rails server

```bash
bundle install

bundle exec rails server
```

## External gem used

- twitter
- dotenv

## Improvements

- Paginate tweet result
- Add more params to filter result
- Improve the UI and show message to the user

