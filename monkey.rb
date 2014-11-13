require "feedjira"
require "jsonable"

module Feedjira
  module Parser
    class Atom
      include Jsonable
    end

    class AtomEntry
      include Jsonable
    end
  end
end
