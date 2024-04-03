require 'storyblok'
require 'json'

# Initialize Storyblok client
client = Storyblok::Client.new(oauth_token: '2RQ0DDQzWayDQoYkTELmeAtt-235597-pkxR2GHBspL1X7mrXgHp')

# Get list of spaces
response = client.get('/spaces/')
spaces = response["data"]["spaces"]

# Find space by name
space_name = "Rubyblok Boilerplate"
space_id = spaces.find { |space| space["name"] == space_name }

# Output space ID
puts JSON.pretty_generate(space_id['id'])

# Delete default homepage
space_stories = client.get("/spaces/#{space_id['id']}/stories/")
default_stories = space_stories["data"]["stories"]

story_to_delete = default_stories.find { |story| story["name"] == "Home" }

puts JSON.pretty_generate(story_to_delete)
client.delete("/spaces/#{space_id['id']}/stories/#{story_to_delete['id']}")

# Call storyblok command to push components
system("storyblok push-components ./components.270555.json --space #{space_id['id']} --presets-source ./presets.270555.json")

# Add stories to the space
story_schemas = JSON.parse(File.read('rubyblok_boilerplate_stories.json'))
stories = story_schemas["stories"]

selected_names = ["Home", "site-config", "comoonents", "Default Header"]

selected_names.each do |name|
  story = stories.find { |story| story["name"] == name }
  next unless story

  # Publish each story individually
  client.post("/spaces/#{space_id['id']}/stories/", { "story" => story, "publish" => 1 })
end

