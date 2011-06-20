class Loudmouth::CommentsController < ApplicationController
  layout Loudmouth.use_layout if Loudmouth.use_layout.length > 0
  before_filter :authenticate_user!, :except => [ :index ]
  
  helper_method :topic, :topic_c, :topic_comment, :topic_comment_c, :user, :user_c
  helper_method :new_comment_content, :validate_create, :validate_destroy

  def index
    @topic = topic_c.find(params[topic.foreign_key.to_sym])
    @comments = topic_comment_c.find(:all, :conditions => { topic.foreign_key.to_sym => @topic.id }, 
                                    :order => 'created_at DESC', :include => [ :author ])
    @comment = topic_comment_c.new
    if defined?(@layout)
      render 'loudmouth/comments/index', :layout => @layout
    else
      render 'loudmouth/comments/index'
    end
  end
  
  def edit
    @comment = topic_c.find(params[:id])
  end

  def create
    @topic = topic_c.find(params[topic_comment.to_sym][topic.foreign_key.to_sym])

    redirect_to :back unless validate_create(@topic)
    
    @comment = topic_comment_c.new(params[topic_comment.to_sym])
    @user = user_c.find(params[topic_comment.to_sym][('author_' + user.foreign_key).to_sym])
    
    if params[topic_comment.to_sym][:content] == new_comment_content()
      flash[:error] = new_comment_content().
      redirect_to :back
      return
    end
    
    if @comment.save
      flash[:success] = 'Comment successfully posted.'
      redirect_to after_create_path()
    else
      flash[:error] = @comment.errors.full_messages.to_sentence if @comment.errors.any?
      redirect_to :back
    end
  end

  def update
    @comment = topic_comment_c.find(params[:id])

    if @comment.update_attributes(params[topic_comment.to_sym])
      flash[:success] = 'Comment successfully updated.'
      redirect_to after_update_path()
    else
      flash[:error] = @comment.errors.full_messages.to_sentence if @comment.errors.any?
      redirect_to edit_topic_path()
    end
  end

  def destroy
    @comment = topic_comment_c.find(params[:id])
    
    if validate_destroy(@comment)
      @comment.destroy
      flash[:success] = 'Comment deleted.'
      redirect_to after_destroy_path()
    else
      flash[:error] = 'You can only delete comments that are yours.'
      redirect_to :back
    end
  end
  
  # With
  # comments_on :topics, :by => :users
  #
  # topic()                       => "topic"
  # topic().to_sym                => :topic
  # topic().foreign_key           => "topic_id"
  # topic().foreign_key.to_sym    => :topic_id
  # topic_c()                     =>  Topic
  #
  # topic_comment()                     => "topic_comment"
  # topic_comment().to_sym              => :topic_comment
  # topic_comment().foreign_key         => "topic_comment_id"
  # topic_comment().foreign_key.to_sym  => :topic_comment_id
  # topic_comment_c()                   =>  TopicComment
  #
  # user()                    => "user"
  # user().to_sym             => :user
  # user().foreign_key        => "user_id"
  # user().foreign_key.to_sym => :user_id
  # user_c()                  =>  User
  
  def topic
    @_topic ||= request.env['loudmouth_map'][:topic_model].singularize.downcase
  end
  
  def topic_c
    topic.camelize.constantize
  end
      
  def topic_comment
    @_topic_comment ||= topic + '_comment'
  end
  
  def topic_comment_c
    topic_comment.camelize.constantize
  end
  
  def user
    @_user ||= request.env['loudmouth_map'][:user_model].singularize.downcase
  end
  
  def user_c
    user.camelize.constantize
  end
  
  def new_comment_content
    Loudmouth.new_comment_content
  end
  
  ################
  # Paths
  ################
  
  # The path the user is redirected to after a successful update of a comment
  def after_update_path
    url_for(@topic)
  end
  
  # The path the user is redirected to after a successful creation of a comment
  def after_create_path
    url_for(@topic)
  end
  
  # The path the user is redirected to after a successful destroy of a comment
  def after_destroy_path
    url_for(@topic)
  end
  
  ######################
  # Validation Routines
  ######################

  # Used to validate that the current user can comment on topic.
  # Override to provide application specific commenting validation
  def validate_create(topic)
    true
  end
  
  # Used to validate that the current user can update an existing comment
  # Override to provide application specific commenting validation
  def validate_update(comment)
    true
  end

  # Used to validate that the current user can destroy the comment.
  # Override to provide application specific validation
  def validate_destroy(comment)
    # Check if there are corresponding instance variables for
    # topic and user.  If so attempt to validate with those.
    # Otherwise, this function can be overridden.
    user = instance_variable_get(:"@#{user}")
    topic = instance_variable_get(:"@#{topic}")
    
    if user and topic
      # is the comment owner?
      if user.id == topic.send(:"#{user.foreign_key}")
        return true
      end
    end
    false
  end
end
