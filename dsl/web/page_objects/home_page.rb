#require './dsl/web/page_objects/base_page'

module DSL
module Web
module PageObjects
  
  class HomePage #< BasePage
    include PageObject
   
    def initialize dsl
      #super dsl
      super dsl.web.driver, dsl.config.implicit_wait_timeout
      @dsl = dsl
    end
    
    #Page elements
    link :create_account, :css => "a.createAccount"
    
    def visit_home
      @dsl.automation.driver.get "https://qa.nejm.org"
    end
    
    def visit_page
      @dsl.automation.driver.get "http://www.bing.com"
    end
    def select_create_account
      @dsl.automation.driver.find_element(:css, 'a.createAccount').click
    end
    
    def enter_search_text key
        element = @dsl.automation.driver.find_element(:id,'sb_form_q')
        element.click
        element.send_keys key
        element.submit
    end
    def verify_page_title
      @dsl.automation.driver.find_element(:css, '#ContentPlaceHolder1_form_ctl_createaccount1_sPageHead').displayed?
    end
    def verify_page_results result 
      @dsl.automation.driver.title.downcase.start_with? "#{result}" 
      puts "Page title is #{@dsl.automation.driver.title}"
      @dsl.automation.driver.quit
    end
    
  end
  
end
end
end