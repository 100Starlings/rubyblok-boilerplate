require 'storyblok'

client = Storyblok::Client.new(oauth_token: ENV['OAUTH_TOKEN'])

# Delete default homepage
response = client.get('/spaces/')
spaces = response["data"]["spaces"]
space_id = spaces.find { |space| space["name"] == "Rubyblok Boilerplate" }
space_stories = client.get("/spaces/#{space_id['id']}/stories/")
default_stories = space_stories["data"]["stories"]

story_to_delete = default_stories.find { |story| story["name"] == "Home" }

puts JSON.pretty_generate(story_to_delete)
client.delete("/spaces/#{space_id['id']}/stories/#{story_to_delete['id']}")