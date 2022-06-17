class IdeaSerializer
  include JSONAPI::Serializer

  attributes :title

  attribute :truncated_content, if: Proc.new {|record, params| params[:id].nil? } do |idea|
    idea.content.truncate(100, separator: ' ');
  end

  attribute :content, if: Proc.new { |record, params| !params[:id].nil? }

  attribute :comments, if: Proc.new { |record, params| !params[:id].nil? } do |idea|
    CommentSerializer.new(idea.comments)
  end 
end
