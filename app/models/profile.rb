class Profile < ActiveRecord::Base
  belongs_to :user

  has_many :Heights
  has_many :weights
  has_many :muscle_masses

end
