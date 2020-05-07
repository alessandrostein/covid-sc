# COVID SC

- [Dependencies](#dependencies)
- [Development](#development)

## Dependencies

Things you need to install to run this project:

- Ruby >= 2.6.5
- Node >= 13.2.0

**Ubuntu**

```sh
apt-get update
apt-get postgresql postgresql-contrib postgresql-server-dev-all cmake node
gem install bundler
```

**MacOS**

```sh
brew update
brew install postgres node
gem install bundler
```

## Development

### Setup

```sh
bundle install
cp config/database.yml.example config/database.yml
bin/rails db:setup
```

Run the local server at [http://localhost:3000](http://localhost:3000) with:

```sh
bundle exec rails server
```

Run tests with:

```sh
bundle exec rails test
```
