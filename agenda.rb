@agenda = [
  {nome: "Henrique Dantas", telefone: "992852372"},
  {nome: "Emanuelle Dantas", telefone: "992787171"},
  {nome: "Ana Maria Ferreira Dantas", telefone: "992674396"}
]

def todos_contatos
  @agenda.each do |contato|
    puts "#{contato[:nome]} - #{contato[:telefone]}"
  end
  puts "-------------------------------------------"
end

def adicionar_contato
  print "Nome: "
  nome = gets.chomp
  print "Telefone: "
  telefone = gets.chomp
  @agenda << {nome: nome, telefone: telefone}
  puts "-------------------------------------------"
end

def ver_contato
  print "Qual o nome você deseja pesquisar? "
  nome = gets.chomp
  @agenda.each do |contato|
    if contato[:nome].downcase.include?(nome.downcase)
      puts "#{contato[:nome]} - #{contato[:telefone]}"
    end
  end
  puts "-------------------------------------------"
end

def remover_contato
  print "Qual contato você deseja remover? "
  nome = gets.chomp
  @agenda.each do |contato|
    if contato[:nome].downcase == (nome.downcase)
    indice = @agenda.index(contato)
    @agenda.delete_at(indice)
    break
    end
  end
  puts "-------------------------------------------"
end

def editar_contato
  print "Qual contato você deseja editar? "
  nome = gets.chomp
  @agenda.each do |contato|
    if contato[:nome].downcase == (nome.downcase)
      print "Nome para editar (Se quiser manter o mesmo nome, aperte enter.): "
      nome_salvo = contato[:nome]

      contato[:nome] = gets.chomp
      contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome]

      print "Telefone para editar (Se quiser manter o mesmo telefone, aperte enter.): "
      telefone_salvo = contato[:telefone]

      contato[:telefone] = gets.chomp
      contato[:telefone] = contato[:telefone].empty? ? telefone_salvo : contato[:telefone]
    end
  end
  puts "-------------------------------------------"
end

loop do
  puts "1. Contatos\n2. Adicionar Contato\n3. Ver Contato\n4. Editar Contato\n5. Remover Contato\n0. Sair"
  codigo = gets.chomp.to_i

  case
  when codigo == 0
    puts "Até mais!"
    break
  when codigo == 1
    todos_contatos

  when codigo == 2
    adicionar_contato

  when codigo == 3
    ver_contato

  when codigo == 4
    editar_contato

  when codigo == 5
    remover_contato
  else
    puts "Função inválida! Tente novamente."
  end
end
