require 'spec_helper'

describe Movie do
  context 'Find Similar Movies' do
    it 'should have a find_similar_movies method' do
      Movie.should respond_to :find_similar_movies
    end

    it 'should return a list of matching movies similar to the one passed to it' do
      
      starWars = Movie.new(id: 1, title: 'Star Wars', director: 'George Lucas')

      Movie.should_receive(:find)
        .with(starWars.id)
        .and_return(starWars)

      Movie.should_receive(:find_all_by_director)
        .with('George Lucas')
        .and_return [ 
          Movie.new(id: 1, title: 'Star Wars', director: 'George Lucas'),
          Movie.new(id: 2, title: 'Willow', director: 'George Lucas'),
          Movie.new(id: 3, title: 'Empire Strikes Back', director: 'George Lucas') ]

      results = Movie.find_similar_movies(starWars.id)

      results.each do |movie|
        movie.director.should == starWars.director
      end
    end
  end
end