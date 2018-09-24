p = Proc.new {|x| puts x.upcase }
%w{ David Black }.each(&p)
