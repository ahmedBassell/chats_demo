# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


* API endpoints
Apps:

CREATE App : POST : localhost:3000/apps?name=app
Get Apps : GET : localhost:3000/apps
Get App by token : GET : localhost:3000/apps/aDfKKZav3mGyj2XqFLJp3bge


Chats:

Get Chats by token : GET : localhost:3000/apps/aDfKKZav3mGyj2XqFLJp3bge/chats
Get Chats by Token & Number : GET : localhost:3000/apps/aDfKKZav3mGyj2XqFLJp3bge/chats/1

Delete Chat : DELETE : localhost:3000/apps/aDfKKZav3mGyj2XqFLJp3bge/chats/1
