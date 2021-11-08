# Github Webhook listener

## Using:

- Ruby 3.0.1
- Rails 6.1.4
- [Ngrok](https://ngrok.com/)
- Postgres

## About
In this project an API is listening and saving [Github webhook](https://docs.github.com/en/developers/webhooks-and-events/webhooks/about-webhooks) events data in a Postgres database.
For that, new opened Github issues and its comments are being monitored in this repository and sent to the local project if it is configured, or to the [production app](https://jaya-challenge-axel.herokuapp.com/).
To configure a webhook we used the following [tutorial](https://docs.github.com/en/developers/webhooks-and-events/webhooks/creating-webhooks) 
made available by Github. The project also allows retrieving the persisted events using basic authentication.

P.s.: The production app does not return any visual feedback.
See the `Production link` session to use.

## Download and Local installation

#### 1) Clone and configure your bundle and database
```sh
git clone https://github.com/axelzito/jaya-challenge.git project_name
```

```sh
cd project_name
```

```sh
bundle install
```

```sh
sudo -u postgres createuser -s $USER -P
rails db:create

If the below step return any erro, try this:

sudo -u postgres psql
\password

Set your password, and try again:
 
rails db:create
```

```sh
rails db:migrate
```

#### 2) Configure you `.env` file to use the username and password

```sh
cp .env.example .env
```

#### 3) Install and configure the ngrok dependence
```sh
sudo snap install ngrok
```
To generate a public url that will route to your local host do:
```sh
sudo ngrok http 4000 
```

In your `config/environments/development.rb` file, add a line with the ngrok url

![](public/ngrok-terminal.png)

```sh
config.hosts << 'xxxx-xxx-xxx-xxx-xxx.ngrok.io'
```

#### 4) Start your server
```sh
rails s -p 4000
```

#### 5) Run tests

To run the tests, just run the command:

```sh
rspec
```

## Production link:

This project is running in Heroku with automatically deploys from master branch after pass in CI with Github Actions.
- https://jaya-challenge-axel.herokuapp.com/

To test, just create an issue or comment in existent issue in this repository.
- https://github.com/axelzito/jaya-challenge/issues

### After that you can check just using Postman:

It is necessary to use Basic Authentication
```sh
Username: xxx
Password: xxx
```

To return all issues, just run
```sh
GET https://jaya-challenge-axel.herokuapp.com/api/issues/
```

```sh
[
    {
        "id": 1,
        "action": "created",
        "created_at": "2021-11-06T20:00:07.981Z",
        "updated_at": "2021-11-06T20:00:07.981Z"
    },
    {
        "id": 2,
        "action": "edited",
        "created_at": "2021-11-06T20:04:09.061Z",
        "updated_at": "2021-11-06T20:04:09.061Z"
    }
]
```

To return a specific issue, just run
```sh
GET https://jaya-challenge-axel.herokuapp.com/api/issues/:id
```
To return a full event from a specific issues, just run
```sh
GET https://jaya-challenge-axel.herokuapp.com/api/issues/:id/events
```

It is necessary to use Basic Authentication
```sh
Username: xxx
Password: xxx
```

by [Axel Miguez](https://github.com/axelzito)
