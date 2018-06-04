require './dsl/web/page_objects/home_page'

module DSL
module Web

  class WebDsl
    
    attr_accessor :home_page,:driver
    
    def initialize dsl
      
      client = Selenium::WebDriver::Remote::Http::Default.new
      client.timeout = 204 #seconds
      
      browser_sym=dsl.config.browser.downcase.to_sym
      exec_mode=dsl.config.execution_mode.downcase
      
      if exec_mode == 'local'
        @driver = Selenium::WebDriver.for(browser_sym, :http_client => client)
        @driver.manage.timeouts.implicit_wait=dsl.config.implicit_wait_timeouts.to_i
        @driver.manage.window.maximize
        
        dsl.web = self
        @home_page = DSL::Web::PageObjects::HomePage.new dsl
      end
      
    end
      
    
  end

end
end
