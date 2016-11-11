class Comment < Postable
  belongs_to :post
  property :message, String

  design do
    view :by_user_id
    view :by_post_id
  end
end
