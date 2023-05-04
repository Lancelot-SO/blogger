require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.new(
      name: 'Something',
      photo: 'http://localhost:3000/something.jpg',
      bio: 'Something test',
      postscounter: 0
    )
  end

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end
  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end
  it 'it is not valid with negeative number for post conuter' do
    user.postscounter = -1
    expect(user).to_not be_valid
  end
  it 'it is not valid with string for post conuter' do
    user.postscounter = 'string'
    expect(user).to_not be_valid
  end
end
