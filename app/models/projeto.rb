class Projeto < ActiveRecord::Base

  belongs_to :profissional, :dependent => :destroy
  
  # Um projeto possui muitas elaborações
  has_many :elaboracaos, :dependent => :destroy
  has_many :elaboracaos_projetos, :through => :elaboracaos, :source => :projeto

  attr_accessible :descricao, :nome, :validade_anos, :valor

  validates_presence_of :descricao, :nome, :validade_anos, :valor

  validates_length_of :nome, :maximum => 255, :allow_blank => false
  validates_uniqueness_of :nome

  validates_length_of :validade_anos, :is => 1, :allow_blank => false
  validates_numericality_of :validade_anos, :only_integer => true, :allow_nil => false

  validates_numericality_of :valor, :only_float => true, :allow_nil => false

  validates_length_of :descricao, :minimum => 50, :allow_blank => false

end