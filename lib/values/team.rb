require_relative 'position'

class Team < Struct.new(:name, :logo_path, :score, :lead_jammer, :positions)
  def self.from_node(node)
    name = node.at_xpath('Name').content
    logo_path = node.at_xpath('Logo').content
    score = node.at_xpath('Score').content
    lead_jammer = node.at_xpath('LeadJammer').content == 'true'
    positions = node.xpath('Position').map do |position|
      Position.from_node(position)
    end

    new(name, logo_path, score, lead_jammer, positions)
  end
end
