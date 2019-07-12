class Food
  attr_reader :ndb, :name, :group, :data_source, :manufacturer

  def initialize(attrs = {})
    @ndb = attrs[:ndbno]
    @name = attrs[:name]
    @group = attrs[:group]
    @data_source = attrs[:ds]
    @manufacturer = attrs[:manu]
  end
end
