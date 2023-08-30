# Backend CMS Project

This project is a simple Content Management System (CMS) backend built using Flask. It allows users to manage and publish articles, blog posts, and multimedia content on websites.

## Table of Contents

- [Project Overview](#project-overview)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

The project consists of a Flask-based backend that provides API endpoints for managing content and user authentication. It includes basic routes for rendering different pages, handling form submissions, and interacting with a database.

- **app**: This directory contains the core application files.
  - **static**: Static assets like CSS, JavaScript, and images.
  - **templates**: HTML templates used for rendering views.
  - **models.py**: Database models for users, articles, and comments.
  - **routes.py**: Routes and view functions for different pages.
- **migrations**: Database migration scripts (if using an ORM).
- **config.py**: Configuration settings for the application.
- **run.py**: Application entry point to start the Flask server.
- **requirements.txt**: List of Python dependencies.
- **Procfile**: Heroku deployment configuration (if using Heroku).
- **README.md**: Project documentation.

## Installation

1. Clone the repository:

   ```sh
   git clone https://github.com/yourusername/backend-cms.git
   cd backend-cms


2. Create a virtual environment
python -m venv venv
source venv/bin/activate


3. Install dependencies
pip install -r requirements.txt


4. Run the application
python run.py
