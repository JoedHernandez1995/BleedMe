class Profile < ActiveRecord::Base
  has_attached_file :image,
                    url: "/system/:hash.:extension",
                    hash_secret: "abc123"
  validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                     styles: { thumb: ["64x64#", :jpg] },
                     convert_options: { thumb: "-quality 75 -strip",
                                        original: "-quality 85 -strip" },
                     size: {in: 0..500.kilobytes}
end
