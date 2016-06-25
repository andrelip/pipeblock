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

```ruby
require 'date'

def add_day(date, days = 1)
  date + days
end

result_date = pipe Date.today do
           add_day
           add_day 8
         end

result_date.should > Date.today + 8
result_date.should < Date.today + 10
```

Working if external dependencies
```ruby
pipe 0.0 do
  e -> (entry_value, &b) { Math.cos entry_value }
end
# => 1.0
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
