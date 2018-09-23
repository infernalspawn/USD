@echo off
del CMakeCache.txt
set PATH=%PATH%;D:\Applications\sed\v4.2.1\bin
cmake -G "Visual Studio 14 2015 Win64" ^
-DCMAKE_INSTALL_PREFIX=D:\Applications\usd\dev-18.09.19\boost_1_61_0_x64 ^
-DBOOST_ROOT=D:\Applications\boost\v1.61.0\x64 ^
-DBOOST_LIBRARYDIR=D:\Applications\boost\v1.61.0\x64\lib ^
-DTBB_ROOT_DIR=D:\Applications\tbb\tbb44_20160803oss ^
-DTBB_LIBRARY=D:\Applications\tbb\tbb44_20160803oss\lib\intel64\vc14 ^
-DBoost_DEBUG=ON ^
-DPYTHON_LIBRARIES=c:\python27_64bit\libs ^
-DPYTHON_INCLUDE_DIRS=c:\python27_64bit\include ^
-DPYSIDE_BIN_DIR=c:\python27_64bit\scripts ^
-DOPENEXR_LOCATION="D:\Applications\OpenExr\v2.2.1-2\boost_1_61_0_x64" ^
-DOIIO_BASE_DIR=D:\Applications\oiio\v1.8.13\boost_1_61_0_x64 ^
-DGLEW_LOCATION=D:\Applications\glew\v2.1.0\x64 ^
-DOPENSUBDIV_ROOT_DIR=D:/Applications/OpenSubdiv/v3.2.0/x64 ^
-DOPENSUBDIV_USE_GPU=off ^
-DPXR_ENABLE_PTEX_SUPPORT=FALSE ^
-DOPENSUBDIV_USE_GPU=off ^
-DPXR_BUILD_USD_IMAGING=TRUE ^
-DPXR_BUILD_HOUDINI_PLUGIN=On ^
-DHOUDINI_ROOT="D:\Applications\Sesi\hfs16.5.496" ^
-DCMAKE_CONFIGURATION_TYPES:STRING=Release; ^
-DPXR_BUILD_ALEMBIC_PLUGIN:BOOL=ON ^
-DALEMBIC_DIR="D:\Applications\alembic\v1.7.8\boost_1_61_0_x64" ^
-DPXR_ENABLE_HDF5_SUPPORT=OFF ^
-L ^
..

REM -L ^
cmake --build . --config Release -j 12
REM cmake --build . --config RelWithDebInfo  -j 12
REM cmake --build . --config Debug -j 12
REM cmake --build . --target INSTALL -j 12

REM -DPTEX_INCLUDE_DIR=D:\Applications\ptex\v2.3.0\x64\include ^
REM -DPTEX_LIBRARY=D:\Applications\ptex\v2.3.0\x64\lib\Ptex.lib ^
