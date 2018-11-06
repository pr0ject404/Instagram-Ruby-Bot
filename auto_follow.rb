require 'watir' # Crawler
require 'pry' # Ruby REPL
require 'rb-readline' # Ruby IRB
require 'awesome_print' # Console output
require_relative 'config' # Pulls all config in config.rb


username = $username
password = $password
users = $users
follow_counter = 0
unfollow_counter = 0
MAX_UNFOLLOWS = 10000
start_time = Time.now

# Open Browser, Navigate to Login page
browser = Watir::Browser.new :chrome, switches: ['--incognito']
browser.goto "instagram.com/accounts/login/"

# Navigate to Username and Password fields, inject info
puts "Logging in..."
browser.text_field(:name => "username").set "#{username}"
browser.text_field(:name => "password").set "#{password}"

# Click Login Button
browser.button(:class => '_0mzm- sqdOP  L3NKy       ').click
sleep(2)
puts "We're in #hackerman"

# Continuous loop to run until you've unfollowed the max people for the day
loop do
  users.each { |val|
    # Navigate to user's page
    browser.goto "instagram.com/#{val}/"

    # If not following then follow
    if browser.button(:class => '_5f5mN       jIbKX  _6VtSN     yZn4P   ').exists?
      ap "Following [ #{val} ]"
      browser.button(:class => '_5f5mN       jIbKX  _6VtSN     yZn4P   ').click
      follow_counter += 1
    elsif browser.button(:class => '_5f5mN    -fzfL     _6VtSN     yZn4P   ').exists?
      ap "Unfollowing [ #{val} ]"
      browser.button(:class => '_5f5mN    -fzfL     _6VtSN     yZn4P   ').click
	  browser.button(:class => 'aOOlW -Cab_   ').click
      follow_counter -= 1
    end
    sleep(1) # Sleep half a second to not get tripped up when un/following many users at once
  }
  puts "--------- #{Time.now} ----------"
  break if unfollow_counter >= MAX_UNFOLLOWS
  sleep(3600) # Sleep 1 hour (3600 seconds)
end

ap "Followed #{follow_counter} users and unfollowed #{unfollow_counter} in #{((Time.now - start_time)/60).round(2)} minutes"

# Leave this in to use the REPL at end of program
# Otherwise, take it out and program will just end
Pry.start(binding)

