class CommentSerializer
  include JSONAPI::Serializer
  attributes :content, :idea_id
end
