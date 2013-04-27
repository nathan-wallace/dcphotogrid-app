class Pin < ActiveRecord::Base
  attr_accessible :description, :image, :approved, :image_remote_url
  
  validates :user_id, presence: true
  validates :description, presence: true
  validates_attachment :image, presence: true,
  	content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']},
  	size: { less_than: 10.megabytes }

  belongs_to :user
  has_attached_file :image, :styles => { :small => "214x214>", :medium => "500x500>", :large => "800x800>"}

  after_post_process :get_image_loc # unsure about this 

   def image_remote_url=(url_value)
     self.image = URI.parse(url_value) unless url_value.blank?
     super # existing functionality is inherited
   end

  # Image geolocation
  def get_image_loc
    imgfile = EXIFR::JPEG.new(image.queued_for_write[:original].path)
    return unless imgfile
  
    lat = imgfile.exif[0].gps_latitude[0].to_f + (imgfile.exif[0].gps_latitude[1].to_f / 60) + (imgfile.exif[0].gps_latitude[2].to_f / 3600)
    lng = imgfile.exif[0].gps_longitude[0].to_f + (imgfile.exif[0].gps_longitude[1].to_f / 60) + (imgfile.exif[0].gps_longitude[2].to_f / 3600)

    lat = lat * -1 if imgfile.exif[0].gps_latitude_ref == "S"      # (N is +, S is -)
    lng = lng * -1 if imgfile.exif[0].gps_longitude_ref == "W"   # (W is -, E is +)

    self.img_loc_lat  = lat # imgfile.gps_latitude
    self.img_loc_lng  = lng # imgfile.gps_longitude
  end
	
end

