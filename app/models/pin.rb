class Pin < ActiveRecord::Base
  attr_accessible :description, :image, :approved, :image_remote_url
  
  validates :user_id, presence: true
  validates :description, presence: true
  validates_attachment :image, presence: true,
  															content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']},
  															size: { less_than: 3.megabytes }


  belongs_to :user
  has_attached_file :image, :styles => { :small => "214x214>", :medium => "500x500>", :large => "800x800>"}


  def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end

end
