# Event Mapper API
[![Build Status](https://travis-ci.com/SSchwartz214/event_mapper_api.svg?branch=master)](https://travis-ci.com/SSchwartz214/event_mapper_api)

## Description

This is the backend API that supplies [Event Mapper](https://event-mapper-fe.herokuapp.com/), an app that locates and displays events hosted by Ticket Master on a map.  The user can then add events to their watchlist to view and purchase tickets to at a later date.


## Rails version: 5.1.6

## Configuration

* Clone the repository:
```
git clone https://github.com/SSchwartz214/event_mapper_api.git
```

* Setup:
```
$ bundle install
$ bundle update
$ rake db:{create,migrate}
```

* To view locally:
```
$ rails s
visit 'localhost:3000' in your browser
```

* How to run the test suite
```
$ rspec
```

* Production Link

  [Event Mapper API](https://event-mapper-api.herokuapp.com/)

## API Endpoints

### Users:

* POST /api/v1/users

  * Allows creating a new user with the parameters:
  ```
   { "user": { given_name: "seth", family_name: "schwartz", email: "seth@gmail.com", google_id: "12345", imageUrl: "wwww.image.com" } }
  ```

### Events:

* GET /api/v1/users/:user_id/events
   * Returns all the events associated with the user with an id specified by :user_id 

* POST /api/v1/users/:user_id/events
   * Adds an event to the user with :user_id
   
* DELETE /api/v1/users/:user_id/events/:id
   * Removes the event with :id from the user with :user_id
   
 ## Contributors

* [Seth Schwartz](https://github.com/SSchwartz214)
* [Paul Kim](https://github.com/sojurner)
* [Joel O'Connor](https://github.com/JoOCon)
  
