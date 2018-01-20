# Estood
A social media platform built on RoR. 

### Features:
- Implemented
    - Users
    - Followers
    - Posts
    - Likes
- Missing
    - Post commenting
    - Wall writing
    - Private messaging

## Getting Started
  - Make sure you have these installed
    - Ruby
    - Ruby-dev (ruby header files)
    - Ruby bundler
    - CouchDB
    - libsqlite3-dev (sqlite3 header files)
  - Install gems with `bundle install`
  - Build with `rake`
  - Start web server with `rails server`
  - Start database server with `couchdb start` (on a separate console)
  - Go to localhost:3000/

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
![](https://i.imgur.com/7WCQb51.png)

## User liking, following, and reposting
![](https://i.imgur.com/pZjd3sG.png)

# Messages from the developer about development
## What this is
This project is self admittedly very badly planned and implemented. It was
a first web development project meant to get my feet wet. Although, I was
happy with the product from the front end, the inner workings were just too badly
done.

## How I feel about this
I was relatively happy with the result because it was my first time creating something
that works using a large framework. I would have been much happier if posting was integrated.

## Post Mortem
Terrible modularity led to an extremely sloppy codebase. Even though I wrote the
entire project by myself, I was struggling to understand much of the code which made
adding and fixing features increasingly harder as the project got bigger.


On top of that, using a not widely used database (CouchDB) provided me with more problems.
The only Rails API (CouchRest) was very clunky and difficult to use. Much of the code
used with the CouchRest API was very "hacky" in order to combat the weaknesses of
the API.

#### Lessons Learned: 
    1. Put more time and effort into selecting which DBs and APIs to utilize.
    2. The importance of modularity, even in something as high level as RoR.
    3. Come up with OOP design before creating the models
