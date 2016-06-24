Concept only. To test just run pipeblock.rb.
It passes the result of previous line as the first argument of the next.

Usage:

```ruby
def sum(a, b)
  a + b
end

def divide(a, b)
 a / b rescue 0
end

pipe 10 do
  sum(90)
  divide(2)
  puts
end

# => 50
```
