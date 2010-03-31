# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class DeprecateUserAgentsExtension < Spree::Extension
  version "1.0"
  description "Display a warning for old outdated browsers."
  url "http://github.com/azimuth/spree-deprecate-user-agents"

  # Please use deprecate_user_agents/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate
    Spree::BaseController.class_eval do
      before_filter :dua_setup
      
      private
      
      def dua_setup
        if Spree::Config.get(:dua_enabled) 
          unless cookies[:dua_been_warned]
            @dua_enabled = Spree::Config.get(:dua_enabled) || true
            @dua_message = Spree::Config.get(:dua_message) || "Your Browser is outdated, please upgrade to the latest version."
            cookies[:dua_been_warned] = true
          end
        end
      end
    end
    
    # make your helper avaliable in all views
    # Spree::BaseController.class_eval do
    #   helper YourHelper
    # end
  end
end
