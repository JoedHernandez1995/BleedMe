class Profile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image,
    :path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
    :url => "/system/:attachment/:id/:basename_:style.:extension",

    :styles => {
      :mini     => ['50x50#',    :jpg, :quality => 70],
      :thumb    => ['100x100#',  :jpg, :quality => 70],
      :small    => ['150x150#',  :jpg, :quality => 70],
      :medium   => ['200x200#',  :jpg, :quality => 70],
      :preview  => ['480x480#',  :jpg, :quality => 70],
      :large    => ['600>',      :jpg, :quality => 70],
      :retina   => ['1200>',     :jpg, :quality => 30]
    },

    :convert_options => {
      :mini     => '-set colorspace sRGB -strip',
      :thumb    => '-set colorspace sRGB -strip',
      :small    => '-set colorspace sRGB -strip',
      :medium   => '-set colorspace sRGB -strip',
      :preview  => '-set colorspace sRGB -strip',
      :large    => '-set colorspace sRGB -strip',
      :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
    }

    validates_attachment :image,
      :presence => true,
      :size => { :in => 0..10.megabytes },
      :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }

    has_attached_file :landscape,
      :path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
      :url => "/system/:attachment/:id/:basename_:style.:extension",

      :styles => {
        :regular    =>  ['1200x300#',  :jpg, :quality => 70]
      },

      :convert_options => {
        :regular    =>  '-set colorspace sRGB -strip'
      }

      validates_attachment :landscape,
        :presence => true,
        :size => {:in => 0..10.megabytes},
        :content_type => {:content_type => /^image\/(jpeg|png|gif|tiff)$/ }
end
