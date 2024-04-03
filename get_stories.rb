require 'storyblok'
# client = Storyblok::Client.new(oauth_token: 'YOUR_OAUTH_TOKEN')
client = Storyblok::Client.new(oauth_token: 'nr9hwhyBlIfjrmwcrsFIqQtt-197392-ubXzScz3E1bKUx4577Yo')

# Retrieve data from the API
# response = client.get('/spaces/270555/stories/426146971')
response = client.get('/spaces/270555/stories/')

File.open('storyblok_home_template_data.json', 'w') do |file|
  file.write(response["data"].to_json)
end

story_schemas = JSON.parse(File.read('storyblok_home_template_data.json'))
# page_objects = story_schemas['presets'].map { |preset| preset['preset'] }

stories = File.read('storyblok_home_template_data.json')


# payload = {"story" => stories} 500 error
payload = {"story" => new_story} # works fine



# client.post('/spaces/282130/stories', payload)

# client.put('/spaces/282130/stories/467543472/', payload)

puts JSON.pretty_generate(story_schemas)