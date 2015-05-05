require "rulers/version"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, ['']]
      elsif env['PATH_INFO'] == '/'
        return [200, {'Content-Type' => 'text/html'}, [home_file]]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        controller
        text = controller.send(act)
      rescue
        return ['500', { 'Content-Type' => 'text/html' }, ["<h1> Rescued big error</h1>"]]
      end
      ['200', { 'Content-Type' => 'text/html' }, [text]] 
    end

    private

    def home_file
      "#{index}"
    end

    def index
      path = File.join(File.dirname(__FILE__), 'public', 'index.html')
      file = File.open(path)
      contents = file.read
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
