require 'spec_helper.rb'

describe Movie do
  it 'should include rating and year in full name' do
    movie = FactoryGirl.build :movie, title: 'Milk', rating: 'R'
    expect(movie.name_with_rating).to eq 'Milk (R)'
  end
end

describe Movie do
  subject { build :movie, title: 'Milk', rating: 'R' }
  its(:name_with_rating) { eq 'Milk (R)' }
end

# describe Movie do
#   fixtures :movies
#   it 'should include rating and year in full name' do
#     movie = movies(:milk_movie)
#     expect(movie.name_with_rating).to eq 'Milk (R)'
#   end
# end