# Event Places Application

## Overview

This is a Ruby on Rails application for managing event places. Users can browse, create, edit, and delete event places. The app includes user roles such as admins and regular users. Regular users can create and manage their own event places, while admins have the ability to manage all event places.

## Features

- User authentication with Devise (sign up, log in, log out, password reset)
- Role-based access control (Admins and regular users)
- CRUD functionality for event places
- Event places are categorized
- Users can add/remove event places to/from favorites
- Map integration for event location display using Mapbox
- User profile management, including avatar upload

## Prerequisites

Before setting up the app, make sure you have the following installed on your machine:

- **Ruby**: Version `x.x.x`
- **Rails**: Version `x.x.x`
- **PostgreSQL**: Ensure you have PostgreSQL installed and running
- **Bundler**: To manage gem dependencies
- **Yarn**: For managing JavaScript dependencies

## Getting Started

### Clone the repository

```bash
git clone https://github.com/your-username/event-places-app.git
cd event-places-app
