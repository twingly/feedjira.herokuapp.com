require "feedjira"
require "jsonable"

Feedjira::Parser.constants.each do |constant|
  Feedjira::Parser.const_get(constant).class_exec { include Jsonable }
end
