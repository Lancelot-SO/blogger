require 'rails_helper'
RSpec.describe 'Post show page:', type: :feature do
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
  scenario 'I can see the posts title.' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@post_one.title)
  end
  scenario 'I can see who wrote the post' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@post_one.author.name)
  end
  scenario 'I can see how many comments it has.' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@post_one.comments.count)
  end
  scenario 'I can see how many likes it has.' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@post_one.likes.count)
  end
  scenario ' I can see the post body.' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@post_one.text)
  end
  scenario 'I can see the username of each commentor.' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@comment_one.author.name)
    expect(page).to have_content(@comment_two.author.name)
    expect(page).to have_content(@comment_three.author.name)
    expect(page).to have_content(@comment_four.author.name)
    expect(page).to have_content(@comment_five.author.name)
  end
  scenario 'I can see the body of each comment.' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@user_one.posts.first.comments.first.text)
    expect(page).to have_content(@user_one.posts.first.comments.second.text)
    expect(page).to have_content(@user_one.posts.first.comments.third.text)
    expect(page).to have_content(@user_one.posts.first.comments.fourth.text)
    expect(page).to have_content(@user_one.posts.first.comments.fifth.text)
  end
end
