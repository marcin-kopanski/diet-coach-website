class Blog < ApplicationRecord
   validates_presence_of :title, :body

   has_many :comments, dependent: :destroy

   mount_uploader :main_image, BlogUploader

   enum status: { draft:0, published:1 }
   extend FriendlyId
   friendly_id :title, use: :slugged

   def self.special_blogs
      all
   end

   def self.featured_blogs
      limit(2)
   end

   def self.recent
      order(created_at: :desc)
   end
end
