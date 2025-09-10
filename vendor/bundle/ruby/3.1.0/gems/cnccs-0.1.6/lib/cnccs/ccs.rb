require "csv"

module Cnccs
  class Note

    # @return [String]
    attr_reader :text, :ccs_code

    # @param text [String]
    # @param ccs_code [String]
    def initialize(text, ccs_code)
      @text     = text
      @ccs_code = ccs_code
    end

    # Fetch ccs reference by code.
    # @return [Cnccs::Ccs]
    def ccs
      Ccs.new @ccs_code
    end
  end

  class Ccs 

    # @return [String]
    attr_reader :code, :fieldcode, :groupcode, :subgroupcode, :description, :description_full
    
    # @return [Array<Cnccs::Note>]
    attr_reader :notes

    # @param code [String]
    # @param fieldcode [String]
    # @param groupcode [String]
    # @param subgroupcode [String]
    def initialize(code = nil, fieldcode: nil, groupcode: nil, subgroupcode: nil)
      if code
        case code.size
        when 1 then fetch_field code
        when 3 then fetch_subgroup code
        end
      elsif fieldcode && groupcode
        @code, @description, @fieldcode, nts = fetch_data(2, fieldcode + groupcode)
        @groupcode = @code[1..-1]
        @notes = fetch_notes nts
        _fldc, desc = fetch_data(1, @fieldcode)
        @description_full = "#{desc}; #{@description}"
      elsif fieldcode
        fetch_field fieldcode
      elsif subgroupcode
        fetch_subgroup subgroupcode
      end    
    end

    private

    # Fetch data by field code.
    # @param field_code [String]
    def fetch_field(field_code)
      @code = field_code
      @fieldcode, @description = fetch_data(1, field_code)
      @notes = []
    end

    # Fetch data by subgroup code.
    # @param subgroup_code [String]
    def fetch_subgroup(subgroup_code)
      @code, @description, sg_code, nts = fetch_data(3, subgroup_code)
      @fieldcode    = @code.slice 0
      @groupcode    = sg_code[1..-1]
      @subgroupcode = @code[1..-1]
      @notes        = fetch_notes nts
      _fldc, desc1 = fetch_data(1, @fieldcode)
      _fldc, desc2 = fetch_data(2, sg_code)
      @description_full = "#{desc1}; #{desc2}; #{@description}"
    end

    # Read data from file.
    # @param level [Integer]
    # @param match [String]
    # @return [Array<String, Array>]
    def fetch_data(level, match)
      csv = CSV.read "#{__dir__}/../../cn-ccs-codes/cat-level#{level}.csv", encoding: "UTF-8", headers: true
      row = csv.find { |r| r[0] == match }
      row.map(&:last)
    end

    # Fetch notes.
    # @param nts [String]
    # @return [Array<Cnccs::Note>]
    def fetch_notes(nts)
      return if nts.nil?
      splitter = [227, 128, 130].pack('c*').force_encoding("UTF-8")
      rgxp = /[A-Z]\d{2}(\/\d{2})?$/
      nts.split(splitter).map do |n|
        ccs_code = n.match(rgxp).to_s
        text = n.sub(rgxp, "{ccs-code}")
        Note.new text, ccs_code
      end
    end
  end
end
