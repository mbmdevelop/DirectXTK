 -- ----------------------------------------------------------------------------------------
-- MIT License
-- 
-- Copyright(c) 2021 Mario Borrajo Megoya
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files(the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions :
-- 
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
-- ---------------------------------------------------------------------------

project "DirectXTK"
  location (path.join(DEPS_DIR,"DirectXTK/vs"))
  kind "StaticLib"
  language "C"
  staticruntime "On"
  systemversion "10.0.17763.0"

  targetdir (path.join(ROOT_DIR,"bin",OUTPUT_DIR,"%{prj.name}"))
  objdir (path.join(ROOT_DIR,"bin/intermediates",OUTPUT_DIR,"%{prj.name}")) 

  includedirs
  {
    (path.join(DEPS_DIR,"DirectXTK/include")),
    (path.join(DEPS_DIR,"DirectXTK/src")),
    (path.join(DEPS_DIR,"DirectXTK/src/Shaders/Compiled")),
  }
  files
  {
  	"include/**",
  	"src/*.h",
  	"src/*.cpp",
    "Audio/**",
  }

  defines 
  { 
  	"UNICODE"
  }
    
  filter "configurations:Debug"
  	runtime "Debug"
  	symbols "on"
  
  filter "configurations:Release"
  	runtime "Release"
  	optimize "on"