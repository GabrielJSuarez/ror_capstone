# Ruby On Rails Capstone Project - Group our Transactions

> Capstone project developed as a final project for the ruby on rail module on Microverse, a mobile application that groups the hours logged by a group of freelance programmers working on several projects

# HOW TO USER:

- Log in or Sign up, for the Sign up process you will need to attach a picture file for your avatar (Make it a good one!)

# YOU MUST BE LOGGED IN TO DO THE NEXT STEPS

- You can create new projects for your user in the Projects or External Projects pages, you can also access the new project link from the menu everywhere in the app. Projects can be created with a group associated or without one. 
- You can create new groups in the All Groups page, you can also access the group link from the menu everywhere in the app
- Projects that are associated to a group will appear in 'All Projects', projects without a group will be in 'External Projects'
- You can add new projects to a group by accessing that group in 'All Groups' and then clicking 'Add Project'

#FEATURES:

- Projects with a group associated will have the first group (that has the association) image
- Projects without a group will have a placeholder image
- You can see all projects from all users associated in the group info.

# PREVIEW:



## Built With

- Ruby v2.7.2
- Ruby on Rails v6.1.3.2
- Bootstrap 5 css 
- Simple Forms Gem
- Better Errors Gem
- Guard Gem
- Rspec Rails
- Capybara
- Devise
- Kaminari
- Bullet
- Cloudinary
- image_processing

# Live Demo

# https://pure-thicket-53049.herokuapp.com/

### Prerequisites

- Ruby v2.7.2
- Ruby on Rails v6.1.3.2
- Postgres: >=9.5

## Getting Started

### Setup

To get a local copy up and running follow these simple example steps.

Clone the repository to your local machine

$ `git clone https://github.com/GabrielJSuarez/ror_capstone`

Go to your directory

$ `cd ror_capstone`

Run in terminal [You must have Ruby installed on your system.]

$ `bundle install`

$ `yarn install`

the command $ `bundle install` is important to install required gem for the app to start. After you finish type:

- To create the local database tables in Postgres you will need to have it configured locally and then run:

$ `rails db:create`

- To run migration files:

$ `rails db:migrate`

This will do the proper migrations for the database, after that you can run the server:

$ `rails server`

Open your browser to localhost

http://localhost:3000/

- Run tests:

$ `bundle exec rspec`

$ `Rubocop lint`

$ `rubocop .`

## Authors

👤 **Gabriel Suárez**

- Github: @ginnandjuice(https://github.com/ginnandjuice)
- Twitter: [@fatbaxxter](https://twitter.com/fatbaxxter)
- Linkedin: [Gabriel Suárez](https://www.linkedin.com/in/gabriel-ginn-suarez/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

Design idea by [Gregoire Vella on Behance](https://www.behance.net/gregoirevella)

## 📝 License

This project is MIT licensed.

