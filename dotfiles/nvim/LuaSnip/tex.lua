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
}

