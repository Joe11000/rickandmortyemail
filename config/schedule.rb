# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every :monday, at: '3:00' do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# env 'MAILTO', 'joenoonan27@gmail.com'

every '* 18 * * *', env: :development do
  rake 'email:rick_and_morty'
end

every :day, at: '1:35pm' do
  rake 'email:rick_and_morty'
end

# every 2.minutes do
#   rake 'what:time'
# end


# every :sunday, at: '11:42pm' do
#   runner "User.all.each { |u| QuoteMailer.quote_email(u).deliver_now! }", environment: :development
# end
