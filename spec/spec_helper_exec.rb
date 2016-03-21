require 'serverspec'

set :backend, :exec

module SpecHelper
  def create_file(filename, content)
      File.write(filename, content)
  end

  def delete_file(*filenames)
    File.delete(*filenames)
  end
end
