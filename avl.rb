require_relative './bst.rb'

class ArvoreBalanceada < ArvoreBinariaBusca
  def self.Balanceada?(no)
    return true if no.nil?
    return (ArvoreBinaria::Altura(no.esquerda) - ArvoreBinaria::Altura(no.direita)).abs <= 1 && ArvoreBalanceada::Balanceada?(no.esquerda) && ArvoreBalanceada::Balanceada?(no.direita)
  end

  def Balanceada?()
    ArvoreBalanceada::BalenceadaOtimizado(@root) != false
  end

  # Enquanto não retornar false, vai somando 1 a cada nivel e pegando o maior ja contado
  def self.BalenceadaOtimizado(no)
    return 0 if no.nil?
    esquerda, direita = ArvoreBalanceada::BalenceadaOtimizado(no.esquerda), ArvoreBalanceada::BalenceadaOtimizado(no.direita)
    return false if esquerda == false || direita == false
    return false if (esquerda - direita).abs > 1
    1 + [esquerda, direita].max
  end
end

