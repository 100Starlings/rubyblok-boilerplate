require 'dotenv/load'
require 'storyblok'

# Initialize Storyblok client
client = Storyblok::Client.new(oauth_token: ENV['OAUTH_TOKEN'])

# Create a new space
new_space = {
  "space" =>  {
    "name":  "Rubyblok Boilerplate",
    "plan": "Community",
    "trial": false,
    "requires_2fa": false,
    "region": "eu-central-1"
  }
}
client.post('/spaces/', new_space)

puts JSON.pretty_generate(new_space)




# add your oauth token to the .env file

# create template space via
# run the create_space.rb script

# manually select a plan for the space (Community is free)

# delete demo stories via
# run the delete_default_story.rb script

# login to the storyblok CLI via storyblok login
# needs nodejs 18+ installed
# in some cases chmod -R 0600 /Users/{username}/.netrc is needed to be ran
# npm i storyblok -g
# run storyblok push-components CLI command via
# storyblok push-components ./components.270555.json --space {your_new_space_id} --presets-source ./presets.270555.json

# add template stories
# run the import_stories.rb script