return{
  -- root_dir = vim.fs.dirname(vim.fs.find({"CMakeLists.txt"})),
  -- root_dir = vim.fs.root(0, {"CMakeLists.txt"}),
  cmd = {
      vim.fn.stdpath("data") .. "/mason/bin/clangd",
      -- "--query-driver= /root/itop/rk3588-linux/buildroot/output/rockchip_rk3588/host/bin/aarch64-linux-g++",
  },
  -- root_dir = vim.fs.root(0, {"CMakeLists.txt","compile_commands.json"}),
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
}
