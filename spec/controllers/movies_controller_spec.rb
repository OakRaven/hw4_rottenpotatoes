require 'spec_helper'

describe MoviesController do
  describe 'Find Similar Movies' do

    it 'should call the model method that performs the search' do
      starWars = Movie.new(id: 1, title: 'Star Wars', director: 'George Lucas')

      Movie.should_receive(:find)
        .with(starWars.id)
        .and_return(starWars)
        
      Movie.stub(:find_all_by_director)
        .with('George Lucas')
        .and_return [ 
          Movie.new(id: 1, title: 'Star Wars', director: 'George Lucas'),
          Movie.new(id: 2, title: 'Willow', director: 'George Lucas'),
          Movie.new(id: 3, title: 'Empire Strikes Back', director: 'George Lucas') ]

      Movie.should_receive(:find_similar_movies).with(starWars.id)

      get :find_similar_movies, :id => starWars.id
    end

    it 'should select the similar results template for rendering' do
      starWars = Movie.new(id: 1, title: 'Star Wars', director: 'George Lucas')

      Movie.should_receive(:find)
        .with(starWars.id)
        .and_return(starWars)
        
      Movie.stub(:find_all_by_director)
        .with('George Lucas')
        .and_return [ 
          Movie.new(id: 1, title: 'Star Wars', director: 'George Lucas'),
          Movie.new(id: 2, title: 'Willow', director: 'George Lucas'),
          Movie.new(id: 3, title: 'Empire Strikes Back', director: 'George Lucas') ]

      Movie.stub(:find_similar_movies)
      
      get :find_similar_movies, { id: starWars.id }

      response.should render_template('find_similar_movies')
    end

  end
end