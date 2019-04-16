-- scaffold geniefile for fmt

fmt_script = path.getabsolute(path.getdirectory(_SCRIPT))
fmt_root = path.join(fmt_script, "fmt")

fmt_includedirs = {
	path.join(fmt_script, "config"),
	fmt_root,
}

fmt_libdirs = {}
fmt_links = {}
fmt_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { fmt_includedirs }
	end,

	_add_defines = function()
		defines { fmt_defines }
	end,

	_add_libdirs = function()
		libdirs { fmt_libdirs }
	end,

	_add_external_links = function()
		links { fmt_links }
	end,

	_add_self_links = function()
		links { "fmt" }
	end,

	_create_projects = function()

project "fmt"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		fmt_includedirs,
	}

	defines {}

	files {
		path.join(fmt_script, "config", "**.h"),
		path.join(fmt_root, "**.h"),
		path.join(fmt_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
