require 'storyblok'

client = Storyblok::Client.new(oauth_token: '2RQ0DDQzWayDQoYkTELmeAtt-235597-pkxR2GHBspL1X7mrXgHp')

response = client.get('/spaces/')
spaces = response["data"]["spaces"]
space_id = spaces.find { |space| space["name"] == "Rubyblok Boilerplate" }
stories = client.get("/spaces/#{space_id['id']}/stories/")

puts JSON.pretty_generate(stories)