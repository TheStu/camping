class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|
      t.integer :category_id
      t.string :name
      t.integer :weight
      t.string :shape, null: true, default: nil 
      t.string :quilt, null: true, default: nil 
      t.integer :min_temp, null: true, default: nil 
      t.string :hood, null: true, default: nil 
      t.string :insulation, null: true, default: nil 
      t.string :season, null: true, default: nil 
      t.string :gear_type, null: true, default: nil 
      t.integer :capacity, null: true, default: nil 
      t.string :hip_strap, null: true, default: nil 
      t.string :frame, null: true, default: nil 
      t.string :access, null: true, default: nil 
      t.string :length, null: true, default: nil 
      t.integer :thickness, null: true, default: nil 
      t.integer :r_value, null: true, default: nil 
      t.string :waterproof, null: true, default: nil 
      t.string :bug_proof, null: true, default: nil 
      t.integer :life_time, null: true, default: nil 
      t.string :fixed_length, null: true, default: nil 
      t.string :staff, null: true, default: nil 
      t.string :poncho, null: true, default: nil 
      t.string :gender, null: true, default: nil 
      t.string :material, null: true, default: nil 
      t.string :upper_material, null: true, default: nil 
      t.string :deck_material, null: true, default: nil 
      t.string :frame_material, null: true, default: nil 
      t.string :heel_lift, null: true, default: nil 
      t.integer :max_load, null: true, default: nil 
      t.string :canopy, null: true, default: nil 
      t.string :rainfly, null: true, default: nil 
      t.string :add_warmth, null: true, default: nil 
      t.string :non_stick, null: true, default: nil 
      t.integer :blade_length, null: true, default: nil 
      t.string :multi_tool, null: true, default: nil 
      t.string :declination, null: true, default: nil 
      t.string :sighting_mirror, null: true, default: nil 
      t.string :global_needle, null: true, default: nil 
      t.string :red_light, null: true, default: nil 
      t.integer :max_output, null: true, default: nil 
      t.integer :max_distance, null: true, default: nil 
      t.integer :max_battery, null: true, default: nil 
      t.string :rechargeable, null: true, default: nil 
      t.boolean :is_api_searchable

      t.timestamps null: false
    end
    add_index :gears, :category_id
  end
end
