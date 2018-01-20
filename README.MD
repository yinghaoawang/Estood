# Estood
A social media platform built on RoR. My first "big" project.

### Features:
- Implemented
    - Users
    - Followers
    - Posts
    - Reposts
    - Likes
    - Post commenting
- Missing
    - Private messaging
    - User and post searching

## Getting Started
  - Make sure you have these installed
    - Ruby
    - Ruby-dev (ruby header files)
    - Ruby bundler
    - CouchDB
    - Sqlite3-dev (sqlite3 header files)
  - Install gems with `bundle install`
  - Build with `rake`
  - Start web server with `rails server`
  - Start database server with `couchdb start` (on a separate console)
  - Go to `localhost:3000/`

## Build with
  - Ruby on Rails - Used in both the frontend and backend
  - CouchDB - Primary data store
  - Bootstrap 3.0 - Frontend styling

## Screenshots of features
### User Generation
![](https://i.imgur.com/kBfly7q.png)

## Registration
![](https://i.imgur.com/qUVFRKj.png)

## User Dashboard
![](https://i.imgur.com/QM6qS37.png)

## User liking, following, reposting, and commenting
![](https://i.imgur.com/KuUbV2J.png)

# Messages from the developer about development
## What this is
This project is self admittedly very badly planned and implemented. It was
a first web development project meant to get my feet wet. Although, I was
happy with the product from the front end, the inner workings were just too badly
done.

## Post Mortem
Overeagerness of features caused constant changes in model relationships. This
combined with underplanning forced me to rewrite much of the code and architecture.


Terrible modularity led to an extremely sloppy codebase. Even though I wrote the
entire project by myself, I was struggling to understand much of the code which made
adding and fixing features increasingly harder as the project got bigger.


On top of that, using a not widely used database (CouchDB) provided me with more problems.
The only Rails API (CouchRest) was very clunky and difficult to use. Much of the code
used with the CouchRest API was very "hacky" in order to combat the weaknesses of
the API.

#### Lessons Learned: 
    1. Create a minimum viable product before trying to change model relationships.
    2. Put more time and effort into selecting which DBs and APIs to utilize.
    3. The importance of modularity, even in something as high level as RoR.
    4. Come up with relationships before creating the models
