#
# Copyright 2017 Pixar
#
# Licensed under the Apache License, Version 2.0 (the "Apache License")
# with the following modification; you may not use this file except in
# compliance with the Apache License and the following modification to it:
# Section 6. Trademarks. is deleted and replaced with:
#
# 6. Trademarks. This License does not grant permission to use the trade
#    names, trademarks, service marks, or product names of the Licensor
#    and its affiliates, except as required to comply with Section 4(c) of
#    the License and to reproduce the content of the NOTICE file.
#
# You may obtain a copy of the Apache License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the Apache License with the above modification is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied. See the Apache License for the specific
# language governing permissions and limitations under the Apache License.
#
# - Find Houdini Development Kit
#
# Finds an installed Houdini Development Kit
#
# Variables that will be defined:
# HOUDINI_FOUND            Defined if HDK installation has been detected
# HOUDINI_BASE_DIR         Path to the root of the Houdini installation 
# HOUDINI_INCLUDE_DIRS      Path to the HDK include directories
# HOUDINI_LIB_DIRS          Path to the HDK libraray directories
# HOUDINI_VERSION           Full Houdini version, 16.0.596 for example
# HOUDINI_MAJOR_VERSION
# HOUDINI_MINOR_VERSION     
# HOUDINI_BUILD_VERSION     

#
# In:
#  HOUDINI_ROOT
#
# Out:
#  HOUDINI_FOUND
#  HOUDINI_VERSION
#  HOUDINI_BUILD_VERSION
#  HOUDINI_INCLUDE_DIRS
#  HOUDINI_LIBRARY_DIRS
#  HOUDINI_LIBRARIES
#  HOUDINI_APPS1_LIBRARY
#  HOUDINI_APPS2_LIBRARY
#  HOUDINI_APPS3_LIBRARY
#  HOUDINI_DEVICE_LIBRARY
#  HOUDINI_GEO_LIBRARY
#  HOUDINI_OP1_LIBRARY
#  HOUDINI_OP2_LIBRARY
#  HOUDINI_OP3_LIBRARY
#  HOUDINI_OPZ_LIBRARY
#  HOUDINI_PRM_LIBRARY
#  HOUDINI_RAY_LIBRARY
#  HOUDINI_SIM_LIBRARY
#  HOUDINI_UI_LIBRARY
#  HOUDINI_UT_LIBRARY

find_path(HOUDINI_BASE_DIR
    NAMES
        houdini
    HINTS
        "${HOUDINI_ROOT}"
        "$ENV{HOUDINI_ROOT}"
    )

find_path(HOUDINI_INCLUDE_DIRS 
    UT/UT_Version.h
    HINTS
        "${HOUDINI_ROOT}"
        "$ENV{HOUDINI_ROOT}"        
        "${HOUDINI_BASE_DIR}"
    PATH_SUFFIXES
        toolkit/include/
    DOC
        "Houdini Development Kit Header Path"
)

if (WIN32)
	set (HOUDINI_LIB_PREFIX "lib")
	set (HOUDINI_LIB_EXT ".lib")
	set (HOUDINI_LIB_PATH_SUFFIX "custom/houdini/dsolib")
    set (HOUDINI_OP_LIBRARY_NAMES "OP")
else ()
	set (HOUDINI_LIB_PREFIX "houdini")
	set (HOUDINI_LIB_EXT ".so")
	set (HOUDINI_LIB_PATH_SUFFIX "dsolib/")
    set (HOUDINI_OP_LIBRARY_NAMES "")
endif()

find_path(HOUDINI_LIB_DIRS 
    ${HOUDINI_LIB_PREFIX}GEO${HOUDINI_LIB_EXT}
    HINTS
        "${HOUDINI_ROOT}"
        "$ENV{HOUDINI_ROOT}"        
        "${HOUDINI_BASE_DIR}"
    PATH_SUFFIXES
        ${HOUDINI_LIB_PATH_SUFFIX}
    DOC
        "Houdini Development Kit Library Path"
)

if (WIN32)
    set( _houdini_shared_libs custom/houdini/dsolib/libHOMUI.lib;custom/houdini/dsolib/libFUSE.lib;custom/houdini/dsolib/libMT.lib;custom/houdini/dsolib/libMDS.lib;custom/houdini/dsolib/libJEDI.lib;custom/houdini/dsolib/libOP3D.lib;custom/houdini/dsolib/libDM.lib;custom/houdini/dsolib/libVISF.lib;custom/houdini/dsolib/libGUI.lib;custom/houdini/dsolib/libGR.lib;custom/houdini/dsolib/libSHOP.lib;custom/houdini/dsolib/libVOP.lib;custom/houdini/dsolib/libVCC.lib;custom/houdini/dsolib/libPI.lib;custom/houdini/dsolib/libOP.lib;custom/houdini/dsolib/libPRM.lib;custom/houdini/dsolib/libCMD.lib;custom/houdini/dsolib/libCH.lib;custom/houdini/dsolib/libDEP.lib;custom/houdini/dsolib/libUT.lib;custom/houdini/dsolib/libVM.lib;custom/houdini/dsolib/libSYS.lib;custom/houdini/dsolib/libtools.lib;custom/houdini/dsolib/hboost_system-mt.lib;custom/houdini/dsolib/tbb.lib;custom/houdini/dsolib/tbbmalloc.lib;custom/houdini/dsolib/libEXPR.lib;custom/houdini/dsolib/libFS.lib;custom/houdini/dsolib/libcurlwrap.lib;custom/houdini/dsolib/libHOM.lib;custom/houdini/dsolib/libPY.lib;custom/houdini/dsolib/libPXL.lib;custom/houdini/dsolib/libCL.lib;custom/houdini/dsolib/libARR.lib;custom/houdini/dsolib/libLM.lib;custom/houdini/dsolib/libSTM.lib;custom/houdini/dsolib/libTAKE.lib;custom/houdini/dsolib/libIMG.lib;custom/houdini/dsolib/libTBF.lib;custom/houdini/dsolib/libDD.lib;custom/houdini/dsolib/libCVEX.lib;custom/houdini/dsolib/libPBR.lib;custom/houdini/dsolib/libVEX.lib;custom/houdini/dsolib/libTIL.lib;custom/houdini/dsolib/libhptex.lib;custom/houdini/dsolib/libIMG3D.lib;custom/houdini/dsolib/libGVEX.lib;custom/houdini/dsolib/libGT.lib;custom/houdini/dsolib/libGU.lib;custom/houdini/dsolib/libGSTY.lib;custom/houdini/dsolib/libSTY.lib;custom/houdini/dsolib/libGOP.lib;custom/houdini/dsolib/libGEO.lib;custom/houdini/dsolib/libGP.lib;custom/houdini/dsolib/libGD.lib;custom/houdini/dsolib/libGA.lib;custom/houdini/dsolib/libCE.lib;custom/houdini/dsolib/libTS.lib;custom/houdini/dsolib/libBV.lib;custom/houdini/dsolib/libGQ.lib;custom/houdini/dsolib/libUI.lib;custom/houdini/dsolib/libAU.lib;custom/houdini/dsolib/libRE.lib;custom/houdini/dsolib/libFONT.lib;custom/houdini/dsolib/libHARD.lib;custom/houdini/dsolib/libHAPIL.lib;custom/houdini/dsolib/libBM.lib;custom/houdini/dsolib/libFUI.lib;custom/houdini/dsolib/libSTORUI.lib;custom/houdini/dsolib/libIPR.lib;custom/houdini/dsolib/libOPUI.lib;custom/houdini/dsolib/libPSI2.lib;custom/houdini/dsolib/libSI.lib;custom/houdini/dsolib/libBR.lib;custom/houdini/dsolib/libSS.lib;custom/houdini/dsolib/libCHOP.lib;custom/houdini/dsolib/libOH.lib;custom/houdini/dsolib/libMOT.lib;custom/houdini/dsolib/libMGR.lib;custom/houdini/dsolib/libDOPZ.lib;custom/houdini/dsolib/libSIMZ.lib;custom/houdini/dsolib/libPOPNET.lib;custom/houdini/dsolib/libOBJ.lib;custom/houdini/dsolib/libSOP.lib;custom/houdini/dsolib/libSOPTG.lib;custom/houdini/dsolib/libDOP.lib;custom/houdini/dsolib/libWIRE.lib;custom/houdini/dsolib/libCLO.lib;custom/houdini/dsolib/libSIM.lib;custom/houdini/dsolib/libGAS.lib;custom/houdini/dsolib/libRBD.lib;custom/houdini/dsolib/libGDT.lib;custom/houdini/dsolib/libPOP.lib;custom/houdini/dsolib/libSOPZ.lib;custom/houdini/dsolib/libFBX.lib;custom/houdini/dsolib/libDAE.lib;custom/houdini/dsolib/libCOP2.lib;custom/houdini/dsolib/libRU.lib;custom/houdini/dsolib/libPOPZ.lib;custom/houdini/dsolib/libCOPZ.lib;custom/houdini/dsolib/libROP.lib;custom/houdini/dsolib/libSOHO.lib;custom/houdini/dsolib/libCHOPZ.lib;custom/houdini/dsolib/libKIN.lib;custom/houdini/dsolib/libCHOPNET.lib;custom/houdini/dsolib/libCOPNET.lib;custom/houdini/dsolib/libVOPNET.lib;custom/houdini/dsolib/libIMGUI.lib;custom/houdini/dsolib/libSHLFUI.lib;custom/houdini/dsolib/libSHLF.lib;custom/houdini/dsolib/libGABC.lib;custom/houdini/dsolib/libVIS.lib;custom/houdini/dsolib/libCV.lib;custom/houdini/dsolib/libSTOR.lib;custom/houdini/dsolib/libMH.lib;custom/houdini/dsolib/libMCS.lib;custom/houdini/dsolib/libMWS.lib;custom/houdini/dsolib/libMPI.lib;custom/houdini/dsolib/libMSS.lib;custom/houdini/dsolib/libIMS.lib;custom/houdini/dsolib/libIMP.lib;custom/houdini/dsolib/libIMH.lib;custom/houdini/dsolib/libIM.lib;custom/houdini/dsolib/libMATUI.lib;custom/houdini/dsolib/libJIVE.lib;custom/houdini/dsolib/libCHUI.lib;custom/houdini/dsolib/libTHOR.lib;custom/houdini/dsolib/libMIDI.lib;custom/houdini/dsolib/libDTUI.lib;custom/houdini/dsolib/libPYP.lib;custom/houdini/dsolib/libHOMF.lib;custom/houdini/dsolib/libRAY.lib;custom/houdini/dsolib/libVPRM.lib;custom/houdini/dsolib/libVGEO.lib )

    foreach(HOUDINI_LIB
            ${_houdini_shared_libs})

        find_library( HOUDINI_${HOUDINI_LIB}_LIBRARY
                        ${HOUDINI_LIB}
                    HINTS
                        "${HOUDINI_ROOT}"
                        "$ENV{HOUDINI_ROOT}"
                    NO_CMAKE_SYSTEM_PATH
                    )
        if (HOUDINI_${HOUDINI_LIB}_LIBRARY)
            list(APPEND HOUDINI_LIBRARIES ${HOUDINI_${HOUDINI_LIB}_LIBRARY})            
        else()
        endif ()
    endforeach()
else ()
    foreach(HOUDINI_LIB
        APPS1
        APPS2
        APPS3
        DEVICE
        GEO
        OP1 
        OP2 
        OP3 
        OPZ
        PRM
        RAY
        SIM
        UI
        UT)
        message (" FINDING ${HOUDINI_LIB_PREFIX}${HOUDINI_LIB}")
        find_library(HOUDINI_${HOUDINI_LIB}_LIBRARY
                ${HOUDINI_LIB_PREFIX}${HOUDINI_LIB}
            HINTS
                "${HOUDINI_LIB_DIRS}"
            DOC
                "Houdini's ${HOUDINI_LIB} library path"
            NO_CMAKE_SYSTEM_PATH
        )
        message (" FINDING ${HOUDINI_LIB} ${HOUDINI_${HOUDINI_LIB}_LIBRARY}")

        if (HOUDINI_${HOUDINI_LIB}_LIBRARY)
            list(APPEND HOUDINI_LIBRARIES ${HOUDINI_${HOUDINI_LIB}_LIBRARY})
        endif ()
    endforeach()
endif()

if(HOUDINI_INCLUDE_DIRS AND EXISTS "${HOUDINI_INCLUDE_DIRS}/SYS/SYS_Version.h")
    foreach(comp FULL MAJOR MINOR BUILD)
        file(STRINGS
            ${HOUDINI_INCLUDE_DIRS}/SYS/SYS_Version.h
            TMP
            REGEX "#define SYS_VERSION_${comp} .*$")
        string(REGEX MATCHALL "[0-9.]+" HOUDINI_${comp}_VERSION ${TMP})
    endforeach()
endif()

set(HOUDINI_VERSION ${HOUDINI_FULL_VERSION})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Houdini
    REQUIRED_VARS
        HOUDINI_BASE_DIR
        HOUDINI_INCLUDE_DIRS
        HOUDINI_LIB_DIRS
    VERSION_VAR
        HOUDINI_VERSION
)



