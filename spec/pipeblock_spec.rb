require 'spec_helper'

describe Pipeblock do
  it 'should work have his own inspect defined' do
    result = pipe 1 do
                inspect
              end
    result.should == '1'
  end

  it 'should chain methods passing a result value from a method as the
  first argument of the next one' do
    def sum(a, b)
      a + b
    end
    result = pipe 1 do
               sum(2)
             end
    result.should == 3
  end

  it 'should chain any methods' do
    def concatenate(a, b)
      a + b
    end
    result = pipe 'Hey' do
      concatenate(' you!')
      concatenate(' Can you hear me?')
    end
    result.should == ('Hey you! Can you hear me?')
  end

  it 'should work with external modules encapsuled' do
    def sin(number)
      Math.sin(number)
    end
    result = pipe 0.0 do
      sin
    end
    result.should == 0.0
  end

  it 'should work with external encapsuled on lambda' do
    result = pipe 0.0 do
      external -> (entry_value, &b) { Math.cos entry_value }
    end
    result.should == 1.0
  end
end
