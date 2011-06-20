class CommentsController < Loudmouth::CommentsController
  # You can have a dynamic layout specified under conditions defined in :determine layout below.
  # layout :determine_layout

  # To use this override controller, uncomment the methods you want to override.

  #
  # You can override any method in the Loudmouth::CommentsController.
  # As an example, here we override index to locate and declare additional instance variables
  # and then call super to pass control to the original loudmouth index method.
  #
  # def index
  #   if topic.to_sym == :game
  #     @game = Game.find(params[:game_id])
  #   else
  #     raise "unknown model in Comments#index"
  #   end
  #   super
  # end
  #   
  # def edit
  # end
  # 
  # def create
  # end
  # 
  # def update
  # end
  # 
  # def destroy
  # end
  
  ################
  # Paths
  ################
  
  # The path the user is redirected to after a successful creation of a comment
  # def after_create_path
  #   url_for(@topic)
  # end
  
  # The path the user is redirected to after a successful update of a comment
  # def after_update_path
  #   url_for(@topic)
  # end
  
  # The path the user is redirected to after a successful destroy of a comment
  # def after_destroy_path
  #   url_for(@topic)
  # end
  
  ######################
  # Validation Routines
  ######################

  # Used to validate that the current user can comment on topic.
  # Override to provide application specific commenting validation
  # def validate_create(topic)
  #   [ code to determine if the current user is authorized to comment on 'topic' ]
  #   [ set a flash message to diplay to the user in fail conditions ]
  #   flash[:error] = 'You're not authorized to comment here.'
  #   return true/false
  # end
  
  # Used to validate that the current user can update an existing comment
  # Override to provide application specific commenting validation
  # def validate_update(comment)
  #   [ code to determine if the current user is authorized to update 'comment' ]
  #   [ set a flash message to diplay to the user in fail conditions ]
  #   flash[:error] = 'You're not authorized to edit this comment.'
  #  return true/false
  # end

  # Used to validate that the current user can destroy the comment.
  # Override to provide application specific validation
  # Return true or false to indicate whether the current user is authorized to do so.
  #
  # def validate_destroy(comment)
  #   [ code to determine if the current user is authorized to destroy 'comment' ]
  #   [ set a flash message to diplay to the user in fail conditions ]
  #   flash[:error] = 'You're not authorized to delete this comment.'
  #   return true/false
  # end

  ######################
  # Other Routines
  ######################
  #
  # You can have a dynamic layout specified under the conditions you define below.
  #
  # def determine_layout
  #   if params.has_key?(:profile_id)
  #     'special_layout'
  #   elsif params.has_key?(:game_id)
  #     'application_layout'
  #   else
  #     'frames_layout'
  #   end
  # end
end