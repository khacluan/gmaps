require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class GmapsGenerator < ActiveRecord::Generators::Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      source_root File.expand_path("../templates", __FILE__)

       def copy_gmaps_migration
         migration_template "migration.rb", "db/migrate/gmaps_add_columns_to_#{table_name}.rb"
       end
    end
  end
end
