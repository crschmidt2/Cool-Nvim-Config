return {
{
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  opts = {}
},
{
  'windwp/nvim-ts-autotag',
  --Lazy loading not recommended by author (why though)
  lazy = false,
  config = true,
}
}
