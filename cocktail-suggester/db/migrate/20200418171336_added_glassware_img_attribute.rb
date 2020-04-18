class AddedGlasswareImgAttribute < ActiveRecord::Migration
  def change
    add_column :cocktails, :glassware_img, :string
  end
end
