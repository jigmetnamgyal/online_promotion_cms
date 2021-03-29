module ClothingsHelper
    def clothing_author(clothing)
        user_signed_in? && current_user.id == clothing.user_id
    end
end
