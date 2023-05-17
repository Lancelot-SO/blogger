require 'rails_helper'

RSpec.describe 'User index page:', type: :feature do
  before(:each) do
    @user_one = User.create(name: 'unique', photo: 'http://localhost:3000/anything.jpg', bio: 'Anything test')
    @post = Post.create(title: 'Anything', text: 'Anything test', author: @user_one)
  end

  scenario 'I can see the username of all other users' do
    visit users_path
    expect(page).to have_content(@user_one.name)
  end
  scenario 'I can see the profile picture for each user.s' do
    visit users_path
    expect(@user_one.photo).to match(%r{^http?://.*\.(jpe?g|gif|png)$})
  end
  scenario 'I can see the number of posts each user has written.' do
    visit users_path
    expect(page).to have_content(@user_one.posts.count)
  end
  scenario 'When I click on a user, I am redirected to that user show page' do
    visit users_path
    click_link(@user_one.name)
    expect(page).to have_current_path(user_path(@user_one.id))
  end
end
