RSpec.describe Favorites do
  it 'can calculate total favorites' do
    favorites = Favorites.new(['1', '2', '3'])

    expect(favorites.count).to eq(3)
  end   

  end