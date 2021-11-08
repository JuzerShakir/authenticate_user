# Project: Devise In Action
*Devise + reCAPTCHA + Action Mailer + Bootstrap SASS*

<div align="center">
  <img src="public/assets/project_logo.png" />
</div>


## ❗ Objectives
This web-app must accomplish the following:
- [x] Use PostgreSQL database which stores email and password of a visitor...
- [x] Implement Devise gem to signup, signin and logout visitor.
- [x] Use reCAPTCHA gem to verify a that visitor isn't a bot.
- [x] After visitor sign up, Use rails' Action Mailer to send a welcome email.
- [x] Show appropraite flash messages where-ever necessory like, new sign up, sign in, logout, etc.
- [x] Show visitor sign up count to both logged out and logged in visitors.
- [x] Redirect logged in visitor to homepage if he tries to visit log in or signup page.
- [x] Build a responsive site using bootstrap.
- [X] When a visitor manually enters a url that doesnt exist, redirect them to homepage with a flash message informing them that url doesn't exist.

----

## 💎 Required Gems

**This project was built on Ruby version *2.7.2*.**

Following important gems were installed in these versions:

|  **Gem Names**  |         **Gem**         | **Version** |                      **Use**                     |
| :------------:  |     :------------:      | :---------: |                    :---------:                   |
|      Rails      |        _'rails'_        |  **6.1.4.1**  |    *Use for executing and rendering web-app*     |
|   Postgresql    |          _'pg'_         |  **1.2.3**  | *Use postgres as the database for Active Record* |
|    Bootstrap    |  _'bootstrap-sass'_      |  **3.4.1**  |                *For SCSS Styling*                 |
|    Devise       |        _'devise'_       |  **3.1.16** | * Flexible authentication solution* |
|  reCAPTCHA     |      _'recaptcha'_       |  **3.1.16** | *Validate requests with the "I'm not a robot" checkbox* |


----

## ⚙️ Setting up a PostgreSQL user

If you don't have a user set on postgres, here's how to set new user:

```bash
sudo -u postgres createuser -s [username]
```
To set a password for this user, log in to the PostgreSQL command line client:
```bash
sudo -u postgres psql
```
Enter the following command to set the password:
```bash
\password your_password
```
Enter and confirm the password. Then exit the PostgreSQL client:
```bash
\q
```

-----

## 📋 Execution

Run the following commands to execute locally:

The following will install required version of ruby (make sure [rvm is installed](https://rvm.io/rvm/install).)

```bash
rvm use 2.7.2
```
```bash
git clone git@github.com:JuzerShakir/rails-authenticate.git
```
```bash
cd Session-CookieStore
```
```bash
bundle install
```

### 💡 Imp Note:
> The `config/database.yml` has been added to `.gitignore` but a similar file `config/database.yml.clone` exists in its place. You will need to add your own postgresql username and password in the file. And then rename the file by:

```bash
mv config/database.yml.clone config/database.yml
```
```bash
rails db:setup or rails db:migrate
```
### 💡 Imp Note:
> Also `.env` file has been added to `.gitignore` file. You should create a similar file named `.env` at the root of this directory and fill the following environment variables value with yours:

```
GMAIL_USERNAME = your_email
GMAIL_PASSWORD = your_password
RECAPTCHA_SITE_KEY = your_key
RECAPTCHA_SECRET_KEY = your_secret_key
```

```bash
rails s
```



To see this web-app up and running without executing above commands locally,
I have deployed it on [Heroku](https://rails-authenticate.herokuapp.com/).

-----

![](https://visitor-badge-reloaded.herokuapp.com/badge?page_id=juzershakir.rails-authenticate&color=000000&lcolor=000000&style=for-the-badge&logo=Github)


<a href="https://wakatime.com/@JuzerShakir/projects/rjmszkkjeo?start=2021-11-02" target="_blank"><img src="https://wakatime.com/badge/user/ccef187f-4308-4666-920d-d0a9a07d713a/project/cf27cce3-0e99-43d1-a469-74461e0e8c38.svg" alt="wakatime"></a>

