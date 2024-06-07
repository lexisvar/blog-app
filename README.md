# BlogApp

BlogApp is a simple blog application built with Ruby on Rails, using PostgreSQL for the database, and Bootstrap 5 for styling.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration](#configuration)
- [Database Setup](#database-setup)
- [Running the Application](#running-the-application)
- [Features](#features)
- [Usage](#usage)
- [Authentication](#authentication)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [License](#license)

## Requirements

To get started with the app, clone the repo and then install the needed gems:

```bash
- ruby 3.3.2
- rails 7
```

## Installation

To get started with the app, clone the repo and then install the needed gems:

```bash
git clone https://github.com/your_username/BlogApp.git
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
```

## Running the Application

To start the Rails server, run:

```bash
rails server
```