module PostsHelper
  def action_based
    case action_name
    when 'new' || 'create'
      confirm_posts_path
    when 'edit'
      post_path
    else
      confirm_posts_path
    end
  end
end
