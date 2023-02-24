# Project: Authenticate User

_Authenticate the user when they sign-up or sign-in_

<div align="center">
  <img src="public/assets/project_logo.png" />
</div>

![](https://visitor-badge-reloaded.herokuapp.com/badge?page_id=juzershakir.rails-authenticate&color=000000&lcolor=000000&style=for-the-badge&logo=Github)

<a href="https://wakatime.com/@JuzerShakir/projects/rjmszkkjeo?start=2021-11-02" target="_blank"><img src="https://wakatime.com/badge/user/ccef187f-4308-4666-920d-d0a9a07d713a/project/cf27cce3-0e99-43d1-a469-74461e0e8c38.svg" alt="wakatime"></a>

## ❗ Objectives

This web-app must accomplish the following:

- [x] Use the PostgreSQL database which stores the email and password of a user...
- [x] Implement Devise gem to signup, sign in and log out users.
- [x] Use the reCAPTCHA gem to verify that the user isn't a bot.
- [x] After users sign up, Use rails' Action Mailer to send a welcome email.
- [x] Show appropriate flash messages wherever necessary like new sign up, sign in, logout, etc.
- [x] Show user sign-up count to both logged out and logged in users.
- [x] Redirect logged-in user to the homepage if he tries to visit the log-in or signup page.
- [x] Build a responsive site using bootstrap.
- [x] When a user manually enters a URL that doesn't exist, redirect them to the homepage with a flash message informing them that the URL doesn't exist.

---

## 💎 Required Gems

**This project was built on Ruby version _2.7.2_.**

Following important gems were installed in these versions:

| **Gem Names** |      **Gem**       | **Version** |                         **Use**                         |
| :-----------: | :----------------: | :---------: | :-----------------------------------------------------: |
|     Rails     |     _'rails'_      | **6.1.4.1** |        _Use for executing and rendering web-app_        |
|  Postgresql   |       _'pg'_       |  **1.2.3**  |    _Use postgres as the database for Active Record_     |
|   Bootstrap   | _'bootstrap-sass'_ |  **3.4.1**  |                   _For SCSS Styling_                    |
|    Devise     |     _'devise'_     |  **4.8.0**  |           _Flexible authentication solution_            |
|   reCAPTCHA   |   _'recaptcha'_    | **3.1.16**  | _Validate requests with the "I'm not a robot" checkbox_ |

---

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

---

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
cd rails-authenticate
```

```bash
bundle install
```

#### 💡 Imp Note:

To successfully create development and test database, you will need to update `config.database.yml` file with correct postgresql username and password.
To edit the it without exposing your credentials, give the following command:

```bash
EDITOR="code --wait" rails credentials:edit
```

_`code` for Visual Studio Code_
_`subl` for sublime_

This will open `credential.yml` file and enter credential as follows in it:

```
database:
  username: your_username
  password: your_password
```

Hit `ctrl + s` to save and then close the `credential.yml` file from the editor. This will save the credentials. To check if it did save, run the following inside rails console:

```
Rails.application.credentials.dig(:database, :username)
```

```bash
rails db:create
```

Also `.env` file has been added to `.gitignore` file. You should create a similar file named `.env` at the root of this directory and fill the following environment variables value with yours:

```
GMAIL_USERNAME = your_email
GMAIL_PASSWORD = your_password
RECAPTCHA_SITE_KEY = your_key
RECAPTCHA_SECRET_KEY = your_secret_key
```

```bash
rails s
```

---
