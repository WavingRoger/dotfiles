local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("c", {

  -- Standard main
  s("main", fmt([[
        int main(int argc, char *argv[]) {{
            {}
            return 0;
        }}
    ]], { i(1, "// code here") })),

  -- Embedded style main loop
  s("mainloop", fmt([[
        int main(void) {{
            {}
            while (1) {{
                {}
            }}
            return 0;
        }}
    ]], { i(1, "// init code"), i(2, "// loop code") })),

  -- Quick printf
  s("pf", fmt([[printf("{}\n", {});]], { i(1, "message"), i(2) })),

  -- Debug print
  s("debug", fmt([[printf("[DEBUG] {}: %d\n", {});]], { i(1, "var"), rep(1) })),

  -- Include standard header
  s("inc", fmt([[#include <{}>]], { i(1, "stdio.h") })),

  -- Include with quotes
  s("inq", fmt([[#include "{}"]], { i(1, "myheader.h") })),

  -- Multiple common includes
  s("incstd", t({
    "#include <stdio.h>",
    "#include <stdlib.h>",
    "#include <stdint.h>",
    "#include <stdbool.h>",
    ""
  })),

  -- Function definition
  s("func", fmt([[
        {} {}({}) {{
            {}
        }}
    ]], { i(1, "void"), i(2, "functionName"), i(3, "void"), i(4, "// body") })),

  -- For loop
  s("fori", fmt([[
        for (int {} = 0; {} < {}; {}++) {{
            {}
        }}
    ]], { i(1, "i"), rep(1), i(2, "n"), rep(1), i(3, "// loop body") })),

  -- While loop
  s("while", fmt([[
        while ({}) {{
            {}
        }}
    ]], { i(1, "condition"), i(2, "// code") })),

  -- If statement
  s("if", fmt([[
        if ({}) {{
            {}
        }}
    ]], { i(1, "condition"), i(2, "// code") })),

  -- Else-if ladder
  s("ife", fmt([[
        if ({}) {{
            {}
        }} else if ({}) {{
            {}
        }} else {{
            {}
        }}
    ]], { i(1, "cond1"), i(2, "// code1"), i(3, "cond2"), i(4, "// code2"), i(5, "// else code") })),

  -- Struct typedef
  s("struct", fmt([[
        typedef struct {{
            {}
        }} {};
    ]], { i(1, "int field;"), i(2, "StructName") })),

  -- Enum typedef
  s("enum", fmt([[
        typedef enum {{
            {},
        }} {};
    ]], { i(1, "STATE_IDLE"), i(2, "State") })),

  -- Header guard
  s("guard", fmt([[
        #ifndef {}
        #define {}

        {}

        #endif // {}
    ]], { i(1, "HEADER_H"), rep(1), i(2, "// declarations"), rep(1) })),

  -- Switch case
  s("switch", fmt([[
        switch ({}) {{
            case {}:
                {};
                break;
            default:
                {};
                break;
        }}
    ]], { i(1, "var"), i(2, "CASE1"), i(3, "// code"), i(4, "// default code") })),

})
