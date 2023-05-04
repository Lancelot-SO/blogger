class Post < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User', counter_cache: :postscounter
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentscounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likescounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  after_save :update_user_post_counter

  def update_user_post_counter
    author.increment!(:postscounter)
  end

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
  private :update_user_post_counter
end
