require 'whiskey_disk/helpers'

namespace :deploy do

  task :bounce_passenger do
    puts "restarting Passenger web server"
    Dir.chdir(File.dirname(__FILE__)+"/../")
    system("touch tmp/restart.txt")
  end
  
  task :post_setup => ['db:migrate'] do
    puts 'post setup hook'
  end

  task :post_deploy => ['db:migrate', :bounce_passenger] do
    puts 'post deploy hook'
  end
  
end