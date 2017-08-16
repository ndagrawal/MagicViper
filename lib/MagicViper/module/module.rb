require 'tempfile'

module MagicViper
  class Module < Thor
    include Thor::Actions

    BASE_PATH = 'Classes/Modules'

    FILES_OBJC = {
      'DataManager.h'     => 'DataManager',
      'DataManager.m'     => 'DataManager',
      'Interactor.h'      => 'Interactor',
      'Interactor.m'      => 'Interactor',
      'ModuleInterface.h' => 'ModuleInterface',
      'Presenter.h'       => 'Presenter',
      'Presenter.m'       => 'Presenter',
      'ViewInterface.h'   => 'View',
      'ViewController.h'  => 'View',
      'ViewController.m'  => 'View',
      'Wireframe.h'       => 'Wireframe',
      'Wireframe.m'       => 'Wireframe'
    }


    MagicViper::Module.source_root(File.dirname(__FILE__))

    desc 'list', 'lists available VIPER modules'
    def list
      return unless File.exists? BASE_PATH

      module_names = Dir.entries(BASE_PATH).reject { |d| d == '.' || d == '..' }
      print_table module_names.map.with_index { |m, i| [i+1, m] }
    end

    desc 'create NAME', 'adds a new VIPER module with the specified name'
    def create(module_name)
      config = invoke(:configure, [])

      @module          = module_name
      @prefixed_module = config[:class_prefix] + @module
      @project         = config[:project]
      @author          = config[:author]
      @date            = Time.now.strftime('%d/%m/%y')
      lang             = config[:language]

      # copying template files
      files = case lang
              when 'objc'  then FILES_OBJC
              end
      files.each do |file_name, folder|
        template "templates/#{lang}/#{file_name}", "#{BASE_PATH}/#{@module}/#{folder}/#{@prefixed_module}#{file_name}"
      end

      # rendering dependencies head
      path = Dir::Tmpname.create('dep') { |path| path }
      case lang
      when 'objc'  then template('templates/objc/DependenciesHead.m', path)
      end

      say "\nAdd these lines to the AppDependencies imports:\n\n", :green
      say File.open(path).read + "\n", :yellow

      # rendering dependencies body
      path = Dir::Tmpname.create('dep') { |path| path }
      case lang
      when 'objc'  then template('templates/objc/DependenciesBody.m', path)
      end

      say "\nAdd these lines to the AppDependencies#configureDependencies:\n\n", :green
      say File.open(path).read + "\n", :yellow
    end

    desc 'destroy NAME', 'destroys VIPER module with the specified name'
    def destroy(module_name)
      @module = module_name

      module_path = "#{BASE_PATH}/#{@module}"

      if File.exists? module_path
        remove_dir module_path if yes?("Really destroy module: #{@module}? [y/N]")
      else
        say "No such module: #{@module}"
      end
    end

    # ----
    # configuration
    CONFIG_FILE = '.MagicViper.yml'

    desc 'configure', 'configures project properties'
    def configure
      config = File.exists?(CONFIG_FILE) ? YAML.load_file(CONFIG_FILE) : {}

      project      = ask("Project name [#{config[:project]}] ?")
      language     = ask("Project language [#{config[:language]}] ?", :limited_to => ["objc", "swift", ""])
      class_prefix = ask("Class prefix [#{config[:class_prefix]}] ?")
      author       = ask("Author [#{config[:author]}] ?")

      config[:project]      = project.empty?      ? config[:project] || ''      : project
      config[:language]     = language.empty?     ? config[:language] || 'objc' : language
      config[:class_prefix] = class_prefix.empty? ? config[:class_prefix] || '' : class_prefix
      config[:author]       = author.empty?       ? config[:author] || ''       : author

      File.open(CONFIG_FILE, 'w') do |f|
        f.write config.to_yaml
      end

      config
    end
  end
end
