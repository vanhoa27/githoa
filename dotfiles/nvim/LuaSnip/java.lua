return {
  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  require("luasnip").snippet(
    { trig = "sout" },
    { 
          t("System.out.println("),
          i(0),
          t(");"),
    }
  ),
}

