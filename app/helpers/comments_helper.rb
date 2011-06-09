module CommentsHelper
  def render_comment_form
    render :partial => 'loudmouth/comments/comment_form'
  end
  
  def topic_comment_path(topic, comment)
    self.send(topic + '_comment_path', topic, comment)
  end
end