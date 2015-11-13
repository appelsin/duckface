$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'duckface'

module Animal
end

module Flying
end

class Bird
  include Animal
  include Flying
end

class Duck < Bird
  def quack; 'krya' end
end

class Dove < Bird
  def coo; 'coo' end
end

class Mandarin < Duck
  def orange?; true end
end

class Dog
  include Animal
  def bark; 'bark-bark-bark' end
end