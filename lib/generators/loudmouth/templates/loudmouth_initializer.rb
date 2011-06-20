
Loudmouth.setup do |config|
  # Optionally specify a layout to use for the loudmouth controller
  config.use_layout = ''
  
  # Default comment text for the new comment form
  config.new_comment_content = "Enter new Comment..."
  
  # How many minutes before a user can post a subsequent comment (rate limiting)
  config.rate_limit_cooldown = 1
  
  # Allow anonymous commenting?
  config.allow_anonymous = false
end

