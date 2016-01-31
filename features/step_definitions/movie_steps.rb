Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^I check the "([^\"]*)" checkbox/ do |field|
  check("ratings_#{field}")
end

When /^I uncheck the "([^\"]*)" checkbox/ do |field|
  #find(:css, "#ratings_#{field}").set(false)
  uncheck("ratings_#{field}")
end

When /^I press the "([^\"]*)" button/ do |button|
  click_button(button)
end

# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "([^\"]+)" before "([^\"]+)"$/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  regexp = Regexp.new ".*#{e1}.*#{e2}"
  page.body.should =~ regexp
  #  page.content  is the entire content of the page as a string.
  #flunk "Unimplemented"
end

Then /I should (not )?see "([^\"]+)"$/ do |negate, movie|
  negate ? page.should(have_no_content("#{movie}")) : page.body.should =~ Regexp.new("#{movie}")
  #flunk "Unimplemented"
end


# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end
