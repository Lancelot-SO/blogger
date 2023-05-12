class Like < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  belongs_to :post

  after_save :update_post_like_counter
  def update_post_like_counter
    post.increment!(:likescounter)
  end
  private :update_post_like_counter
end
