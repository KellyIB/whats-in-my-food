class FoodSearchFacade
  attr_reader :search_term

  def initialize(search_term)
    @search_term = search_term
  end

  def search_results_count
    data[:list][:total]
  end

  def search_results
    data[:list][:item].map do |food_data|
      Food.new(food_data)
    end
  end

  private

  def data
    @data ||= UsdaService.ndb_search(q: search_term)
  end

end

