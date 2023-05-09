require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  user = User.new(name: 'Something',
                  photo: 'http://localhost:3000/something.jpg',
                  bio: 'Something test',
                  postscounter: 0)
  user.save
  post = Post.new(
    title: 'Something',
    text: 'Something test',
    author: user,
    commentscounter: 0,
    likescounter: 0
  )
  post.save

  describe 'Post GET /index' do
    it 'rendered post template' do
      get "/users/#{user.id}/posts/"
      expect(response).to render_template(:index)
    end
    it 'post responsed body with correct place holder' do
      get "/users/#{user.id}/posts/"
      expect(response.body).to include('list of posts for a given user ')
    end
  end
  describe 'Post GET /show' do
    it 'return success for detail post' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(200)
    end
    it 'rendered post detail template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end
    it 'post detail responsed body with correct place holder' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include('Post detail with comments ')
    end
  end
end
