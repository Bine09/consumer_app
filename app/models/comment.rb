class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product, touch: true # touch true: updated_at of product will be set if comments of this product are changed/added/removed.

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }

  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }, presence: true

  after_create_commit { CommentUpdateJob.perform_later(self, self.user) } # after_create_commit will run any code between the { } parentheses after a comment has been created.
  #perform_later will enqueue the job and run it when it's its turn (after all previously enqueued jobs)


  #Because every comment record should be saved with a user ID, a product ID, and a message, it's a good idea to validate the presence of all of those attributes
  #(for the product and user relations, we validate the relation, not the name
  #of the database field, so we use the :user symbol instead of :user_id). This way, we'll ensure that the rating must be an integer value.



end
