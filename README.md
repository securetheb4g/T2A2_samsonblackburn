# README

//R7 Identify the problem you are trying to solve:

In Australia it is difficult to find high quality cooking equipment, most equipment has been cheaply made in China and imported from the same sources. This application seeks to bring Japanese Donabes and consumer together. This high quality traditional cooking equipment is hand made in Japan.

//R8 Why is it a problem that needs solving?
WIth nearly two thirds of Australian adults overweight or obese and almost a quarter of Australian children the same, Australia is the fifth fattest nation in the world. Much of the problem is how we regularly cook our foods. Using heavy oils and hydrogenating fats regularly. The reason we cook using heavy oils and hydrogenated fats is because it tastes good. But food can taste excellent without those ingredients if you have access to better cooking methods. This web application is designed to bring hard to source cooking equipment from Japan to everyday consumers by connecting consumers both to a source and with the ability to sell their second hand Donabes when upgrading.

//R9 URL of deployed website
https://limitless-inlet-87318.herokuapp.com/

//R10 Link to GitHub repository
https://github.com/securetheb4g/T2A2_samsonblackburn

//R11 Description of the marketplace app:

The purpose of this application is to bring artisan cooking equipment to an easy to shop for website and also allow users to sell their second hand equipment to others. Japanese cooking equipment is handmade and difficult to source, this website will take the struggle out of that process.

Functionality / features
This website stores information in a Postrgresql database, Users are able to sign up, sign in and sign out of the application. There is a central page for the users to browse the products and implementation of Stripe to allow user purchases. The website uses Rolify to distinguish between users and Devise to process the authentication.

Sitemap

Screenshots

The target audience are Australians looking for a new way to cook food that better supports their lifestyle.

Tech stack
This website relies heavily upon the Ruby programming language coupled with the Rails framework. 
Html, CSS, SCSS and Javascript are also used in this website to complement functionality.
Postgresql is used to house the database data. Balsamiq was utilised to create the wireframes, VisualStudioCode is used to create the readme and access the Markdown format for this readme. 
Heroku has been utilised to deploy the application. Github is the standardised version control system used. 
Cloudinary has been used for image hosting and scaling.

//R12 User stories for this app

The use cases for this application are simple. 
There are two different roles: A user and an Admin. 

The User can browse the products available, select one to purchase and supply the information needed to create an order, they can also list products of their own to sell.

As an admin I want to be able to see, update and delete Donabe listings, I also want to be able to maintain the website.

//R13 Wireframes for this app

//R14 An ERD for this app

//R15 Explain the different high-level components(abstractions) in this app

This is an MVC Application which means it practices separation of concerns between a Model, View and controller. 

Model: The model is responsible for maintaining the state of the application. The state of a model changes. Sometimes only lasting for a couple of interactions, sometimes permanent, sometimes stored outside the app in a database. This application stores its information in Postgresql.

A model represents data and it also enforces business rules that apply to that data. For example: If a discount shouldn't be applied to orders less than $20, the model enforces this constraint. 

View: The view generates the user interface normally based on data in the model. 
For example: An online store has a list of products to be displayed on a catalog screen. The list is accessible via the model but the view acceses the list from the model and formats it for the end user. 

Although the view can present various ways of inputting data, the view itself never handles incoming data.

Many views can access the same model data and for different purposes. 
So a view that displays product info on a catalog page and another set of views used by admin to add and edit products.

Controllers: The controllers orchestrate the application. They receive the events from browser interaction and interact with the model and then the view to display an objective to the user.


//R16 Detail any third party services the app will use

This application uses the following third party services:

Heroku

Postgresql

Cloudinary

Github

Boost Note

Balsamiq

//R17 Describe this projects models in terms of the relationships(active record associations) they have with each other

Roles.rb User.rb and Product.rb all inherit from ApplicationRecord. 
Application record inherits from ActiveRecord Base.

//R18 Discuss the database relations to be implemented in the application

//R19 Provide database schema design

//R20 Describe the way tasks are allocated and tracked in the project

Tasks are allocated and tracked via BoostNote.

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

* ...
