require 'storyblok'

client = Storyblok::Client.new(oauth_token: '2RQ0DDQzWayDQoYkTELmeAtt-235597-pkxR2GHBspL1X7mrXgHp')

# Delete default homepage
response = client.get('/spaces/')
spaces = response["data"]["spaces"]
space_id = spaces.find { |space| space["name"] == "Rubyblok Boilerplate" }
space_stories = client.get("/spaces/#{space_id['id']}/stories/")
default_stories = space_stories["data"]["stories"]

# story_to_delete = default_stories.find { |story| story["name"] == "Home" }

story_schemas = JSON.parse(File.read('components.270555.json'))
components_to_add = story_schemas["components"]

components = {"components" => components_to_add}

puts JSON.pretty_generate(components)
client.post("/spaces/#{space_id['id']}/stories/", components)