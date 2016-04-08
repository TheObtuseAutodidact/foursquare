class User < ActiveRecord::Base

  def self.from_omniauth(auth_data)
    User.where(uid: auth_data[:uid]).first_or_create do |new_user|
      new_user.uid  = auth_data.uid
      new_user.name = auth_data.info.name
      new_user.access_token = auth_data.credentials.token
    end
  end

  def set_service_with_user(current_user)
    @service = FoursquareService.new(current_user)
  end

  def service
    @service
  end

  def user
    service.user
  end
end
