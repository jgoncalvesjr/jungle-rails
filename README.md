# Jungle

### Version 1.0.0

Welcome to Jungle! Jungle is mini e-commerce application built with Rails 4.2 for purposes of teaching Rails development by example. Real world development requires learning to work and test legacy code, new technologies, frameworks and programming languages, and proper version control. Jungle covers all these topics.

# Final Product

The following screenshots demonstrate features implemented and tested with RSpec, Capybara and Poltergeist during the project.

### Main page

Includes "sold out" badges and disabling of "add to cart" button, in case a product is out of stock.

![Jungle Main Page](https://github.com/jgoncalvesjr/jungle-rails/blob/master/docs/jungle_main.png) 

### About page

A brief page description, to exercise Active Record routing.

![Jungle About Page](https://github.com/jgoncalvesjr/jungle-rails/blob/master/docs/jungle_about.png) 

### User Login and Registration

User registration, authentication and sessions, and corresponding validation routines.

![Jungle User Registration](https://github.com/jgoncalvesjr/jungle-rails/blob/master/docs/jungle_register.png)
![Jungle User Login](https://github.com/jgoncalvesjr/jungle-rails/blob/master/docs/jungle_login.png)
![Jungle Active Session and Order Summary](https://github.com/jgoncalvesjr/jungle-rails/blob/master/docs/jungle_session_order.png)

### Admin Pages

Admin dashboard, product and category management pages, accessed through HTTP authentication.

![Admin Dashboard](https://github.com/jgoncalvesjr/jungle-rails/blob/master/docs/jungle_admin_dashboard.png)
![Admin Category Management](https://github.com/jgoncalvesjr/jungle-rails/blob/master/docs/jungle_admin_categories.png)
![Admin Product Management](https://github.com/jgoncalvesjr/jungle-rails/blob/master/docs/jungle_admin_products.png)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* bcrypt

## Technologies

* Ruby
* Rails
* money-rails
* Active Record
* Bootstrap
* RSpec
* Capybara
* bcrypt
* PostgreSQL
* SASS