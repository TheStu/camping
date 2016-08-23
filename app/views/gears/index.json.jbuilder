json.array!(@gears) do |gear|
  json.extract! gear, :id, :category_id, :name, :weight, :shape, :quilt, :min_temp, :hood, :insulation, :season, :gear_type, :capacity, :hip_strap, :frame, :access, :length, :thickness, :r_value, :waterproof, :bug_proof, :life_time, :fixed_length, :staff, :poncho, :gender, :material, :upper_material, :deck_material, :frame_material, :heel_lift, :max_load, :canopy, :rainfly, :add_warmth, :non_stick, :blade_length, :multi_tool, :declination, :sighting_mirror, :global_needle, :red_light, :max_output, :max_distance, :max_battery, :rechargeable, :is_api_searchable
  json.url gear_url(gear, format: :json)
end
