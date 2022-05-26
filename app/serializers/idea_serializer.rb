class IdeaSerializer
  include JSONAPI::Serializer

  attributes :title, :content

  # attribute :comments do |idea|
  #   CommentSerializer.new(idea.comments)
  # end
end
