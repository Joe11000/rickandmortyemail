namespace :email do
  task :rick_and_morty => :environment do
    User.all.each { |u| QuoteMailer.quote_email(u).deliver_now! }
  end
end


def read_timer timer_file_name
  File.open(timer_file_name, 'r') do |file|
    start_time = file.readline
    seconds_passed = ( Time.now - Time.parse(start_time) ).floor
  end
end

namespace :time do
  task :start do

    timer_file_name = '.rick_and_morty_timer'

    if Dir[timer_file_name].blank?
      puts 'starting Rick and Morty Timer'

      # save start time in file
      File.open(timer_file_name, 'w') { |file| file.write(Time.now.iso8601.to_s) }
    else
      puts "#{ read_timer timer_file_name } seconds have passed."
    end
  end

  task :status do

    timer_file_name = '.rick_and_morty_timer'

    if File.exists? timer_file_name

      # save start time in file
      puts "#{ read_timer timer_file_name } seconds have passed."
    else
      puts 'Timer not started'
    end
  end

  task :stop do

    timer_file_name = '.rick_and_morty_timer'

    if Dir[timer_file_name].blank?
      puts 'Timer not started'
    else

      puts "Timer stopped at #{ read_timer timer_file_name } seconds."

      File.delete(timer_file_name)
    end
  end
end
