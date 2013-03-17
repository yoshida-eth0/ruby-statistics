require 'statistics/core_ext/array/classifiers'
require 'statistics/core_ext/array/categorizers'
require 'statistics/core_ext/array/numeric'

class Array
  include Statistics::CoreExt::Array::Classifiers
  include Statistics::CoreExt::Array::Categorizers
  include Statistics::CoreExt::Array::Numeric
end
