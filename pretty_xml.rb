require "nokogiri"

class PrettyXML
  XSLT_PATH   = File.join(".", "files", "pretty_xml.xslt")
  XSLT_FILE   = File.open(XSLT_PATH, "r")
  TRANSFORMER = Nokogiri::XSLT(XSLT_FILE)

  def self.to_pretty_xml(xml)
    parsed_xml = Nokogiri::XML(xml)

    TRANSFORMER.transform(parsed_xml).to_xml
  end
end
