
-- Place this in ${HOME}/.config/nvim/LuaSnip/all.lua
return {
  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  require("luasnip").snippet(
    { trig = "hi" },
    { t("Hello, world!") }
  ),

require("luasnip").snippet(
        "cmake", {
	t({"cmake_minimum_required(VERSION 3.10)"}),
	t({"", "project(MyProject)"}),
	t({"", "set(CMAKE_CXX_STANDARD 17)"}),
	t({"", "set(CMAKE_CXX_STANDARD_REQUIRED True)"}),
	t({"", "set(CMAKE_CXX_FLAGS \"${CMAKE_CXX_FLAGS} -Wall -Wextra -pedantic -g\")"}),
	t({"", "include_directories(include)"}),
	t({"", "file(GLOB SOURCES \"src/*.cpp\")"}),
	t({"", "add_executable(MyProject ${SOURCES})"}), i(0),
}),

  -- To return multiple snippets, use one `return` statement per snippet file
  -- and return a table of Lua snippets.
  require("luasnip").snippet(
    { trig = "foo" },
    { t("Another snippet.") }
  ),

  require("luasnip").snippet(
    { trig = "fb" },
    { t("Fizzbuzz") }
  ),
}

