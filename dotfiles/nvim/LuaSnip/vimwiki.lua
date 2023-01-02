-- markdown
-- Note: Change filetype to vimwiki, when using Plugin vimwiki
local function get_visual(args, parent)
    if (#parent.snippet.env.SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
    else
        return sn(nil, i(1, ''))
    end
end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    -- Expand boldening 
    require("luasnip").snippet(
        {
            trig="**",
            dscr="expands boldening characters automatically",
            regTrig=false,
            priority=100,
            snippetType="autosnippet"
        },
        {
            t("**"),
            i(1),
            t("**"),
        }
    ),
    -- Fenced block of code
    s({trig="CC", snippetType="autosnippet"},
        fmta(
            [[
        ```<>
        <>
        ```
      ]],
            {
                i(1),
                d(2, get_visual),
            }
        ),
        {condition = line_begin}
    ),

    -- INLINE MATH
    require("luasnip").snippet(
        {
            trig="mk",
            dscr="expands mathmode",
            regTrig=false,
            priority=100,
            snippetType="autosnippet"
        },
        {
            t("$"),
            i(1),
            t("$"),
            i(0),
        }
    ),
     -- BOLDFACE TEXT
    s({trig="tbb", snippetType="autosnippet"},
      fmta(
        [[**<>**]],
        {
          d(1, get_visual),
        }
      )
    ),

    -- ITALIC TEXT
    s({trig="tii", snippetType="autosnippet"},
      fmta(
        [[*<>*]],
        {
          d(1, get_visual),
        }
      )
    ),

     -- LINK
    s({trig="LL", wordTrig=true, snippetType="autosnippet"},
      fmta(
        [[[<>](<>)]],
        {
          d(1, get_visual),
          i(2),
        }
      )
    ),
}
