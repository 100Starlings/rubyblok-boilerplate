# Rubyblok

Storyblok Headless CMS and Rails app integration

## Context
Headless Content Management Systems (CMS) are great for publising content across diferent displays and devices. This kind of system separates your data (the “body”) from how it’s presented (the “head”), hence the term “headless”. 

Rubyblok integrates a Rails app to a Headless CMS Solution, [Storyblok](https://www.storyblok.com/). This creates an advanced caching and persistence layer. Positioned between your application and Storyblok, this layer leverages your app's database to store JSON data from Storyblok. To optimize data access, we seamlessly integrate with your app's caching strategies, such as Memcached and Redis.

## Why Rubyblok?
Rubyblok's streamlined publishing and viewing process ensures that your content reaches the audience with speed. With an intuitive admin interface and webhooks triggering seamless updates, Rubyblok accelerates content delivery, giving you a competitive edge.

### For developers
- Self hosted solution, you own your content as you create it
- Reduce data usage and increase performance: By having your content available locally, you don't need to call Storyblok's API every single time and can save storage quota.
- Shorten the feedback loop: You see the content as it is when you edit, on a What You See Is What You Get interface.

Get to know [more technical details about Rubyblok here.](https://rubyblok-demo-staging-4f46f7cfa897.herokuapp.com/product-details)

## Setup

Use asdf-vm to set your Ruby version automatically:

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

Create the `.env.local` file and add your `STORYBLOK_API_TOKEN`:

```bash
mv .env .env.local
```

Get the token at _Storyblok Space > Settings > Access token_ page.

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
WIP :construction:
(Automation script here)

Now, just go to the Storyblok Space and it will be working! :tada: