cmake_minimum_required(VERSION 3.16)

project(CircularSlider LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 COMPONENTS Core Quick REQUIRED)

set(PROJECT_SOURCES
    main.cpp
    qml.qrc
)

qt_add_executable(CircularSlider
    ${PROJECT_SOURCES}
)

#target_compile_definitions(CircularSlider
#    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(CircularSlider
    PRIVATE Qt6::Core
            Qt6::Quick)
