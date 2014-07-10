require_relative 'define/source'

module Define

  autoload :Source, 'define/source'

  if defined?(Motion::Project::Config)
    Motion::Project::App.setup do |app|
      Dir.glob(File.join(File.dirname(__FILE__), 'foo/*.rb')).each do |file|
        app.files.unshift(file)
      end
    end
  end

end