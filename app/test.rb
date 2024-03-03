VAL = 'Global'

module Foo
  VAL = 'Foo Local'

  class Bar
    def value1
      VAL
    end
  end
end

class Foo::Bar
  def value2
    VAL
  end
end

puts Foo::Bar.new.value1
puts Foo::Bar.new.value2