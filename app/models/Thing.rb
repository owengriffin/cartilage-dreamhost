
class Thing
  include DataMapper::Resource
  
  property :id, Serial
  property :description, Text, :required => true
  property :created_at, DateTime
end
