Given /^the following movies exist:$/ do |movies_table|
  Movie.delete_all
  movies_table.hashes.each do |row|
    Movie.create row
  end
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |title, director|
  movie = Movie.find_by_title(title)
  movie.director.should == director
end