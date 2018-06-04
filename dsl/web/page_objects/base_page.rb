module DSL
module Web
module PageObjects
class BasePage
  include PageObject

  attr_accessor :dsl, :url, :title, :expected_elements, :timeout

  def initialize dsl
    #super dsl.web.driver, dsl.config.implicit_wait_timeout
    @dsl = dsl
  end

  def visit
    if @url != nil
      dsl.web.driver.get dsl.test_data.url + @url
    end
  end

  def displayed?
    response = true
    @expected_elements.each do |element|
      if response then response = self.send("#{element}_element").visible? end
    end
    response
  end

  def wait_for condition, timeout = @dsl.config.wait_timeout
    wait = Selenium::WebDriver::Wait.new(:timeout => timeout)
    wait.until { condition }
  end

  def wait_for_element_text locator, text, timeout = @dsl.config.wait_timeout
    timeout.times do
      condition = (@dsl.web.driver.find_element(locator).text == text)
      break if condition
      sleep 1
    end
  end

  def wait_for_element locator, timeout = @dsl.config.wait_timeout
    timeout.times do
      condition = (@dsl.web.driver.find_element(locator).displayed?)
      break if condition
      sleep 1
    end
  end
  
  def checked?(locator)
    boolean_command "isChecked", [locator,]
  end
  
    # def has_expected_title? 
    # @title = @dsl.web.driver.title
    # has_page_title = (@expected_title == @title)
    # raise "Expected title '#{:expected_title}' instead of '#{@title}'" unless has_page_title
    # has_page_title
# end
  
end
end # module PageObject
end # module Web
end # module DSL