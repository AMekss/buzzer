# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


conversation1 = Conversation.find_or_create_by!(title: "Ruby community chat", description: "Connect and chat with fellow Ruby developers worldwide")
conversation2 = Conversation.find_or_create_by!(title: "Scream on you", description: "A place to vent, rant, and let it out")

["DHH", "Matz"].each do |full_name|
  Participant.find_or_create_by!(full_name: full_name) do |participant|
    participant.conversations << conversation1
  end
end

Participant.find_or_create_by!(full_name: "Bob") do |participant|
  participant.conversations = [conversation1, conversation2]
end

Participant.find_or_create_by!(full_name: "Bart Simpson") do |participant|
  participant.conversations << conversation2
end

participants_by_name = Participant.all.index_by(&:full_name)

[
  {text: "Welcome everyone!", from: "Matz"},
  {text: "Rails 8 is out", from: "DHH"},
  {text: "Ruby foreva!", from: "Bob"},
  {text: "Don't forget to check out the new pattern matching features", from: "Matz"},
  {text: "Hotwire makes frontend so much simpler", from: "DHH"},
  {text: "Just deployed my first app, feeling great!", from: "Bob"},
  {text: "Ruby 3.3 performance is incredible", from: "Matz"},
  {text: "Convention over configuration, always", from: "DHH"},
  {text: "Anyone tried Sorbet for type checking?", from: "Bob"},
  {text: "We keep improving the garbage collector", from: "Matz"},
  {text: "Turbo Streams changed the game for me", from: "DHH"},
  {text: "I love how readable Ruby code is", from: "Bob"},
  {text: "YJIT is getting faster every release", from: "Matz"},
  {text: "Stimulus is underrated honestly", from: "DHH"},
  {text: "Wrote a gem over the weekend, it was fun", from: "Bob"},
  {text: "The community keeps Ruby alive and strong", from: "Matz"},
  {text: "Basecamp runs on Rails and it flies", from: "DHH"},
  {text: "Blocks and procs are so elegant", from: "Bob"},
  {text: "Fibers are great for concurrency", from: "Matz"},
  {text: "Omakase stack is the way to go", from: "DHH"},
  {text: "Who needs semicolons anyway?", from: "Bob"},
  {text: "Ractor is still evolving, stay tuned", from: "Matz"},
  {text: "Action Cable is perfect for real-time features", from: "DHH"},
  {text: "Just refactored 500 lines into 50, love Ruby", from: "Bob"},
  {text: "Merry Christmas, here's a new Ruby release", from: "Matz"},
  {text: "Kamal makes deployment a breeze", from: "DHH"},
  {text: "IRB is my happy place", from: "Bob"},
  {text: "Open classes give you so much power", from: "Matz"},
  {text: "Solid Queue replaces Sidekiq for us", from: "DHH"},
  {text: "Every day I learn something new in Ruby", from: "Bob"},
  {text: "Ruby is designed for developer happiness", from: "Matz"},
  {text: "The monolith is not dead, it's thriving", from: "DHH"},
  {text: "Enumerable methods are a gift to humanity", from: "Bob"},
  {text: "We aim to make programming fun", from: "Matz"},
  {text: "Active Record is still the best ORM out there", from: "DHH"},
  {text: "Hash rockets or new syntax? I go both ways", from: "Bob"},
  {text: "String manipulation in Ruby is so natural", from: "Matz"},
  {text: "Importmap changed how we think about JS in Rails", from: "DHH"},
  {text: "Pry is a lifesaver for debugging", from: "Bob"},
  {text: "Keyword arguments make APIs much clearer", from: "Matz"},
  {text: "You don't always need a microservice", from: "DHH"},
  {text: "Just discovered method_missing, mind blown", from: "Bob"},
  {text: "Frozen string literals help with performance", from: "Matz"},
  {text: "Propshaft is simpler than Sprockets", from: "DHH"},
  {text: "RSpec or Minitest? Both are great", from: "Bob"},
  {text: "Duck typing is a beautiful concept", from: "Matz"},
  {text: "Credentialed secrets management is so clean now", from: "DHH"},
  {text: "Metaprogramming is like magic", from: "Bob"},
  {text: "Data class was a nice addition in 3.2", from: "Matz"},
  {text: "Solid Cache keeps things simple", from: "DHH"},
  {text: "What does tap do???", from: "Bob"},
  {text: "I still get excited writing Ruby after 5 years", from: "Bob"},
  {text: "Everything is an object, as it should be", from: "Matz"},
  {text: "Multi-db support in Rails is fantastic", from: "DHH"},
  {text: "Lambda vs Proc, the eternal debate", from: "Bob"},
  {text: "We want Ruby to be natural, not simple", from: "Matz"},
  {text: "Encrypted attributes are a must for modern apps", from: "DHH"},
  {text: "Bundler makes dependency management painless", from: "Bob"},
  {text: "The principle of least surprise guides our design", from: "Matz"},
  {text: "Hotwire Native is the future of mobile", from: "DHH"},
  {text: "I built a CLI tool in Ruby in 30 minutes", from: "Bob"},
  {text: "Things are pretty solid over here", from: "DHH"},
  {text: "Refinements give you scoped monkey patching", from: "Matz"},
  {text: "Rails console is the best REPL workflow", from: "DHH"},
  {text: "Symbols vs strings tripped me up at first", from: "Bob"},
  {text: "We release a new Ruby every Christmas", from: "Matz"},
  {text: "Turbo makes SPAs unnecessary for most apps", from: "DHH"},
  {text: "Nokogiri is amazing for parsing HTML", from: "Bob"},
  {text: "Ruby should feel like a friend", from: "Matz"},
  {text: "What is Ruby's Eigenclass and why use Singleton Methods?", from: "Bob"},
  {text: "Action Mailbox handles inbound email beautifully", from: "DHH"},
  {text: "Learned about tap today, so useful for debugging", from: "Bob"},
  {text: "Pattern matching with in keyword is very powerful", from: "Matz"},
  {text: "Zeitwerk autoloading just works", from: "DHH"},
  {text: "Ruby makes me feel like a poet writing code", from: "Bob"},
  {text: "We added anonymous block arguments for cleaner code", from: "Matz"},
  {text: "Mission Solid is going to simplify Rails infra", from: "DHH"},
  {text: "Array#dig is one of my favorite methods", from: "Bob"},
  {text: "Backward compatibility matters to us deeply", from: "Matz"},
  {text: "Benchmark your code before optimizing", from: "DHH"},
  {text: "Just used OpenStruct for the first time, neat", from: "Bob"},
  {text: "Range objects are more useful than people think", from: "Matz"},
  {text: "The Rails doctrine guides everything we build", from: "DHH"},
  {text: "Comparable module is so clean to use", from: "Bob"},
  {text: "Threads in Ruby have come a long way", from: "Matz"},
  {text: "Action Text makes rich text editing simple", from: "DHH"},
  {text: "Who needs a framework when you have Sinatra?", from: "Bob"},
  {text: "Error highlighting in Ruby 3.1 was a game changer", from: "Matz"},
  {text: "Litestack is an interesting Rails approach", from: "DHH"},
  {text: "Regex in Ruby feels natural", from: "Bob"},
  {text: "I appreciate every contributor to Ruby", from: "Matz"},
  {text: "SQLite deserves more love in Rails apps", from: "DHH"},
  {text: "Finally understood eigenclasses, took me a while", from: "Bob"},
  {text: "Happy coding to all Rubyists out there", from: "Matz"},
  {text: "What is this class << self? Ruby never stops to surprise me", from: "Bob"},
  {text: "Ship it and iterate, that's the Rails way", from: "DHH"},
  {text: "Struct is underused and underappreciated", from: "Bob"},
  {text: "Ruby makes complex things simple", from: "Matz"},
  {text: "Thruster gives you HTTP/2 out of the box", from: "DHH"},
  {text: "Rake tasks are my secret weapon", from: "Bob"},
  {text: "Keep experimenting, keep having fun", from: "Matz"},
  {text: "One person framework is real with Rails 8", from: "DHH"},
  {text: "Started with Python, staying with Ruby forever", from: "Bob"},
  {text: "The future of Ruby is bright", from: "Matz"},
  {text: "This community is the best in tech, hands down", from: "Bob"},
  {text: "Less JavaScript, more happiness", from: "DHH"},
].each do |message_attrs|
  Message.find_or_create_by(text: message_attrs[:text]) do |msg|
    msg.conversation = conversation1
    msg.participant = participants_by_name.fetch(message_attrs[:from])
  end
end

