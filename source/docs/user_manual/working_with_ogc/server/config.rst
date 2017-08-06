.. index::
    pair: Environment; QGIS Server

.. _server_env_variables:

**********************
Advanced configuration
**********************

.. only:: html

   .. contents::
      :local:

.. index::
    pair: Logging; QGIS Server

.. _qgis-server-logging:

Logging
=======

To log requests sent to the server, set the following environment variables:

* **QGIS_SERVER_LOG_FILE**: Specify path and filename. Make sure that the
  server has proper permissions for writing to file. File should be created
  automatically, just send some requests to server. If it's not there, check
  permissions.
* **QGIS_SERVER_LOG_LEVEL**: Specify desired log level. Available values are:

  * 0 INFO (log all requests),
  * 1 WARNING,
  * 2 CRITICAL (log just critical errors, suitable for production purposes).

  Example:

  .. code-block:: apache

    SetEnv QGIS_SERVER_LOG_FILE /var/tmp/qgislog.txt
    SetEnv QGIS_SERVER_LOG_LEVEL 0

.. note::

    * When using Fcgid module use ``FcgidInitialEnv`` instead of ``SetEnv``!
    * Server logging is also enabled if executable is compiled in release mode.

Environment variables
=====================

You can configure some aspects of QGIS server by setting **environment
variables**. For example, to set QGIS server on Apache to use
/path/to/config/QGIS/QGIS2.ini settings file, add to Apache config:

.. code-block:: apache

  SetEnv QGIS_OPTIONS_PATH "/path/to/config/"

or, if using fcgi:

.. code-block:: apache

  FcgidInitialEnv QGIS_OPTIONS_PATH "/path/to/config/"


This is a list of the variables supported by QGIS server:

* **QGIS_OPTIONS_PATH**: Specifies the path to the directory with settings.
  It works the same way as QGIS application --optionspath option. It is looking
  for settings file in <QGIS_OPTIONS_PATH>/QGIS/QGIS2.ini.
* **QUERY_STRING**: The query string, normally passed by the web server. This
  variable can be useful while testing QGIS server binary from the command line.
* **QGIS_PROJECT_FILE**: the `.qgs` project file, normally passed as a parameter
  in the query string, you can also set it as an environment variable (for
  example by using `mod_rewrite` Apache module).
* **QGIS_SERVER_LOG_FILE**: Specify path and filename. Make sure that server
  has proper permissions for writing to file. File should be created
  automatically, just send some requests to server. If it's not there, check
  permissions.
* **QGIS_SERVER_LOG_LEVEL**: Specify desired log level. See :ref:`qgis-server-logging`
* **MAX_CACHE_LAYERS**: Specify the maximum number of cached layers (default:
  100).
* **DISPLAY**: This is used to pass (fake) X server display number (needed on
  Unix-like systems).
* **QGIS_PLUGINPATH**: Useful if you are using Python plugins for the server,
  this sets the folder that is searched for Python plugins.
* **DEFAULT_DATUM_TRANSFORM**: Define datum transformations between two projections,
  e.g. ``EPSG:21781/EPSG:2056/100001/-1;EPSG:2056/EPSG:21781/-1/100001`` sets the
  transformation between CH1903 LV03 (EPSG:21781) and CH1903 LV95 (EPSG:2056) and
  vice versa. You also need to place grid shift :file:`.gsb` files in the
  directory where proj4 stores the grid shift files, e.g. in :file:`/usr/share/proj`.
  You need to run ``crssync`` after you added new :file:`.gsb` files and look up
  the ID in the :file:`srs.db`. Look at attribute **coord_op_code** of table
  **tbl_datum_transform** in :file:`srs.db` to find the correct entry.

Short name for layers, groups and project
=========================================

A number of elements have both a ``<Name>`` and a ``<Title>``.
The **Name** is a text string used for machine-to-machine
communication while the **Title** is for the benefit of humans.

For example, a dataset might have the descriptive Title
“Maximum Atmospheric Temperature” and be requested using the abbreviated
Name “ATMAX”. User can already set title for layers, groups and project.

OWS name is based on the name used in layer tree. This name is more a label
for humans than a name for machine-to-machine communication.

QGIS Server supports:

* short name line edits to layers properties
  You can change this by right clicking on a layer, choose
  :menuselection:`Properties --> Metadata tab --> Description --> Short name`.

* WMS data dialog to layer tree group (short name, title, abstract)

  By right clicking on a layer group and selecting the :guilabel:`Set Group WMS data` option you will get:

  .. _figure_group_wms_data:

  .. figure:: /static/user_manual/working_with_ogc/set_group_wms_data.png
     :align: center

     Set group WMS data dialog

* short name line edits to project properties - add a regexp validator
  ``"^[A-Za-z][A-Za-z0-9\._-]*"`` to short name line edit accessible through a
  static method
* add a regexp validator ``"^[A-Za-z][A-Za-z0-9\._-]*"`` to short name line
  edit accessible through a static method

  You can choose a short name for the project root by going to :menuselection:`Project properties -->
  OWS Server --> Service capabilities --> Short name`.

* add a ``TreeName`` element in the ``fullProjectSettings``

If a short name has been set for layers, groups or project it is used by
QGIS Sever as the layer name.

Connection to service file
==========================

In order to make apache aware of the PostgreSQL service file (see the
:ref:`pg-service-file` section) you need to make
your :file:`*.conf` file look like:

.. code-block:: apache

   SetEnv PGSERVICEFILE /home/web/.pg_service.conf

   <Directory "/home/web/apps2/bin/">
     AllowOverride None
   .....


.. _add_fonts:

Add fonts to your linux server
==============================

Keep in mind that you may use QGIS projects that point to fonts that
may not exist by default on other machines. This means that if you share the project,
it may look different on other machines (if the fonts don't exist on the target machine).

In order to ensure this does not happen you just need to install the missing fonts on the target machine.
Doing this on desktop systems is usually trivial (double clicking the fonts).

For linux, if you don't have a desktop environment installed (or you prefer the command line) you need to:

* On Debian based systems:

  .. code-block:: bash

   $ sudo su
   $ mkdir -p /usr/local/share/fonts/truetype/myfonts && cd /usr/local/share/fonts/truetype/myfonts

   # copy the fonts from their location
   $ cp /fonts_location/* .

   $ chown root *
   $ cd .. && fc-cache -f -v

* On Fedora based systems:

  .. code-block:: bash

   $ sudo su
   $ mkdir /usr/share/fonts/myfonts && cd /usr/share/fonts/myfonts

   # copy the fonts from their location
   $ cp /fonts_location/* .

   $ chown root *
   $ cd .. && fc-cache -f -v

