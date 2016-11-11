class Viewable < CouchRest::Model::Base
  property :deleted, TrueClass, :default => false
  property :visible, TrueClass, :default => true
  timestamps!
end
