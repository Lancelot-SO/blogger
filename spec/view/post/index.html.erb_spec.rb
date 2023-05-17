require 'rails_helper'
RSpec.describe 'User post index page:', type: :feature do
  before(:each) do
    @user_one = User.create(name: 'unique_show', photo: 'http://localhost:3000/anything.jpg', bio: 'Anything test')
    @post_one = Post.create(title: 'post one', text: 'post one text', author: @user_one)
    @post_two = Post.create(title: 'post two', text: 'post two text', author: @user_one)
    @post_three = Post.create(title: 'post three', text: 'post three text', author: @user_one)
    @post_four = Post.create(title: 'post four', text: 'post four text', author: @user_one)
    @comment_one = Comment.create(text: 'comment one', author: @user_one, post: @post_one)
    @comment_two = Comment.create(text: 'comment two', author: @user_one, post: @post_one)
    @comment_three = Comment.create(text: 'comment three', author: @user_one, post: @post_one)
    @comment_four = Comment.create(text: 'comment four', author: @user_one, post: @post_one)
    @comment_five = Comment.create(text: 'comment five', author: @user_one, post: @post_one)
    @like_one = Like.create(author: @user_one, post: @post_one)
  end
  scenario 'I can see the users profile picture.' do
    visit user_posts_path(@user_one.id)
    expect(@user_one.photo).to match(%r{^http?://.*\.(jpe?g|gif|png)$})
  end
  scenario 'I can see the users name.' do
    visit user_posts_path(@user_one.id)
    expect(page).to have_content(@user_one.name)
  end
  scenario 'I can see the number of posts the user has written.' do
    visit user_posts_path(@user_one.id)
    expect(page).to have_content(@user_one.posts.count)
  end
  scenario 'I can see a posts title.' do
    visit user_posts_path(@user_one.id)
    expect(page).to have_content("Post ##{@post_one.id}")
  end
  scenario 'I can see some of the posts body.' do
    visit user_posts_path(@user_one.id)
    expect(page).to have_content(@post_one.title)
  end
  scenario 'I can see the first comments on a post.' do
    visit user_posts_path(@user_one.id)
    expect(page).to have_content(@post_one.five_most_recent_comments.first.text)
  end
  scenario 'I can see how many comments a post has.' do
    visit user_posts_path(@user_one.id)
    expect(page).to have_content(@post_one.comments.count)
  end
  scenario 'I can see how many likes a post has.' do
    visit user_posts_path(@user_one.id)
    expect(page).to have_content(@post_one.likes.count)
  end
  scenario 'I can see a section for pagination if there are more posts than fit on the view.' do
    visit user_posts_path(@user_one.id)
    expect(page).to have_button('Pagination')
  end
  scenario 'When I click on a post, it redirects me to that posts show page.' do
    visit user_posts_path(@user_one.id)
    click_link("Post ##{@user_one.posts.first.id}")
    expect(page).to have_current_path(user_post_path(@user_one.id, @user_one.posts.first.id))
  end
end
