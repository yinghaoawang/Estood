#like a PM, a chat involving only 2 people
class PrivateChat < Chat
  #how to implement efficiently rather than something similar to group chat
  property :messages, [Message]
end
