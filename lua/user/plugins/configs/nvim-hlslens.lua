local present, hlslens = pcall(require, 'hlslens')

if not present then
  print("hlslens not yet installed!")
  return
end

hlslens.setup()
