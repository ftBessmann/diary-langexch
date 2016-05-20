class MeetupGroup
  include HTTParty

  key_value = ENV["MEETUP_KEY"]
  #hostport = ENV["MEETUP_SERVER_AND_PORT"] || 'api.meetup.com'

  #base_uri "http://#{hostport}"
  base_uri 'api.meetup.com/3/'
  default_params key: key_value#, keyword: 'English'
  format :json

  def self.for (keyword)
    get("/find/groups", query: { text: keyword })["results"]
  end
end
