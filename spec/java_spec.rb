require 'specinfra'
require "spec_helper_#{ENV['SPEC_TARGET_BACKEND']}"
require 'brewcask_patch'
include SpecHelper

describe command('which java') do
  its(:exit_status) { should eq 0 }
end

describe command('which javac') do
  its(:exit_status) { should eq 0 }
end

describe command('javac ./Test.java && java Test') do
  before(:each) do
    SpecHelper.create_file('Test.java', 'class Test {public static void main(String[] args){System.out.println("Hello");}}')
  end

  its(:stdout) { should contain('Hello') }

  after(:all) do
    SpecHelper.delete_file('Test.java', 'Test.class')
  end
end
