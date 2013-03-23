require 'statistics/core_ext/array/classifiers'
require 'statistics/core_ext/array/categorizers'
require 'statistics/core_ext/array/numeric'
require 'statistics/core_ext/array/normal_distribution'
require 'statistics/core_ext/array/correlation_coefficient'
require 'statistics/core_ext/array/correlation_ratio'

class Array
  include Statistics::CoreExt::Array::Classifiers
  include Statistics::CoreExt::Array::Categorizers
  include Statistics::CoreExt::Array::Numeric
  include Statistics::CoreExt::Array::NormalDistribution
  include Statistics::CoreExt::Array::CorrelationCoefficient
  include Statistics::CoreExt::Array::CorrelationRatio
end
