class Entry < ActiveRecord::Base
   has_many :tags, through: :taggings
   has_many :taggings

   validates_presence_of :title
   validates_presence_of :body
end
