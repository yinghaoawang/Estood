class Post < Postable
  collection_of :comments
  collection_of :reposts
  property :message, String

  design do
    view :by_user_id
    view :by_visible
  end
end

