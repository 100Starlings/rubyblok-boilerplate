class CreateRubyblokPageObjects < ActiveRecord::Migration[7.1]
  def change
    create_table :page_objects do |t|
      t.string :storyblok_story_id
      t.string :storyblok_story_slug
      t.string :storyblok_story_content

      t.timestamps
    end

    add_index :page_objects, :storyblok_story_slug, unique: true
  end
end
