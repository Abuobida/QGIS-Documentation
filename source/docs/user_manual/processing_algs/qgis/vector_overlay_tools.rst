.. only:: html

   |updatedisclaimer|

Vector overlay
==============

.. only:: html

   .. contents::
      :local:
      :depth: 1

Clip
----

Description
...........

This algorithm clips a vector layer using the polygons of an additional
polygon layer. Only the parts of the features in the input layer that falls
within the polygons of the clipping layer will be added to the resulting layer.

The attributes of the features are not modified, although properties such as
area or length of the features will be modified by the clipping operation. If
such properties are stored as attributes, those attributes will have to be
manually updated.

This algorithm uses spatial indexes on the providers, prepared geometries and
apply an intersection operation if the geometry isn't wholly contained by the
mask geometry.

Parameters
..........

``Input layer`` [vector: any]
  The layer containing the features to be clipped.

``Clip layer`` [vector: any]
  The layer containing the features that are used to clip the features in the input 
  layer.

``Open output file after running algorithm``
  Choose whether to load the clipped layer to the map canvas once the clip operation 
  has been completed.

Outputs
.......

``Clipped`` [vector]
  Where to save the clipped layer. Can be saved to file, a temporary file or a memory 
  layer.

Console usage
.............

::

  processing.runalg('qgis:clip', input, overlay, output)

See also
........

Difference
----------


Description
...........
This algorithm extracts features from the Input layer that don't fall within the 
boundaries of the Difference layer. Input Layer Features that are partially within
Difference layer feature(s) are split along the boundary of the clip layer 
feature(s). If any features are selected in the Input and Difference Layers, then 
only those features are used in the operation. If no features are selected, then 
the operation is performed using all features. 


Parameters
..........

``Input layer`` [vector: any]
  The layer containing the features that will be reduced. 

``Difference layer`` [vector: any]
  The layer containing the features used to reduce the Input Layer.

Outputs
.......

``Difference`` [vector]
  Where to save the difference layer. Can be saved to file, a temporary file 
  or a memory layer.

Console usage
.............

::

  processing.runalg('qgis:difference', input, overlay, output)

See also
........

Intersection
------------

Description
...........

This algorithm combines features from the Input layer and the Intersect Layer, 
resulting in features that cover both layers' features. Input Feature(s) that
only partially lie within the other layer's feature(s) are split along the 
boundary of the other layer's feature(s). 
If any features are selected in the Input and Intersect Layers, then only 
those features are used in the operation. If no features are selected then the 
operation is performed using all features. 

Parameters
..........

``Input layer`` [vector: any]
  One layer containing feature(s) to be combined.

``Intersect layer`` [vector: any]
  Second layer containing the feature(s) to be combined.

Outputs
.......

``Intersection`` [vector]
  Where to save the intersection layer. Can be saved to file, a temporary file 
  or a memory layer.

Console usage
.............

::

  processing.runalg('qgis:intersection', input, input2, output)

See also
........

Line intersections
------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: line]
  <put parameter description here>

``Intersect layer`` [vector: line]
  <put parameter description here>

``Input unique ID field`` [tablefield: any]
  <put parameter description here>

``Intersect unique ID field`` [tablefield: any]
  <put parameter description here>

Outputs
.......

``Output layer`` [vector]
  Where to save the line intersection layer. Can be saved to file, a temporary 
  file or a memory layer.

Console usage
.............

::

  processing.runalg('qgis:lineintersections', input_a, input_b, field_a, field_b, output)

See also
........

Split lines with lines
----------------------

Description
...........

This algorithm splits the lines in a line layer using the lines in another line layer to define the breaking points.
Intersection between geometries in both layers are considered as split points.

Parameters
..........

``Input layer`` [vector: line]
  Line layer containing the lines to be split.

``Split layer`` [vector: line]
  Line layer whose lines are used to define the breaking points.

Outputs
.......

``Splitted`` [vector]
  Output layer with split lines from input layer.

Console usage
.............

::

  processing.runalg('qgis:splitlineswithlines', input_layer, split_layer, splitted)

See also
........

Symmetrical difference
-----------------------

Description
...........
This algorithm creates a layer that includes all feature(s) that are in only 
one of the two input layers. Feature(s) that only partially lie within the 
other layer's feature(s) are split along the boundary of the other layer's 
feature(s). If any features are selected in the Input and Difference Layers, 
then only those features are used in the operation. If no features are selected 
then the operation is performed using all features. 

Parameters
..........

``Input layer`` [vector: any]
  One layer containing feature(s) to be compared.

``Difference layer`` [vector: any]
  Second layer containing feature(s) to be compared.

Outputs
.......

``Symmetrical difference`` [vector]
  Where to save the symmetrical difference layer. Can be saved to file, 
  a temporary file or a memory layer.

Console usage
.............

::

  processing.runalg('qgis:symetricaldifference', input, overlay, output)

See also
........

Union
-----

Description
...........
This algorithm combines the feature(s) of both layers. Features that lie 
partially within the other layer's features will be split. Areas that lie 
within both layers will be added as new features. If any features are 
selected in either of the layers, then only those features are used in the 
operation. If no features are selected then the operation is performed using 
all features. 

Parameters
..........

``Input layer`` [vector: any]
  One layer containing feature(s) to be unioned.

``Input layer 2`` [vector: any]
  Second layer containing feature(s) to be unioned.

Outputs
.......

``Union`` [vector]
  Where to save the union layer. Can be saved to file, a temporary file or a 
  memory layer.

Console usage
.............

::

  processing.runalg('qgis:union', input, input2, output)

See also
........

