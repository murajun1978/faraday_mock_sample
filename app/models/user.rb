class User
  include ActiveModel::Model
  include ActiveSupport::Configurable

  attr_accessor :id, :name

  config_accessor :client do
    Faraday.new(url: 'http://api.example.com') do |conn|
      conn.response :json
      conn.adapter  Faraday.default_adapter
    end
  end

  def self.all
    res = client.get '/users'
    return [] unless res.success?
    res.body.collect { |attr| new(attr) }
  end
end
