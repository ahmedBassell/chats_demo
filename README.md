# Getting Started

* Start services
```bash
docker-compose up
```


* Migration
```bash
docker-compose run web rake db:migrate
```


* How to run the test suite
```bash
docker-compose run web bundle exec rspec
```


# API endpoints

## Apps:

- Get Apps : GET : `localhost:3000/apps`
- Create App : POST : `localhost:3000/apps?name=app`
- Get App by token : GET : `localhost:3000/apps/{{app_token}}`
- Update App by token: PUT : `localhost:3000/apps/{{app_token}}/?name=new app`
- Delete App by token : DELETE : `localhost:3000/apps/{{app_token}}`

## Chats:

- Get Chats by token : GET : `localhost:3000/apps/{{app_token}}/chats`
- Create Chat : POST `localhost:3000/apps/{{app_token}}/chats`
- Get Chats by Token & Number : GET : `localhost:3000/apps/{{app_token}}/chats/{{chat_number}}`
- Delete Chat : DELETE : `localhost:3000/apps/{{app_token}}/chats/{{chat_number}}`

## Messages:

- Get Messages of specific Chat : GET : `localhost:3000/apps/{{app_token}}/chats/{{chat_number}}/messages`
- Create Message in specific Chat : POST : `localhost:3000/apps/{{app_token}}/chats/{{chat_number}}/messages`
- Get Messages by Number : GET : `localhost:3000/apps/{{app_token}}/chats/{{chat_number}}/messages/{{message_number}}`
- Delete Messages : DELETE : `localhost:3000/apps/{{app_token}}/chats/{{chat_number}}/messages/{{message_number}}`


# Deployed version
http://3.8.125.186:3000/
