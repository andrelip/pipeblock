# Pipeblock
Pipeblock brings the Pipe Operator flow of Functional Programming to Ruby.
It provides a very clean flow for working with static methods.

Add to Your Project:

```ruby
gem 'pipeblock'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pipeblock

## Usage
```ruby
# sample method
def cut(text, pattern, replace: '')
  text.gsub(pattern, replace)
end

pipe 'http://www.google.com' do
  cut('http://www.')
  cut('.com')
  cut('gle', replace: "mba!")
  puts
end
# goomba!
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
