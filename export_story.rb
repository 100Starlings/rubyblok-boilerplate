require 'storyblok'

client = Storyblok::Client.new(oauth_token: 'nr9hwhyBlIfjrmwcrsFIqQtt-197392-ubXzScz3E1bKUx4577Yo')

response = client.get('/spaces/270555/stories/426146971/')

response_data = response

File.open('storyblok_space_data.json', 'w') do |file|
  file.write(response_data.to_json)
end

storyblok_space_data = File.read('storyblok_space_data.json')


payload = {
  "storie" => response_data
}

result = client.post('/spaces/282601/stories/', payload)

puts payload