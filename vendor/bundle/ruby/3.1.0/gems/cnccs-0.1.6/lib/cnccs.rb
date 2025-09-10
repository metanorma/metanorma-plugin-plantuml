require "cnccs/version"
require "cnccs/ccs"

module Cnccs
  def self.fetch(code = nil, fieldcode: nil, groupcode: nil, subgroupcode: nil)
    Ccs.new code, fieldcode: fieldcode, groupcode: groupcode, subgroupcode: subgroupcode
  end
end
