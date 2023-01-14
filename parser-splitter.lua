local q = require "vim.treesitter.query"

local function i(value)
    print(vim.inspect(value))
end

local log = function(message)
    local log_file_path = './logs/teoremi-spaced.tex'
    local log_file = io.open(log_file_path, "a")
    io.output(log_file)
    io.write(message .. "\n")
    io.close(log_file)
end

local bufnr = 127

local language_tree = vim.treesitter.get_parser(bufnr, 'latex')
local syntax_tree = language_tree:parse()
local root = syntax_tree[1]:root()

local query = vim.treesitter.parse_query('latex', [[
(generic_command
  ((command_name) @ciao (#eq? @ciao "\\teorema"))) @teorema
(generic_environment 
  (begin 
    (curly_group_text 
      (text) @ciao (#eq? @ciao "proof")))) @dimostrazione
]])

for _, captures, metadata in query:iter_matches(root, bufnr) do
    if q.get_node_text(captures[1], bufnr) == "\\teorema" then
        log(q.get_node_text(captures[2], bufnr))
    else
        log(q.get_node_text(captures[3], bufnr))
        log("\\newpage")
    end
end
