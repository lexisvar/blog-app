# BlogApp

BlogApp is a dynamic blogging platform built with Ruby on Rails 7 and styled with Bootstrap. It serves as a technical test application to demonstrate the implementation of key Rails features. The app uses PostgreSQL for its database, Devise for user authentication, and Faker for generating sample data. BlogApp features rich content management for posts and a commenting system. The application is designed to provide a seamless and responsive user experience.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration](#configuration)
- [Database Setup](#database-setup)
- [Running the Application](#running-the-application)
- [Features](#features)
- [Usage](#usage)
- [Authentication](#authentication)
- [Contributing](#contributing)
- [License](#license)
- [Credits](#credits)

## Requirements

To get started with the app, clone the repo and then install the needed gems:

```bash
- Ruby 3.3.2
- Rails 7.0.8
- PostgreSQL
- Node 20.7.0
- Yarn
```

## Installation

To get started with the app, clone the repo and then install the needed gems:

```bash
git clone https://github.com/lexisvar/BlogApp.git
cd BlogApp
bundle install
```
Next, install the required JavaScript packages:

```
yarn install
```

## Configuration

Create and configure your .env file for environment variables. You'll need to set up your database configuration and other environment-specific settings here.

```bash
DATABASE_USERNAME=your_db_username
DATABASE_PASSWORD=your_db_password
```

## Database Setup

Set up the database by running:


```bash
rails db:create
rails db:migrate
rails db:seed
```

## Running the Application

To start the Rails server, run:

```bash
rails server
```

You can then access the application in your browser at http://localhost:3000.


## Features

To get started with the app, clone the repo and then install the needed gems:

- User authentication using Devise
- CRUD operations for blog posts
- Comments on blog posts
- Responsive design using Bootstrap 5

## Usage

### Creating a New Post

  1. Navigate to the Posts section. 
  2. Click on "New Post".
  3. Fill out the form with the title, body, and publication date.
  4. Click "Create Post".

### Viewing Posts

  - All posts are listed on the homepage.
  - Click on a post title to view the details of that post.

### Editing and Deleting Posts

  - Only authenticated users can edit or delete posts. 
  - Navigate to the post you want to edit or delete and click the respective button.


## Contributing

1. Fork the repository.
2. Create a new branch: git checkout -b my-feature-branch
3. Make your changes and commit them: git commit -m 'Add some feature'
4. Push to the branch: git push origin my-feature-branch
5. Submit a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.


## Credits

Thanks for making it easier for me:


- [Blog Home - Template](https://github.com/startbootstrap/startbootstrap-blog-home)
