class CommentsController < Loudmouth::CommentsController
  # You can have a dynamic layout specified under conditions defined in :determine layout below.
  # layout :determine_layout

  # To use this override controller, uncomment the methods you want to override.

  #
  # You can override any method in the Loudmouth::CommentsController.
  # Here we override index to locate and declare additional instance variables
  # and then call super to pass control to the original index method.
  #
  # def index
  #   if topic.to_sym == :game
  #     @game = Game.find(params[:game_id])
  #   elsif topic.to_sym == :profile
  #     @profile = Profile.find(params[:profile_id], :include => [ :primary_pic ])
  #   else
  #     raise "unknown model in Comments#index"
  #   end
  #   super
  # end
  
  #
  # after_create_path specifies the path the user is redirected to after
  # successfully posting a comment.
  #
  # def after_create_path
  #   if topic.to_sym == :game
  #     game_comments_path(@game)
  #   elsif topic.to_sym == :profile
  #     profile_comments_path(@profile)
  #   elsif topic.to_sym == :profile_pic
  #     profile_face_path(@profile, @profile_pic)
  #   else
  #     raise "unknown model in Comments#after_create_path"
  #   end
  # end
  
  #
  # validate_destroy is called prior to destroying a comment.
  # Return true or false to indicate whether the current user is authorized to do so.
  #
  # def validate_destroy(comment)
  #   [ code to determine if the current user is authorized to destroy comment ]
  #   return true/false
  # end
  
  #
  # You can have a dynamic layout specified under conditions defined below.
  #
  # def determine_layout
  #   if params.has_key?(:profile_id)
  #     'with_left_sidebar'
  #   elsif params.has_key?(:game_id)
  #     'one_column_900px'
  #   else
  #     'one_column_900px'
  #   end
  # end
end