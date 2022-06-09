class CreateCourse < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string   :state_cd, limit: 2, default: "", null: false
      t.string   :course_name, limit: 100, default: "", null: false
      t.string   :course_domain, limit: 255, null: false
      t.boolean  :active, default: false, null: false
      t.boolean  :closed, default: false, null: false
      t.string   :country_code, limit: 255
      t.boolean  :marketing_page, default: false
      t.string   :actor, limit: 255, null: false
      t.timestamps
    end

    create_table :course_registration_details do |t|
      t.references  :course
      t.string   :name, limit: 255
      t.string   :question, limit: 255
      t.string   :template, limit: 255
      t.boolean  :required, default: false
      t.string   :validation_regex_required, limit: 255
      t.string   :validation_value_max, limit: 255
      t.string   :validation_value_min, limit: 255
      t.string   :format, limit: 255
      t.boolean  :is_sensitive, default: false
      t.integer  :order, limit: 4
      t.timestamps
    end

    create_table :course_registration_detail_values do |t|
      t.references :course_registration_detail, index: { name: 'crdv_on_crdid' }
      t.string :value, limit: 255
      t.timestamps
    end
  end
end
