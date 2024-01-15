# Rubyblok



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

For manual configuration, see `.tool-versions`.

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

Or keep it running with:

```bash
bundle exec rails tailwindcss:watch
```

Run the Rails server:

```bash
bundle exec rails s
```

Open it at [http://localhost:3000](http://localhost:3000).

### Tailwind

To continuously build the tailwind styles:

```bash
bundle exec rails tailwindcss:watch
```

This will watch for changes in your Tailwind CSS files and automatically recompile them as needed.

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

This will start a proxy server. Now, just go to the Storyblok Space and it will be working! :tada: