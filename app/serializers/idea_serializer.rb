class IdeaSerializer
  include JSONAPI::Serializer

  attributes :id, :title

  attribute :truncated_content, if: Proc.new {|record, params| params[:id].nil? } do |idea|
    idea.content.truncate(100, separator: ' ');
  end

  attribute :content, if: Proc.new { |record, params| !params[:id].nil? }

  attribute :comments, if: Proc.new { |record, params| !params[:id].nil? } do |idea|
    CommentSerializer.new(idea.comments.order_by_most_recent)
  end 
end
