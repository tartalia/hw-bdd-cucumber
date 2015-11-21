#require File.expand_path(File.join(File.dirname(__FILE__), ".", "web_steps"))

# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    m = Movie.new
    m.title = movie[:title]
    m.rating = movie[:rating]
    m.release_date = movie[:release_date]
    m.save
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  list = rating_list.split(',')
  list.each do |rating|
    if uncheck
      step "I uncheck \"ratings[#{rating.strip}]\""
    else
      step "I check \"ratings[#{rating.strip}]\""
    end
  end
end

When(/^I 'submit' the search form on the homepage$/) do
  step 'I press "Refresh"'
end

Then /^I should see (.*) movies with rating (.*)/ do |count, rating|
  page.assert_selector(:xpath, "./html/body/div/table/tbody/tr[td='#{rating}']/td[1]", :count => count)
end

Then /^I should not see movies with rating (.*)/ do |rating|
  page.assert_selector(:xpath, "./html/body/div/table/tbody/tr[td='#{rating}']/td[1]", :count => 0)
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  fail "Unimplemented"
end
