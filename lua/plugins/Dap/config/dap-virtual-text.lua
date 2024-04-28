local status_ok,dap_vtext = pcall(require,"nvim-dap-virtual-text")
if not status_ok then
  print("there is something wrong with the nvim-dap-virtual-text")
  return 
end


dap_vtext.setup(
  {
    commented = true
  }
)
