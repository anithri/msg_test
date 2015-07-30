class Hero < ActiveRecord::Base
  validates :code_name, :real_name,
            presence: true
  has_one :base_of_operation

end
