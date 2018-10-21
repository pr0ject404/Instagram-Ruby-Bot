require 'watir' # Crawler
require 'pry' # Ruby REPL
require 'rb-readline' # Ruby IRB
require 'awesome_print' # Console output
require_relative 'credentials' # Pulls in login credentials from credentials.rb


username = $username
password = $password
users = ['whinderssonnunes', 'maisa', 'luisasonza', 'larissamanoela', 'bela_fernandesoficial', 'kevinho', 'bel_moreira', 'biancaandradeoficial', 'flaviapavanelli', 'instagram', 'selenagomez', 'arianagrande', 'taylorswift', 'beyonce', 'kimkardashian', 'cristiano', 'kyliejenner', 'justinbieber', 'kendalljenner', 'nickiminaj', 'natgeo', 'neymarjr', 'nike', 'leomessi', 'khloekardashian', 'katyperry', 'jlo', 'ddlovato', 'kourtneykardash', 'badgalriri', 'fcbarcelona', 'realmadrid', 'theellenshow', 'justintimberlake', 'zendaya', '9gag', 'chrisbrownofficial', 'vindiesel', 'champagnepapi', 'davidbeckham', 'shakira', 'gigihadid', 'emmawatson', 'kingjames', 'garethbale11', 'nikefootball', 'adele', 'zacefron', 'vanessahudgens', 'ladygaga', 'maluma', 'nba', 'nasa', 'luissuarez9', 'zayn', 'shawnmendes', 'adidasfootball', 'brumarquezine', 'hm', 'harrystyles', 'chanelofficial', 'ayutingting92', 'letthelordbewithyou', 'niallhoran', 'anitta', 'hudabeauty', 'adidasoriginals', 'marinaruybarbosa', 'lucyhale', 'karimbenzema', 'princessyahrini', 'zara', 'nickyjampr', 'onedirection', 'andresiniesta8', 'raffinagita1717', 'krisjenner', 'manchesterunited', 'natgeotravel', 'deepikapadukone', 'snoopdogg', 'davidluiz_4', '3030oficial', 'priyankachopra', 'ashleybenson', 'lelepons', 'prillylatuconsina96', 'louisvuitton', 'britneyspears', 'jbalvin', 'laudyacynthiabella', 'ciara', 'stephencurry30', 'instagrambrasil']
follow_counter = 0
unfollow_counter = 0
MAX_UNFOLLOWS = 200
start_time = Time.now

# Open Browser, Navigate to Login page
browser = Watir::Browser.new :chrome, switches: ['--incognito']
browser.goto "instagram.com/accounts/login/"

# Navigate to Username and Password fields, inject info
puts "Logging in..."
browser.text_field(:name => "username").set "#{username}"
browser.text_field(:name => "password").set "#{password}"

# Click Login Button
browser.button(:class => 'oF4XW sqdOP  L3NKy      ').click
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
	  sleep(1)
      browser.button(:class => '_5f5mN       jIbKX  _6VtSN     yZn4P   ').click
	  sleep(1.0/2.0)
      follow_counter += 1
    elsif browser.button(:class => '_5f5mN    -fzfL     _6VtSN     yZn4P   ').exists?
      ap "Unfollowing [ #{val} ]"
	  sleep(1)
      browser.button(:class => '_5f5mN    -fzfL     _6VtSN     yZn4P   ').click
	  sleep(1)
	  browser.button(:class => 'aOOlW -Cab_   ').click
	  sleep(1)
      follow_counter -= 1
    end
    sleep(1) # Sleep half a second to not get tripped up when un/following many users at once
  }
  puts "--------- #{Time.now} ----------"
  break if unfollow_counter >= MAX_UNFOLLOWS
  sleep(30) # Sleep 1 hour (3600 seconds)
end

ap "Followed #{follow_counter} users and unfollowed #{unfollow_counter} in #{((Time.now - start_time)/60).round(2)} minutes"

# Leave this in to use the REPL at end of program
# Otherwise, take it out and program will just end
Pry.start(binding)
