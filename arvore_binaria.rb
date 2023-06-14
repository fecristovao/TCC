class NoArvore
  attr_accessor :info, :esquerda, :direita, :id

  def initialize(id = nil, info = nil)
    @esquerda = nil
    @direita = nil
    @id = id
    @info = info
  end
end

class ArvoreBinaria
  attr_reader :root

  def initialize()
    @root = nil
    @size = 0
  end

  # Generic

  def self.Inserir(no, id, info)
    if no.nil?
      novoNo = NoArvore.new(id, info)
      return novoNo
    else
      if no.esquerda.nil?
        no.esquerda = ArvoreBinaria::Inserir(no.esquerda, id, info)
      else
        no.direita = ArvoreBinaria::Inserir(no.direita, id, info)
      end
    end
    return no
  end

  def self.ImprimirPreOrdem(no)
    if no != nil
      puts no.info
      ImprimirPreOrdem(no.esquerda)
      ImprimirPreOrdem(no.direita)
    end
  end

  def self.ImprimirEmOrdem(no)
    if no != nil
      ImprimirPreOrdem(no.esquerda)
      puts no.info
      ImprimirPreOrdem(no.direita)
    end
  end

  def self.ImprimirPosOrdem(no)
    if no != nil
      ImprimirPreOrdem(no.esquerda)
      ImprimirPreOrdem(no.direita)
      puts no.info
    end
  end

  def self.Altura(no)
    return 0 if no.nil?
    he = Altura(no.esquerda)
    hd = Altura(no.direita)

    return 1 + hd if hd >= he
    return 1 + he if he > hd
  end

  def self.ImprimirNivel(no, nivelAtual = 0, nivelDesejado)
    if no != nil
      if nivelAtual == nivelDesejado
        print "#{no.info}\t"
      else
        ArvoreBinaria::ImprimirNivel(no.esquerda, nivelAtual + 1, nivelDesejado)
        ArvoreBinaria::ImprimirNivel(no.direita, nivelAtual + 1, nivelDesejado)
      end
    end
  end

  def self.Serialize(no)
    if no.nil?
      return [nil]
    else
      return [{id: no.id, info: no.info}] + ArvoreBinaria::Serialize(no.esquerda) + ArvoreBinaria::Serialize(no.direita)
    end
  end

  def self.Deserialize(raiz, listaDeNos)
    listaDeNos.each do |no|
      raiz = ArvoreBinaria::Inserir(raiz, no["id"], no["info"]) if !no.nil?
    end
    return raiz
  end

  def self.ConstruirArvore(strArv, pos = 0)
    raise StandardError.new "Sintaxe de Arvore Invalida" if strArv[pos] != '('
    pos += 1

    strNum = ""
    if strArv[pos] == '-'
      strNum += "-"
      pos += 1
    end

    while '0' <= strArv[pos] && strArv[pos] <= '9'
      strNum += strArv[pos]
      pos += 1
    end

    num = strNum.to_i


  end

  # Arvore Functions

  def ConstruirArvore(strArv)

  end

  def Inserir(info)
      if @root.nil?
        @root = ArvoreBinaria::Inserir(@root, 0, info)
      else
        @root = ArvoreBinaria::Inserir(@root, @size, info) if root != nil
      end
      @size += 1
  end

  def Serialize()
    ArvoreBinaria::Serialize(@root)
  end

  def Deserialize(listaDeNos)
    @root = ArvoreBinaria::Deserialize(@root, listaDeNos)
  end

  def Altura()
    ArvoreBinaria::Altura(@root)
  end

  def ImprimirEmLargura()
    altura = Altura()
    for i in 0..altura-1
      ArvoreBinaria::ImprimirNivel(@root, 0, i)
      puts ""
    end
  end

  def ImprimirPreOrdem()
    ArvoreBinaria::ImprimirPreOrdem(@root)
  end

  def ImprimirEmOrdem()
    ArvoreBinaria::ImprimirEmOrdem(@root)
  end

  def ImprimirPosOrdem()
    ArvoreBinaria::ImprimirPosOrdem(@root)
  end
end

