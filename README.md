##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.7.5](https://www.ruby-lang.org/en/downloads/releases/)
- Rails [6.1.7.2](https://rubygems.org/gems/rails/versions/6.1.7.2)
- OAuth [1.1.0](https://rubygems.org/gems/oauth?locale=ja)

### 1. Check out the repository

```bash
git clone git@github.com:nandar-phyo-ykd/photo-management-system-kadai.git
```

### 2.Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:migrate
```

Run the following command to create login-users data

```ruby
bundle exec rake db:seed
```

### 3.Create directory for uploading photos

```bash
mkdir public/user_upload_photos
```

### 4.Compile the webpacker

```ruby
bundle exec rake webpacker:compile
```

### 5. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000

### 6. Access the login page
Run the following command to check login data
```bash
cat db/seeds.rb
```

Go to http://localhost:3000/login and enter user_id and password


### Congratulations!!! You are ready to tweet your uploaded photos to Twitter

