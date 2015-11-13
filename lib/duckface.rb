require "duckface/version"

class Duckface
  
  def initialize(&block)
  	@conditions = []
  	instance_eval(&block) if block_given?
  end

  def describes?(obj)
    @conditions.each do |condition|
      return false unless condition.first ^ obj.send(condition[1], *condition.last)
    end
    return true
  end

protected

  def respond_to(name)
    @conditions << [false, :respond_to?, [name]]
  end

  def not_respond_to(name)
    @conditions << [true, :respond_to?, [name]]
  end

  def is_a(name)
    @conditions << [false, :is_a?, [name]]
  end

  def not_a(name)
    @conditions << [true, :is_a?, [name]]
  end

end

require "duckface/interface"
