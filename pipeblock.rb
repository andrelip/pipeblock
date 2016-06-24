module Kernel
  def pipe(*args, &block)
    require 'binding_of_caller'
    scope_object = binding.of_caller(1).eval('self')
    start_object = args[0]
    pipe = Pipeline::Pipeline.new scope_object, &block
    pipe.start(start_object)
    pipe.run_list
  end
end

module Pipeline
  class Pipeline < ::BasicObject
    attr_reader :last_value, :caller_object

    def initialize(caller_object, &computation)
      @computation = computation
      @caller_object = caller_object
      @last_value = nil
    end

    def __result__
      @reference
    end

    def start(value)
      @last_value = value
    end

    def inspect
      last_value.present? ? last_value.inspect : @reference.inspect
    end

    def respond_to? (message)
      message = message.to_sym
      [:__result__, :__inspect__].include?(message) or __result__.respond_to? message
    end

    def raise(*args)
      __result__.__send__(:raise, *args, &b)
    end

    def to_s(*args)
      last_value.to_s(*args)
    end

    def run_list
      self.instance_eval(&@computation)
    end

    def method_missing(*args, &b)
      if last_value.nil?
        @last_value = __result__.__send__(*args, &b)
      else
        new_args = args.insert(1, last_value)
        @last_value = caller_object.__send__(*new_args, &b)
        @reference = last_value
      end
      last_value
    end

    def external(*args, &block)
      proc = args.shift
      @last_value = proc.call(last_value)
      @reference = last_value
    end

    private

    def check_proc(value, *args, &b)
      args.shift
      if value.respond_to? :call
        value = value.call(*args, &b)
      else
        value
      end
      value
    end
  end
end

#Pipeline::Pipe.new(1)
