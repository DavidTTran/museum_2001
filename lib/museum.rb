class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.find_all { |exhibit| patron.interests.include? (exhibit.name) }
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    @exhibits.reduce({}) do |acc, exhibit|
      acc[exhibit] = @patrons.find_all {|patron| patron.interests.include?(exhibit.name)}
      acc
    end
  end

  def ticket_lottery_contestants(exhibit)
    @patrons.find_all do |patron|
      (patron.interests.include?(exhibit.name) && patron.spending_money <= exhibit.cost)
    end
  end

  def draw_lottery_winner(exhibit)
    if exhibit.cost != 0
      winner = ticket_lottery_contestants(exhibit).sample
    else
      nil
    end
    winner
  end

  def announce_lottery_winner(exhibit)
    # require "pry"; binding.pry
    p "#{draw_lottery_winner(exhibit).name} has won the #{exhibit.name} exhibit lottery"
  end
end
