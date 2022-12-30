local ls = require("luasnip")

ls.snippets = {
	all = {
		-- Available in any filetype
		ls.parser.parse_snippet("sign", "Mit freundlichen Grüßen \n Van Hoa Nguyen"),
	},

	lua = {
		ls.parser.parse_snippet("lf", "local $1 = function($2)\n $0\nend"),
	},
}
