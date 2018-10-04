class FixImageDefault < ActiveRecord::Migration[5.2]
  def change
    Movie.update_all(img: 'https://thesocietypages.org/socimages/files/2009/05/vimeo.jpg')
  end
end
