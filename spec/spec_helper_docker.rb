require 'serverspec'

set :backend, :docker
set :docker_url, ENV['DOCKER_HOST']
set :docker_container, ENV['TARGET_HOST']

module Specinfra
  module Backend
    class Docker
      alias :__send_file__ :send_file
      def send_file(from, to)
        if @container && @base_image.nil?
          # This needs Docker >= 1.8
          @container.archive_in(from, to)
        else
          __send_file__(from, to)
        end
      end
      private :__send_file__
    end
  end
end

module SpecHelper
  def create_file(filename, content)
      File.write(filename, content)
      Specinfra::Runner.send_file(filename, './')
      File.delete(filename)
  end

  def delete_file(*filename)
    Specinfra::Runner.run_command("rm #{filename.join(' ')}")
  end
end
