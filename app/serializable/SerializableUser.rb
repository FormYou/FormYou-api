class SerializableUser < JSONAPI::Serializable::Resource
    type 'users'
  
    attributes :email, :name, :role, :checked
  
    link :self do
      @url_helpers.api_user_url(@object.id)
    end
end