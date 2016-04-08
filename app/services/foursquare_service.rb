class FoursquareService
  attr_reader :connection
  def initialize(user)
    @user = user
    @date = '20131016'
    @connection = Faraday.new("https://api.foursquare.com/v2/")
    connection.params['oauth_token'] = user.access_token
    connection.params['v'] = @date
  end

  def user
    JSON.parse(connection.get("users/self").body)
  end
end
