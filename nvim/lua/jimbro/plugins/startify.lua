local lebowski = {

"             Aw, f*ck it, Dude. Let’s go bowling.         ",
"    \\____________   ___________________________________/  ",
"                 \\ |      @@@@@@*@@,@@@@@@@@*              ", 
"                  \\|   @@(%@@@@@##//@@ @@###@@             ",
"                      &@@**@@&@@@@@@&@.@@@/@ @.                ",
"                      (@#                   * &                ",
"                     .@@                     *@@               ",
"                     %/  @@@@@@@/   @@@@@@@, @#                ",
"                     ./ @@@@@@@@@  @@@@@@@@@@ @                ",
"                        @@@&&%%@    @@@@@@@@@                  ",
"                        /@...@        @ ,,(@                   ",
"                               @@(,@@                          ",
"                             @@@@.@@@@@                        ",
"                            @(        *@                         ",           
"                      @/  @     (@@.     @   @                 ",
"                       #@@*     (@@#      #@@                  ",
"                         @@@( .@@@@@@  .@@@#                   ",
"                           @@@@@@@@@@@@@@,                     ",
"                              @@@@@@@@(    ",
}

return {
  "mhinz/vim-startify",
  lazy = false,
  config = function()
    vim.g.startify_custom_header = lebowski
  end,
  keys = {
    { "<leader>es", "<cmd>Startify<cr>", desc = "Open startify" },
  },
}
