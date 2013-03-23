require 'statistics/core_ext/hash/classifiers'
require 'statistics/core_ext/hash/categorizers'
require 'statistics/core_ext/hash/correlation_ratio'

class Hash
  include Statistics::CoreExt::Hash::Classifiers
  include Statistics::CoreExt::Hash::Categorizers
  include Statistics::CoreExt::Hash::CorrelationRatio
end
