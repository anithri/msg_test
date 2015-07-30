class Hero < ActiveRecord::Base
  validates :code_name, :real_name,
            presence: true

end
