class IdeaSerializer
  include JSONAPI::Serializer

  attributes :title

  attribute :content, if: Proc.new { |record, params| !params[:id].nil? }

  attribute :comments, if: Proc.new { |record, params| !params[:id].nil? } do |idea|
    CommentSerializer.new(idea.comments)
  end 
end
