module CommentsHelper
  
  def topic_comment_path(topic, comment)
    self.send(topic + '_comment_path', topic, comment)
  end
end