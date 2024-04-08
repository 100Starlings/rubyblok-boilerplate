# lib/tasks/manage_space.rake

require 'dotenv/load'
require 'storyblok'
require 'json'

namespace :storyblok do
  desc "Manage Storyblok space"
  task add_template_stories: :environment do
    # Initialize Storyblok client
    client = Storyblok::Client.new(oauth_token: ENV['OAUTH_TOKEN'])

    # Get list of spaces
    response = client.get('/spaces/')
    spaces = response["data"]["spaces"]

    # Find space by name
    space_name = "Rubyblok Boilerplate"
    space = spaces.find { |space| space["name"] == space_name }

    unless space
      puts "Space not found with the name '#{space_name}'"
      return
    end

    space_id = space['id']

    # Output space ID
    puts "Space ID: #{space_id}"

    # Delete default homepage
    space_stories = client.get("/spaces/#{space_id}/stories/")
    default_stories = space_stories["data"]["stories"]

    story_to_delete = default_stories.find { |story| story["name"] == "Home" }

    if story_to_delete
      puts "Deleting default homepage..."
      puts JSON.pretty_generate(story_to_delete)
      client.delete("/spaces/#{space_id}/stories/#{story_to_delete['id']}")
    else
      puts "Default homepage not found."
    end

    # Call storyblok command to push components
    system("storyblok push-components ./lib/assets/template_files/components.270555.json --space #{space_id} --presets-source ./lib/assets/template_files/presets.270555.json")

    # Add stories to the space
    story_schemas = JSON.parse(File.read('./lib/assets/template_files/rubyblok_boilerplate_stories.json'))
    stories = story_schemas["stories"]

    selected_names = ["Home", "site-config", "components", "Default Header"]

    selected_names.each do |name|
      story = stories.find { |story| story["name"] == name }
      next unless story

      # Publish each story individually
      puts "Adding '#{name}' story..."
      client.post("/spaces/#{space_id}/stories/", { "story" => story, "publish" => 1 })
    end
  end
end
