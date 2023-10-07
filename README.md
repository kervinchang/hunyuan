# Hunyuan

Welcome to Hunyuan! Hunyuan is a Ruby gem that provides a client for interacting with Tencent Hunyuan API for chat completions. With Hunyuan, you can easily integrate chat completion capabilities into your Ruby applications.

TODO: Delete this and the text above, and describe your gem

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add hunyuan

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install hunyuan

## Usage

To use Hunyuan, you'll need an API key from Hunyuan. You can obtain the required credentials by signing up for the Hunyuan API service.
```ruby
require 'hunyuan'

# Initialize the ChatClient with your Hunyuan API credentials
client = Hunyuan::ChatClient.new(app_id: 'YOUR_APP_ID', secret_id: 'YOUR_SECRET_ID', secret_key: 'YOUR_SECRET_KEY')

# Send a chat query
response = client.chat('Hello, world!')

# Process the response
puts response
```

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
