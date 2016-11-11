#base class for messages: text message
class Message < CouchRest::Model::Base
  belongs_to :user
  property :message, String
  timestamps!
end
