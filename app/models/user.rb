class User < CouchRest::Model::Base
  collection_of :posts
  collection_of :reposts
  collection_of :comments
  collection_of :likes
  collection_of :private_chats
  property :name, String
  property :email, String
  property :password_hash, String
  property :about, String, default: "Blank"
  property :page_name, String
  property :followers, [String]
  property :following, [String]
  timestamps!

  design do
    view :by_password_hash
    view :by_name
    view :by_email
    view :by_page_name
    view :by_created_at
  end

end
