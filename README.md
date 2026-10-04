# 🪙 Poke Coin

A Ruby-based application designed for managing and tracking Poke Coin transactions, featuring a containerized architecture and a robust backend structure.

---

## 🏗️ Project Architecture & Structure

The repository follows standard Ruby/Rails conventions:

```text
poke_coin/
├── app/                  # Core application logic, controllers, and views
├── bin/                  # Executables and startup scripts
├── config/               # Application configuration, routes, and initializers
├── db/                   # Database schemas, migrations, and seed files
├── lib/                  # Custom tasks and auxiliary libraries
├── public/               # Static assets and error pages
├── storage/              # Active Storage files and local uploads
├── test/                 # Test suite (unit and integration tests)
├── vendor/               # Third-party dependencies and plugins
├── Dockerfile            # Container definition for deployment
└── Gemfile               # Ruby gem dependencies
```

## 🛠️ Tech Stack

Language: Ruby

Framework / Rack: Ruby on Rails / Rack (config.ru, Rakefile)

Containerization: Docker (Dockerfile, .dockerignore)

Dependency Management: Bundler (Gemfile, Gemfile.lock)

## ⚙️ Getting Started & Local Setup

# Prerequisites

- **Ruby (matching the version specified in .ruby-version)
- **Bundler (gem install bundler)
- **Docker (optional, for containerized execution)

#Installation

Clone the repository:

```Bash
git clone [https://github.com/bad-the-wh/poke_coin.git](https://github.com/bad-the-wh/poke_coin.git)
cd poke_coin
```

Install dependencies:

```Bash
bundle install
```

Setup the database:

```Bash
bundle exec rails db:prepare
```

Run the application:

```Bash
bundle exec rails server
```

## 🐳 Running with Docker
To build and run the application inside a container:

```Bash
# Build the Docker image
docker build -t poke-coin .

# Run the container
docker run -p 3000:3000 poke-coin
```
