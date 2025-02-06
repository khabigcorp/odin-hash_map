require './lib/HashMap.rb'

test = HashMap.new(0.75)
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

p test.entries
test.set('nectar', 'white')
p test.entries
p test.get('frog')
test.set('frog', 'brown')
p test.get('frog')
p test.has?('frog')
p test.has?('chernobog')
p test.remove('nectar')
p test.remove('ice cream')
p test.remove('kite')
p test.keys
p test.values
test.clear
p test.entries
