require 'storyblok'


auth_token = ENV['OAUTH_TOKEN']

# client = Storyblok::Client.new(oauth_token: "#{auth_token}",  region: 'eu')
client = Storyblok::Client.new(oauth_token: "2RQ0DDQzWayDQoYkTELmeAtt-235597-pkxR2GHBspL1X7mrXgHp")

response = client.get('/spaces/')
spaces = response["data"]["spaces"]
space_id = spaces.find { |space| space["name"] == "Rubyblok Boilerplate" }

Create a new space
update = {
  "space" =>  {
    "name":  "Rubyblok Boilerplate",
    "id": space_id['id'],
    "plan": "Community",
  }
}
client.put("/spaces/#{space_id['id']}", update)

puts JSON.pretty_generate(update)

puts JSON.pretty_generate(client.inspect)