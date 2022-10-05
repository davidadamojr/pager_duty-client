# frozen_string_literal: true

require_relative "client/version"

require "httparty"

module PagerDuty
  module Client
    class Error < StandardError; end

    def self.find_service(service_name)
      response = HTTParty.get("https://api.pagerduty.com/services?query=#{service_name}&limit=1&sort_by=name:asc",
                              headers: {
                                "Authorization" => "Token token=y_NbAkKc66ryYTWUXYEu",
                                "Accept" => "application/vnd.pagerduty+json;version=2",
                                "Content-Type" => "application/json"
                              })
      puts response.code
      puts JSON.parse(response.body)["services'"][0]
    end
  end
end
