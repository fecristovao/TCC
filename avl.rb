require_relative './bst.rb'

class ArvoreBalanceada < ArvoreBinariaBusca
  def self.Balanceada?(no)
    return true if no.nil?
    return (ArvoreBinaria::Altura(no.esquerda) - ArvoreBinaria::Altura(no.direita)).abs <= 1 && ArvoreBalanceada::Balanceada?(no.esquerda) && ArvoreBalanceada::Balanceada?(no.direita)
  end

  def Balanceada?()
    ArvoreBalanceada::Balanceada?(@root)
  end
end
