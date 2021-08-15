module PicturesHelper
    def choose_new_or_edit
        if action_name == 'new' || action_name == 'create'
          confirm_pictures_path
        elsif action_name == 'edit'
          picture_path
        end
    end
    def authenticate_user?(picture)
      picture.user_id == current_user.id
    end
end