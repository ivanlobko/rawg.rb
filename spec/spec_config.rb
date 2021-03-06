# frozen_string_literal: true

require 'rspec'
require 'faker'
require 'factory_bot'
require 'webmock/rspec'
require 'rawg'

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end

RSpec::Matchers.define :have_attr_accessor do |field|
  match do |object_instance|
    object_instance.respond_to?(field) &&
      object_instance.respond_to?("#{field}=")
  end

  failure_message do |object_instance|
    "expected #{object_instance} to have attr_accessor :#{field}"
  end

  failure_message_when_negated do |object_instance|
    "expected #{object_instance} not to have attr_accessor :#{field}"
  end

  description do
    "have attr_accessor :#{field}"
  end
end

RSpec::Matchers.define :have_attr_reader do |field|
  match do |object_instance|
    object_instance.respond_to?(field)
  end

  failure_message do |object_instance|
    "expected #{object_instance} to have attr_reader :#{field}"
  end

  failure_message_when_negated do |object_instance|
    "expected #{object_instance} not to have attr_reader :#{field}"
  end

  description do
    "have attr_reader :#{field}"
  end
end
