require 'storyblok'

client = Storyblok::Client.new(oauth_token: '2RQ0DDQzWayDQoYkTELmeAtt-235597-pkxR2GHBspL1X7mrXgHp')

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
# run storyblok push-components CLI command

# add template stories
# run the import_stories.rb script