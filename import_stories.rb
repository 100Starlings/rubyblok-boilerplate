require 'storyblok'


client = Storyblok::Client.new(oauth_token: '2RQ0DDQzWayDQoYkTELmeAtt-235597-pkxR2GHBspL1X7mrXgHp')

# Find the space based on the name
response = client.get('/spaces/')
spaces = response["data"]["spaces"]
space_id = spaces.find { |space| space["name"] == "Rubyblok Boilerplate" }

puts JSON.pretty_generate(space_id['id'])

selected_names = ["Home", "site-config", "comoonents", "Default Header"]

# Add stories to the space
story_schemas = JSON.parse(File.read('rubyblok_boilerplate_stories.json'))
stories = story_schemas["stories"]

homepage = {
  "story" => stories.find { |story| story["name"] == "Home" },
  "publish" => 1
}
client.post("/spaces/#{space_id['id']}/stories/", homepage)

site_config = {
  "story" => stories.find { |story| story["name"] == "site-config" },
  "publish" => 1
}
client.post("/spaces/#{space_id['id']}/stories/", site_config)

components = {
  "story" => stories.find { |story| story["name"] == "components" },
  "publish" => 1
}
client.post("/spaces/#{space_id['id']}/stories/", components)

default_navbar = {
  "story" => stories.find { |story| story["name"] == "Default Header" },
  "publish" => 1
}
client.post("/spaces/#{space_id['id']}/stories/", default_navbar)

