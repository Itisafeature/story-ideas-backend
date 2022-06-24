class CommentSerializer
  include JSONAPI::Serializer
  attributes :created_at, :content, :idea_id
end
