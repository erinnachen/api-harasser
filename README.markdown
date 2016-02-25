# A taste of APIs
This was an evening of fun with APIs taken from [this assignment](https://github.com/turingschool/lesson_plans/blob/master/ruby_02-web_applications_with_ruby/exploring_apis.markdown).


### NYTimes API
To access the New York Times via its [Top Stories API](http://developer.nytimes.com/docs/top_stories_api/), run the program `ruby top_stories.rb <section> <nstories>` from the command line. The section and number of stories are optional arguments and default to science and 10, respectively.

### Twilio API
We can send SMS messages via [Twilio](http://www.twilio.com/) through a ruby program. To run this program, set the following environment variables in your terminal:

* ACCOUNT_SID : received after registration with Twilio
* AUTH_TOKEN  : received after registration with Twilio
* TWILIO_NUM  : chosen after registration with Twilio

Run the program with `ruby message_sender.rb <target_number>` where target_number needs to start with 1 and the area code, e.g. 18885552222.
