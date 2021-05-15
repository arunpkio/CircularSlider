# QML Circular Slider

### A highly customisable circular slider written in QML.
More details can be found here at my blog https://arunpkqt.wordpress.com/2021/05/08/qml-circular-slider/

# List of properties

- trackWidth
- progressWidth
- handleWidth
- handleHeight
- handleRadius
- handleVerticalOffset
- startAngle
- endAngle
- minValue
- maxValue
- value
- angle [readonly]
- capStyle
- trackColor
- progressColor
- handleColor
- stepSize
- snap
- handle [Component]
- pressed [readonly]
- hideTrack
- hideProgress


# Components

- The track and progress are created using Shape component with PathAngleArc.

- Default handle is rounded rectangle which is loaded using a Loader inside the handleItem.
By setting the property z to 2 we make sure that the handle is rendered always on top when
we use any child item inside the slider for progress indicator.

- A MouseArea is used which covers the whole component but only accepts mouse clicks along the
slider track with a given minimum width.

- A QtObject which is used to hide the internal details of the component from outside. This is
the object inside which we hide all the internal properties and functions which are used for
calculations.


# Screenshots

#### Basic Properties
![ScreenShot](https://github.com/arunpkqt/CircularSlider/blob/main/screens/basic_properties.png)

#### Custom Handles
![ScreenShot](https://github.com/arunpkqt/CircularSlider/blob/main/screens/custom_handles.png)

#### Custom Progress Indicator
![ScreenShot](https://github.com/arunpkqt/CircularSlider/blob/main/screens/custom_progress.png)


# Building Demo

#### Using QMake
    cd CircularSlider
    qmake && make

#### Using CMake
    cd CircularSlider
    cmake .
    cmake --build .
