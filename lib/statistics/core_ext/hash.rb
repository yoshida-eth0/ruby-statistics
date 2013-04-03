require 'statistics/core_ext/hash/classifiers'
require 'statistics/core_ext/hash/categorizers'
require 'statistics/core_ext/hash/correlation_ratio'
require 'statistics/core_ext/hash/cross'

class Hash
  include Statistics::CoreExt::Hash::Classifiers
  include Statistics::CoreExt::Hash::Categorizers
  include Statistics::CoreExt::Hash::CorrelationRatio
  include Statistics::CoreExt::Hash::Cross
end
