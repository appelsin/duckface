class Duckface::Interface
  def self.duckface
    @duckface||= ::Duckface.new
  end

  def self.describes?(obj)
    duckface.describes? obj
  end

  def self.respond_to(name)
    duckface.send :respond_to, name
  end

  def self.not_respond_to(name)
    duckface.send :not_respond_to, name
  end

  def self.is_a(name)
    duckface.send :is_a, name
  end

  def self.not_a(name)
    duckface.send :not_a, name
  end

end