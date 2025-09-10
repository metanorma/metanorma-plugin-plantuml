require 'spec_helper'

RSpec.describe Plane1Converter do
  it "aborts on illegal font shift" do
    begin
      expect { Plane1Converter.conv("ABC", :hello) }.to raise_error(StandardError)
    rescue StandardError
    end
  end

  it "converts strings" do
    expect(Plane1Converter.conv("Plane1Μεταβλητής", :fraktur)).to eq("𝔓𝔩𝔞𝔫𝔢1Μεταβλητής")
    expect(Plane1Converter.conv("Plane1Μεταβλητής", :frakturbold)).to eq("𝕻𝖑𝖆𝖓𝖊1Μεταβλητής")
    expect(Plane1Converter.conv("Plane1Μεταβλητής", :monospace)).to eq("𝙿𝚕𝚊𝚗𝚎𝟷Μεταβλητής")
    expect(Plane1Converter.conv("Plane1Μεταβλητής", :doublestruck)).to eq("ℙ𝕝𝕒𝕟𝕖𝟙Μεταβλητής")
    expect(Plane1Converter.conv("Plane1Μεταβλητής", :script)).to eq("𝒫𝓁𝒶𝓃ℯ1Μεταβλητής")
    expect(Plane1Converter.conv("Plane1Μεταβλητής", :scriptbold)).to eq("𝓟𝓵𝓪𝓷𝓮1Μεταβλητής")
    expect(Plane1Converter.conv("Plane1Μεταβλητής", :circled)).to eq("Ⓟⓛⓐⓝⓔ①Μεταβλητής")
    expect(Plane1Converter.conv("Plane1Μεταβλητής", :circledblack)).to eq("🅟🅛🅐🅝🅔❶Μεταβλητής")
    expect(Plane1Converter.conv("Plane1Μεταβλητής", :squared)).to eq("🄿🄻🄰🄽🄴1Μεταβλητής")
    expect(Plane1Converter.conv("Plane1Μεταβλητής", :squaredblack)).to eq("🅿🅻🅰🅽🅴1Μεταβλητής")
    expect(Plane1Converter.conv("Plane1Μεταβλητής", :serifbold)).to eq("𝐏𝐥𝐚𝐧𝐞𝟏𝚳𝛆𝛕𝛂𝛃𝛌𝛈𝛕ή𝛓")
    expect(Plane1Converter.conv("Plane1Μεταβλητής", :serifitalic)).to eq("𝑃𝑙𝑎𝑛𝑒1𝛭𝜀𝜏𝛼𝛽𝜆𝜂𝜏ή𝜍")
    expect(Plane1Converter.conv("Plane1Μεταβλητής", :serifbolditalic)).to eq("𝑷𝒍𝒂𝒏𝒆1𝜧𝜺𝝉𝜶𝜷𝝀𝜼𝝉ή𝝇")
    expect(Plane1Converter.conv("Plane1Μεταβλητής", :sans)).to eq("𝖯𝗅𝖺𝗇𝖾𝟣Μεταβλητής")
    expect(Plane1Converter.conv("Plane1Μεταβλητής", :sansbold)).to eq("𝗣𝗹𝗮𝗻𝗲𝟭𝝡𝝴𝞃𝝰𝝱𝝺𝝶𝞃ή𝞁")
    expect(Plane1Converter.conv("Plane1Μεταβλητής", :sansitalic)).to eq("𝘗𝘭𝘢𝘯𝘦1Μεταβλητής")
    expect(Plane1Converter.conv("Plane1Μεταβλητής", :sansbolditalic)).to eq("𝙋𝙡𝙖𝙣𝙚1𝞛𝞮𝞽𝞪𝞫𝞴𝞰𝞽ή𝞻")
  end
end
