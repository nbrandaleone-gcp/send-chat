require "option_parser"
require "colorize"
require "faker"
require "http/client"
require "uri"
require "json"

## Author: Nick Brandaleone nbrand@mac.com
## Date: December 2023
#
# This program generates phrases for my web based chat program.
# See: https://github.com/nbrandaleone-gcp/kemal-redis-chat
#
# Input: <URL>
# OUTPUT: nonsensical phrases sent to the URL in a loop

# Handle Ctrl+C (SIGTERM) and kill (SIGKILL) signal.
Signal::INT.trap  { puts "Caught Ctrl+C..."; exit }
Signal::TERM.trap { puts "Caught kill..."; exit }

# Variables
url = ""
empty_flag = true
debug = false

# Read the URL from the command line
OptionParser.parse do |parser|
  parser.banner = "Usage: send-chat [arguments]"
  parser.on("-u", "--url <URL>", "URL of chat web server") do |_url|
    url = _url
    if url == ""
      puts "ERROR: Invalid URL"
    else
      empty_flag = false
    end
  end
  parser.on("-d", "--debug", "Show debugging information") { debug = true }
  parser.on("-h", "--help", "Show this help") do
    puts parser
    exit(0)
  end
  parser.invalid_option do |flag|
    STDERR.puts "ERROR: #{flag} is not a valid option."
    STDERR.puts parser
    exit(1)
  end
end

if empty_flag
  puts "program needs argument to continue. Use '-h' for help."
  exit(1)
end

headers = HTTP::Headers{
  "Content-Type"  => "application/json",
}

# Send HTTP POST with json data
def send_chat(url, data, headers)
  STDERR.puts data.pretty_inspect.colorize(:dark_gray) # comment out here!
  HTTP::Client.post(url, body: data.to_json, headers: headers)
end

#def get_url
#  STDIN.gets.to_s.chomp
#  print url.colorize(:green)
#end

r = Random.new
count = 0

# Main loop. Run 100 times or until user breaks out
100.times do
  uri = URI.parse(url)
  phrase = Faker::Hacker.say_something_smart
  data = "[Bot][#{Time.local}] - #{phrase}"
  message = {"msg" => data}
  send_chat(uri, message, headers)
  sleep(1 + rand(3) + r.rand.round(2)) # sleep 1.second
end
