require 'statistics/core_ext/hash/classifiers'
require 'statistics/core_ext/hash/categorizers'

class Hash
  include Statistics::CoreExt::Hash::Classifiers
  include Statistics::CoreExt::Hash::Categorizers
end
