class Event < ActiveRecord::Base
  has_many :muscle_of_events
  has_many :muscles, :through => :muscle_of_events
end
