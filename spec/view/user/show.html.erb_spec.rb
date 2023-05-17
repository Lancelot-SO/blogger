require 'rails_helper'
RSpec.describe 'User show page:', type: :feature do
  before(:each) do
    @user_one = User.create(name: 'unique_show', photo: 'http://localhost:3000/anything.jpg', bio: 'Anything test')
    @post_one = Post.create(title: 'post one', text: 'post one text', author: @user_one)
    @post_two = Post.create(title: 'post two', text: 'post two text', author: @user_one)
    @post_three = Post.create(title: 'post three', text: 'post three text', author: @user_one)
    @post_four = Post.create(title: 'post four', text: 'post four text', author: @user_one)
  end
  scenario 'I can see the user profile picture' do
    visit user_path(@user_one.id)
    expect(@user_one.photo).to match(%r{^http?://.*\.(jpe?g|gif|png)$})
  end
  scenario 'I can see the users username.' do
    visit user_path(@user_one.id)
    expect(page).to have_content(@user_one.name)
  end
  scenario 'I can see the number of posts the user has written.' do
    visit user_path(@user_one.id)
    expect(page).to have_content(@user_one.posts.count)
  end
  scenario 'I can see the users bio' do
    visit user_path(@user_one.id)
    expect(page).to have_content(@user_one.bio)
  end
  scenario 'I can see the users first 3 posts' do
    visit user_path(@user_one.id)
    expect(page).to have_content(@user_one.most_three_recent_post.first.title)
    expect(page).to have_content(@user_one.most_three_recent_post.second.title)
    expect(page).to have_content(@user_one.most_three_recent_post.third.title)
  end
  scenario 'I can see a button that lets me view all of a users posts' do
    visit user_path(@user_one.id)
    expect(page).to have_button('See all posts')
  end
  scenario 'When I click a users post, it redirects me to that posts show page' do
    visit user_path(@user_one.id)
    click_link("Post ##{@user_one.most_three_recent_post.first.id}")
    expect(page).to have_current_path(user_post_path(@user_one.id, @user_one.most_three_recent_post.first.id))
  end
  scenario 'When I click the see all posts button, it redirects me to the users posts index page' do
    visit user_path(@user_one.id)
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(@user_one.id))
  end
end
