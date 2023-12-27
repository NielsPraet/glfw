project "GLFW"
kind "StaticLib"
language "C"
targetdir("bin/" .. outputdir .. "/%{prj.name}")
objdir("bin-int/" .. outputdir .. "/%{prj.name}")

files {
    "include/GLFW/glfw3.h", "include/GLFW/glfw3native.h", "src/glfw_config.h",
    "src/init.c", "src/context.c", "src/input.c", "src/monitor.c",

    "src/platform.c", "src/vulkan.c", "src/window.c"
}

filter "system:linux"
pic "On"

systemversion "latest"

files {
    "src/wl_init.c", "src/wl_monitor.c", "src/wl_platform.c", "src/wl_window.c",

    "src/xkb_unicode.c", "src/posix_module.c", "src/posix_time.c",
    "src/posix_thread.c", "src/posix_module.c", "src/glx_context.c",
    "src/egl_context.c", "src/osmesa_context.c", "src/linux_joystick.c"
}

defines {"_GLFW_WAYLAND"}

filter "system:windows"
buildoptions {"-std=c11", "-lgdi32"}
systemversion "latest"
staticruntime "On"

files {
    "src/win32_init.c", "src/win32_joystick.c", "src/win32_monitor.c",
    "src/win32_time.c", "src/win32_thread.c", "src/win32_window.c",
    "src/wgl_context.c", "src/egl_context.c", "src/osmesa_context.c"
}

defines {"_GLFW_WIN32", "_CRT_SECURE_NO_WARNINGS"}

filter "configurations:Debug"
runtime "Debug"
symbols "On"

filter "configurations:Release"
runtime "Release"
optimize "speed"

filter "configurations:Dist"
runtime "Release"
optimize "speed"
symbols "off"
