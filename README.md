# Project Name
Online-Chat

## Overview
Create rails app with devise and bootstrap

# Steps how to run app from dicker

**Clone this repository and then follow these steps**

1. **run docker-compose up --build**
2. **run docker ps and you can see id app container**
3. **enter to the container**
  use docker exec -it <container_id> bash
4. **in command line run next commands**
   bundle exec rake assets:precompile
   rails db:prepare
5**Open your browser and go to your app**
   - [localhost:3001](http://localhost:3001/)

