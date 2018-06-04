require 'yaml'
require 'hash-to-ostruct'
require 'selenium-webdriver'
require 'page-object'
require 'page-object/page_factory'

require './dsl/web/web_dsl'

module DSL
  
  class DomainSpecificLanguage 
    
    attr_accessor :web,:automation,:config
    
    def initialize config='./config.yaml'
      @config=YAML.load_file(config).to_ostruct
      
      if @config.app_type == "web"
        @web=DSL::Web::WebDsl.new self
        @automation=@web
      end
        
    end
    
  end
  
end
