require 'rubygems'
require 'twilio-ruby'

account_sid = ENV["ACCOUNT_SID"]
auth_token = ENV["AUTH_TOKEN"]
twilio_num = "+#{ENV["TWILIO_NUM"]}"
target_num = "+#{ARGV[0]}"

client = Twilio::REST::Client.new(account_sid, auth_token)
from   = twilio_num
data   = {
  :from => from,
  :to => target_num,
  :body => "I'm using an API!",
}

client.account.messages.create(data)

puts "Sent message!"
