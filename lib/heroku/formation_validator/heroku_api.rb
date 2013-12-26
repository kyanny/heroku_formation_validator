require "httparty"

module Heroku
  module FormationValidator
    class HerokuApi
      include HTTParty
      base_uri 'https://api.heroku.com'
      basic_auth ENV["HEROKU_EMAIL"], ENV["HEROKU_TOKEN"]
      headers({"Accept" => "application/vnd.heroku+json; version=3"})
      # debug_output $stderr

      def apps
        self.class.get("/apps")
      end

      def configvars(app_id_or_name)
        self.class.get("/apps/#{app_id_or_name}/config-vars")
      end

      def addons(app_id_or_name)
        self.class.get("/apps/#{app_id_or_name}/addons")
      end
    end
  end
end