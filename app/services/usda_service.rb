class UsdaService
  def initialize(filter = {})
    @filter = filter
  end

  def self.ndb_search(filter = {})
    new(filter).ndb_search
  end

  def ndb_search
    get_json("/ndb/search")
  end

  private
  attr_reader :filter

  def get_json(url)
    response = conn.get(url, default_filter.merge(filter))
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.nal.usda.gov")
  end

  def default_filter
    {
      format: "json",
      sort: "r",
      max: 10,
      api_key: ENV['usda_api_key']
    }
  end
end
