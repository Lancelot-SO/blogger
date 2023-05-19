require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do
  path '/api/posts' do
    get 'Retrieves all posts' do
      tags 'Posts'
      produces 'application/json'

      response '200', 'posts found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            title: { type: :string },
            text: { type: :string },
            created_at: { type: :string },
            updated_at: { type: :string }
          },
          required: [ 'id', 'title', 'text', 'created_at', 'updated_at' ]

        run_test!
      end
    end
  end
end