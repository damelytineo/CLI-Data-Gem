require_relative "./flu_vaccination/version"
require 'pry'
require 'httparty'
require_relative './flu_vaccination'
require_relative './cli'
require_relative './api'

module FluVaccination
  class Error < StandardError; end
  # Your code goes here...
end
