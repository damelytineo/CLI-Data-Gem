# FluVaccination

Welcome! This gem provides a Command Line Interface (CLI) to an external data source -- a list of locations offering flu vaccination services in NYC -- with the help of HTTParty, it parses the data response to allow for methods that filter the data by zip-code. When prompted, the user would enter his/her zip_code, the program would then puts/print a numbered list of nearby locations within the zip_code, finally, the user would have the option of selecting one of the choices to obtain more details or simply typing in exit to exit the program. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'flu_vaccination'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vaccination

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/vaccination.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
