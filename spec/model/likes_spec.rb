require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'Something',
                  photo: 'http://localhost:3000/something.jpg',
                  bio: 'Something test',
                  postscounter: 0)
  post = Post.new(
    title: 'Something',
    text: 'Something test',
    author: user,
    commentscounter: 0,
    likescounter: 0
  )
  subject do
    described_class.new(
      author: user,
      post:
    )
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
