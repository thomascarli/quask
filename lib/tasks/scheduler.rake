desc "This task is called by the Heroku scheduler add-on"
task :squawk => :environment do
  puts "Squawking..."
  Question.squawk
  puts "done."
end
