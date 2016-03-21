require 'serverspec'

set :backend, :docker
set :docker_url, ENV['DOCKER_HOST']
set :docker_container, ENV['TARGET_HOST']

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
