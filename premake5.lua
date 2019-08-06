project "entityx"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
	staticruntime "On"
    
	targetdir ("bin/" .. outputDir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputDir .. "/%{prj.name}")

	--Create config.h
	file = io.open("entityx/config.h", "w")
	file:write("#pragma once\n#include <cstdint>\n#include <cstddef>\nnamespace entityx { static const size_t MAX_COMPONENTS = 16; typedef float TimeDelta; }")
	file:close()

	files {
		'entityx/config.h',
		'entityx/entityx.h',
		'entityx/Entity.h',
		'entityx/Event.h',
		'entityx/System.h',
		'entityx/help/Pool.h',
		'entityx/help/Timer.h',
		'entityx/Entity.cc',
		'entityx/Event.cc',
		'entityx/System.cc',
		'entityx/help/Pool.cc',
		'entityx/help/Timer.cc',
	}
	
	includedirs { '.' }
    
	filter "system:windows"
        systemversion "latest"
		defines { '_CRT_SECURE_NO_WARNINGS' }
	
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		defines { 'DEBUG' }
	
	filter "configurations:Release"
		runtime "Release"
		optimize "on"
		defines { 'NDEBUG' }
	
	filter "configurations:Distribute"
		runtime "Release"
		optimize "on"
		defines { 'NDEBUG' }
