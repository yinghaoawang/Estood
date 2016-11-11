#a chat with more than 2 users
class GroupChat < Chat
  collection_of :users
  property :messages, [Message]
  #TODO everything, basically
end
