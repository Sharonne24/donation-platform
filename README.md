# Sustainable Needs Empowerment Platform (SNEP)

## Table of Contents
- [Introduction](#introduction)
- [Project Proposal](#project-proposal)
- [Team](#team)
- [Users](#users)
- [User Stories](#user-stories)
- [Technical Stack](#technical-stack)
- [Gemfile](#gemfile)
- [Database Schema](#database-schema)

## Introduction

The Sustainable Needs Empowerment Platform (SNEP) is a web-based platform that aims to address a critical issue in sub-Saharan countries: the lack of access to sanitary pads and other menstrual hygiene supplies for school-going girls. The platform not only provides these essential items but also promotes proper menstrual hygiene by facilitating clean water and sanitation facilities, such as toilets, in schools.

## Project Proposal

### Problem Statement

In many sub-Saharan countries, girls from economically disadvantaged families miss a significant number of school days due to the unavailability of sanitary towels. Studies have shown that a girl in primary school can lose up to 18 weeks out of 108 weeks due to this issue, while high school students can miss almost 24 weeks out of 144 weeks of learning. SNEP is dedicated to tackling this problem by providing sanitary towels, clean water, and sanitation facilities to ensure proper menstrual hygiene, following UNICEF guidelines.

### Solution

The SNEP project aims to raise funds by encouraging repeat donations. The goal is to create a platform that allows users to make regular donations to charities dedicated to providing these essential supplies. Users can set up automated repeat donations, such as monthly contributions. The platform also allows donors to choose whether they want to remain anonymous and offers reminders to ensure consistent support. Donations can be made through various payment services like PayPal and Stripe.

## Team

The SNEP project is developed by a talented team with expertise in both front-end and back-end technologies:

### Backend Developers

- [Sharon Awour (GitHub: Sharonne24)](https://github.com/Sharonne24)
- [Nurdin Abdinasir (GitHub: nurdinhajo)](https://github.com/nurdinhajo)
- [Geofrey Tegeret (GitHub: GeoReece000)](https://github.com/GeoReece000)

### Frontend Developers

- [Philip Nzau (GitHub: PhillipNzau)](https://github.com/PhillipNzau)
- [Esther Rono (GitHub: JESUSGIRL22)](https://github.com/JESUSGIRL22)

These dedicated developers have come together to make the SNEP project a reality. Their combined skills in both back-end and front-end development are instrumental in creating a comprehensive and functional platform.
## Users

SNEP serves the following user roles:

- **Donor**: Individuals who wish to support charities by making donations.
- **Charity**: Organizations dedicated to providing sanitary towels and promoting menstrual hygiene.
- **Administrator**: Responsible for reviewing and managing charity applications and maintaining the platform.

## User Stories

### Donor

- See a variety of charities they can donate to.
- Create an account on the platform.
- Choose a charity to support.
- Make donations to a charity.
- Set up automated repeat donations (e.g., monthly).
- Choose whether to remain an anonymous donor.
- Receive reminders to donate at the same time each month.
- Read stories about the beneficiaries of their donations.
- Make donations via Stripe.

### Charity

- Apply to become a charity on the platform.
- Set up charity details once the application is approved by the administrator.
- View non-anonymous donors and their donations.
- View the amounts donated by anonymous donors.
- Keep track of the total amount donated to the charity.
- Create and post stories of beneficiaries.
- Maintain a list of beneficiaries and inventory sent to them.

### Administrator

- Receive and review applications from charities.
- Approve or reject charity applications.
- Delete charities from the platform.

## Technical Stack

- **Backend**: Ruby on Rails
- **Database**: PostgreSQL
- **Wireframes**: Designed in Figma (Mobile-friendly)
- **Frontend**: ReactJS and Redux Toolkit (State Management)
- **Authentication**: Devise and JWT (JSON Web Tokens)
- **Payment Gateways**: PayPal, Stripe

## Gemfile

We use various gems in our project, including but not limited to:

- `pg` for PostgreSQL database support.
- `flexirest` for flexible RESTful API handling.
- `request_store` for storing global data in a thread-safe manner.
- `faraday` for handling HTTP requests.
- `devise` for user authentication.
- `bcrypt` for password hashing and authentication.
- `jwt` for JSON Web Tokens.
- `dotenv-rails` for managing environment variables.
- `bootsnap` for reducing boot times through caching.

Make sure to check the Gemfile for a comprehensive list of dependencies.

## Database Schema

The database schema for SNEP is defined in `db/schema.rb`. It includes tables for managing charities, beneficiaries, donations, stories, users, and more. This schema ensures the storage and retrieval of data relevant to the platform's functionality.

Please refer to the [Database Schema](#database-schema) section of this README for more details.

---