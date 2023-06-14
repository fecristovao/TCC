require_relative './arvore_binaria.rb'
class ArvoreBinariaBusca < ArvoreBinaria
  def self.Inserir(no, id, info)
    if no.nil?
      return NoArvore.new(id, info)
    else
      if info < no.info
        no.esquerda = ArvoreBinariaBusca::Inserir(no.esquerda, id, info)
      else
        no.direita = ArvoreBinariaBusca::Inserir(no.direita, id, info)
      end
    end
    return no
  end

  def Inserir(info)
    if @root.nil?
      @root = ArvoreBinariaBusca::Inserir(@root, 0, info)
    else
      @root = ArvoreBinariaBusca::Inserir(@root, @size, info) if root != nil
    end
    @size += 1
  end
end


