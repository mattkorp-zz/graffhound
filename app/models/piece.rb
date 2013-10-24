# == Schema Information
#
# Table name: pieces
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  birth      :date
#  alive      :boolean          default(TRUE)
#  url        :text             default("--- []\n")
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Piece < ActiveRecord::Base
  attr_accessible :name, :birth, :alive, :url, :location

  #acts_as_gmappable, :process_geocoding => false

  def gmaps4rails_address
   self.location
  end

 geocoded_by :location
 after_validation :geocode, :if => :location_changed?
 belongs_to :artist
 has_many :pics
 has_many :favorites
 has_many :users, :through => :comments
 has_many :users, :through => :favorites
end
