module Gmaps
  module Generators
    class GmapsGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers

      namespace "gmaps"
      source_root File.expand_path("../templates", __FILE__)

      desc "Generates Gmaps attributes for a model given its NAME."

      hook_for :orm
    end
  end
end
