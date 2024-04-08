# Rubyblok Boilerplate
This repository is a demonstration of the [Rubyblok gem](https://github.com/100Starlings/rubyblok), which provides integration between your Rails app and a Content Management System. 

## Context
Rubyblok is an easy way to integrate a visual CMS ([Storyblok](https://www.storyblok.com/)) into your Rails app, providing you with a proven integration path and quality of life features. With Rubyblok, you can edit your content online, preview it in real-time, and publish it with just the click of a button.

## Why Rubyblok?
Rubyblok provides an abstraction layer and stores all your content locally, reducing data usage and enhancing performance. This enables new functionalities that leverage the local data, such as global content search, sitemaps, and listings. Ultimately, this setup increases resilience by eliminating dependency on external data sources.

## Setup

This project requires the following setup:
- ruby 3.2.2
- nodejs 16.15.0
- postgresql 14

Use the version managers of your preference to install.

Here is a simple way using asdf-vm to set them automatically:

```bash
brew install asdf
asdf plugin add ruby
asdf plugin add nodejs
asdf install
asdf current
```

Install the database:

```bash
brew install postgresql@14
brew services start postgresql
```

Add a `.tool-versions` file:
```
ruby 3.2.2
nodejs 16.15.0
```

Install the app dependencies:

```bash
bundle install
```

Create the database:

```bash
bundle exec rails db:setup
```

[Click here](https://app.storyblok.com/?_gl=1*196uoul*_gcl_au*MTg1NjA5NjA0MS4xNzA5MDY5ODk3#!/signup) to create a free acount at Storyblok, the platform where you will have access to the visual and real-time content editing.

Create the `.env.local` file and add your `STORYBLOK_API_TOKEN`:

```bash
mv .env .env.local
```

Get your Storyblok API token in your account, at _Storyblok Space > Settings > Access token_ page.

## Development

Build tailwind:

```bash
bundle exec rails tailwindcss:build
```

To continuously build the tailwind styles:

```bash
bundle exec rails tailwindcss:watch
```

This will watch for changes in your Tailwind CSS files and automatically recompile them as needed.

Run the Rails server:

```bash
bundle exec rails s
```

Open it at [http://localhost:3000](http://localhost:3000).

### Local proxy to Storyblok

To connect with the Storyblok space we have to create a local proxy. For that, first create a PEM certificate for your `localhost`:

```bash
brew install mkcert
mkcert -install
mkcert localhost
```

This will create the `localhost-key.pem` and `localhost.pem` files.

To run the proxy, use the `local-ssl-proxy` tool:

```bash
npm install local-ssl-proxy -g
local-ssl-proxy --source 3333 --target 3000 --cert localhost.pem --key localhost-key.pem
```

This will start a proxy server. 

### Demo blocks creation
1. Add your OAUTH token to the .env file
storyblok.com > My account > Account Settings > Personal access token > Generate new token

2. Create a new space for the template by running:

```
bundle exec rake storyblok:add_template_stories
```

After the space is created (might need to refresh the page) select a plan according to your needs
The region is set to EU by default which needs to ben changed based on your preference


3. Login to the Storyblok CLI:

```
storyblok login
```

NOTE: The storyblok CLI tool is added via npm ( npm i storyblok -g ) and it needs nodejs 18 or above installed
In some cases chmod -R 0600 /Users/{username}/.netrc is needed to be ran due to a known issue


4. Add the template stories by running:

```
bundle exec rake storyblok:add_template_space
```

Follow the rest of the readme to run and vie the project locally (proxy has to be setup and preview URL changed on Storyblok to your local one)

Now, just go to the Storyblok Space and it will be working! :tada:
