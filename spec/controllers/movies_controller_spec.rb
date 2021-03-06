require 'rails_helper'

describe MoviesController do
  describe 'searching TMDb' do
    before do
      @fake_results = [double('movie1'), double('movie2')]
    end
    it 'should call the model method that performs TMDb search' do
      expect(Movie).to receive(:find_in_tmdb).with('hardware').and_return @fake_results
      post :search_tmdb, search_terms: 'hardware'
    end
    before do
      allow(Movie).to receive(:find_in_tmdb).with('hardware').and_return @fake_results
      post :search_tmdb, search_terms: 'hardware'  
    end
    it 'should select the Search Results template for rendering' do
      expect(response).to render_template 'search_tmdb'
    end
    it 'should make the TMDb search results available to that template' do
      expect(assigns(:movies)).to eq @fake_results
    end
  end
end