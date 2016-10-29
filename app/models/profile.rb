class Profile < ActiveRecord::Base
  belongs_to :user

  has_many :heights
  has_many :weights
  has_many :muscle_masses
  has_many :goods

end
