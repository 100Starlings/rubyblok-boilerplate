require 'dotenv/load'
require 'storyblok'
require 'json'

namespace :storyblok do
  desc "Create a new space"
  task create_template_space: :environment do
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

    response = client.post('/spaces/', new_space)

    puts "New space created:"
    puts JSON.pretty_generate(response)
  end
end
