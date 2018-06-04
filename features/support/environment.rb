require './dsl/dsl'
require 'rspec/expectations'

World(PageObject::PageFactory)

Before do
  @app=DSL::DomainSpecificLanguage.new 
end

After do
  #@app.quit
end