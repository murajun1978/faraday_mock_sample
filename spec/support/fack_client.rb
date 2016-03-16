require 'sinatra/base'

class FackClient < Sinatra::Base
  get '/users' do
    json_response 200, 'users.json'
  end

  private
    def json_response(status_code, file_name)
      content_type :json
      status status_code
      File.open("spec/fixtures/#{file_name}",'rb').read
    end
end
