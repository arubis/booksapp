require 'sinatra/extension'
require 'securerandom'

module FailureRate
  extend Sinatra::Extension

  before do
    if ENV.key?("FAILURE_RATE") && SecureRandom.random_number <= ENV["FAILURE_RATE"].to_f && request.head?
      halt 503
    end
  end
end

register FailureRate
