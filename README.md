# Url2png::Plus

The `url2png` gem is madness. It tries to be compatible with a bunch of different versions of the url2png APIs, which a client doesn't need to worry about. Its also insecure out of the box by using the `http` protocol, and makes configuring the protocol to `https` very difficult.

This gem only attempts to integrate with the most recent version of URL2PNG, which is v6 at the time of this writing, and otherwise stay out of the way.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'url2png-plus'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install url2png-plus

## Usage

```ruby
url2png = Url2png::Plus::Client.new(api_key: "APIKEY", secret: "SECRET")
# The `URL2PNG_API_KEY` and `URL2PNG_SECRET` environment variables are used as a default.
# for web applications you'd set those and initialize via `Url2png::Plus::Client.new`.
url2png.url "https://www.example.com/rabit.png", viewport: "100x100", fullpage: true
```

That's it. Read URL2PNG docs at https://www.url2png.com/docs to know what parameters you can use.

If you'd like to use in Rails or other web applications, include the helper wherever you need it:

```ruby
class ApplicationController
  include Url2png::Plus::Helper

  # Example implementation in a controller
  def redirect_to_image
    redirect_to url2png_url(request.url, viewport: "1024x768")
  end
end
```

## Configuration

If you need to configure in Rails, create `./config/initializers/url2png.rb` and:

```ruby
Url2png::Plus.config do |c|
  c.api_key = "APIKEY"
  c.secret = "SECRET"
  # Why would you change this to `http`? Defaults to `https`
  c.scheme = "http"
end
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/polleverywhere/url2png-plus. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Url2png::Plus project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/polleverywhere/url2png-plus/blob/master/CODE_OF_CONDUCT.md).
