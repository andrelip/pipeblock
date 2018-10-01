# Pipeblock
Pipeblock brings the Pipe Operator flow of Functional Programming to Ruby.
It provides a very clean flow for working with static methods.

How to add to Your Project:

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
def cut(text, pattern)
  text.gsub(pattern, '')
end

pipe 'http://www.google.com' do
  cut('http://www.')
  cut('.com')
end
# => google
```

```ruby
require 'date'

def add_day(date, days = 1)
  date + days
end

result_date = pipe Date.today do
                add_day 5
                add_day 5
              end

result_date.should > Date.today + 5
result_date.should <= Date.today + 10
```

Calling external classes
```ruby
pipe 0.0 do
  e -> (entry_value) { Math.cos entry_value }
end
# => 1.0
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
