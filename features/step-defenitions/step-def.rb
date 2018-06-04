#Given(/^User launches Nejm home page$/) do
#  @app.automation.home_page.visit_home
#end
#
#Then(/^user clicks on register link on auth string$/) do
#  @app.automation.home_page.create_account
#  #@app.automation.home_page.select_create_account
#end
#
#When(/^user is navigated to 'Register Page'$/) do
#  @app.automation.home_page.verify_page_title
#end

Given(/^User launches Bing home page$/) do
  @app.automation.home_page.visit_page
  #pending # express the regexp above with the code you wish you had
end

When(/^user clicks on search and enters a (.*) string$/) do |search_key|
  @app.automation.home_page.enter_search_text search_key
 # pending # express the regexp above with the code you wish you had
end

Then(/^user is navigated to a page containing (.*) keywords$/) do |result|
  @app.automation.home_page.verify_page_results result
  #pending # express the regexp above with the code you wish you had
end
