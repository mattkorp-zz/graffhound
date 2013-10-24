class Pic < ActiveRecord::Base
  attr_accessible :url

  belongs_to :piece
end