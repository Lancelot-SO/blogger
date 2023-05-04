require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(name: 'Anything',
                  photo: 'http://localhost:3000/anything.jpg',
                  bio: 'Anything test',
                  postscounter: 0)
  subject do
    described_class.new(
      title: 'Anything',
      text: 'Anything test',
      author: user,
      commentscounter: 0,
      likescounter: 0
    )
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid with a length for title  more than 250 ' do
    title = ''
    title += 'a' while title.length < 251
    subject.title = title
    expect(subject).to_not be_valid
  end
  it 'it is not valid with negeative number for comment conuter' do
    subject.commentscounter = -1
    expect(subject).to_not be_valid
  end
  it 'it is not valid with string for comment conuter' do
    subject.commentscounter = 'string'
    expect(subject).to_not be_valid
  end
  it 'it is not valid with negeative number for like conuter' do
    subject.likescounter = -1
    expect(subject).to_not be_valid
  end
  it 'it is not valid with string for post conuter' do
    subject.likescounter = 'string'
    expect(subject).to_not be_valid
  end
end
