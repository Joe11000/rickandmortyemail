namespace :email do
  task :rick_and_morty => :environment do
    User.all.each { |u| QuoteMailer.quote_email(u).deliver_now! }
  end
end



def read_timer timer_file_name, now_time=Time.now
  File.open(timer_file_name, 'r') do |file|
    start_time = file.readline
    seconds_passed = ( now_time - Time.parse(start_time) ).floor
  end
end

$timer_file_name = '.rick_and_morty_timer'

namespace :timer do

  desc 'start a timer'
  task :start do

    if Dir[$timer_file_name].blank?
      puts 'starting Rick and Morty Timer'

      File.open($timer_file_name, 'w') { |file| file.write(Time.now.iso8601.to_s) }
    else
      puts "current time: #{ read_timer $timer_file_name } seconds."
    end
  end

  desc 'get the status of the timer'
  task :status do

    if File.exists? $timer_file_name
      puts "current time: #{ read_timer $timer_file_name } seconds."
    else
      puts 'Timer not started'
    end
  end

  desc 'stop a timer'
  task :stop do

    if Dir[$timer_file_name].blank?
      puts 'Timer not started'
    else
      puts "stop time: #{ read_timer $timer_file_name } seconds."
      File.delete($timer_file_name)
    end
  end
end
