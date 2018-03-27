EndUses
-------

The EndUses package clusters all appliances within an household that allow interaction with a water consumer. They are of special interest because they are associated with a consumer-generated flow of water that acts as a trigger for the rest of the system's building blocks.

BaseEndUses
^^^^^^^^^^^

+---------------+----------------------+--------------------------------------------------------+
| **Model Name**| BasicValve           | *Partial Model for the definition of end-uses*         |
+---------------+----------------------+--------------------------------------------------------+
| **Type**      | Partial Model        |                                                        |
+---------------+----------------------+--------------------------------------------------------+
| **Inlets**    | ``inletCold``        |  *cold water inlet*                                    |
+               +----------------------+--------------------------------------------------------+
|               | ``inletHot``         |  *hot water inlet*                                     |
+               +----------------------+--------------------------------------------------------+
|               | ``flowInput``        |  *data input from e.g. block HydrographFromFile*       |
+---------------+----------------------+--------------------------------------------------------+
| **Outlets**   | ``outlet``           | *water outlet*                                         |
+---------------+----------------------+--------------------------------------------------------+

Partial model acting as a basic valve: two water inlets mixing into one water outlet. The flow is triggered by the ``flowInput`` port.

Showers
^^^^^^^

Base Shower
***********
+---------------+----------------------+--------------------------------------------------------+
| **Model Name**| BaseShower           | *Partial Model for showers*                            |
+---------------+----------------------+--------------------------------------------------------+
| **Type**      | Partial Model        |                                                        |
+---------------+----------------------+--------------------------------------------------------+
| **Parameters**|``T_wanted``          | *Targeted Temperature*                                 |
+---------------+----------------------+--------------------------------------------------------+

Base model for showers. It simply makes sure :math:`T_{cold} \leq T_{wanted} \leq T_{hot}` using a trivial algorithm:

::

  algorithm
    if T_wanted < inletCold.T then
      T_achieved := inletCold.T;
    elseif T_wanted > inletHot.T then
      T_achieved := inletHot.T;
    else
      T_achieved := T_wanted;
    end if;


.. _classicshowerref:

Classic Shower
**************

+---------------+----------------------+--------------------------------------------------------+
| **Model Name**|ClassicShower         | *Lossless shower model*                                |
+---------------+----------------------+--------------------------------------------------------+
| **Type**      | Model                | *extends partial model* ``BaseShower``                 |
|               |                      | *and partial model* ``BasicValve``                     |
+---------------+----------------------+--------------------------------------------------------+
| **Inlets**    | ``inletCold``        |  *cold water inlet*                                    |
+               +----------------------+--------------------------------------------------------+
|               | ``inletHot``         |  *hot water inlet*                                     |
+               +----------------------+--------------------------------------------------------+
|               | ``flowInput``        |  *data input from e.g. block HydrographFromFile*       |
+---------------+----------------------+--------------------------------------------------------+
| **Outlets**   | ``outlet``           | *water outlet*                                         |
+---------------+----------------------+--------------------------------------------------------+
| **Parameters**|``T_wanted``          | *Targeted Temperature*                                 |
+---------------+----------------------+--------------------------------------------------------+

Simple model for showers. The flow is triggered through the ``flowInput`` port, connected to e.g. an ``HydrographFromFile`` block. Energy and mass balance equations describe the thermal behavior:

.. math::
  T_{out} m_{out} = T_{in}^{cold} m_{in}^{cold} + T_{in}^{hot} m_{in}^{hot}

.. math::
  m_{in}^{cold} + m_{in}^{hot} = m_{out}


Taps
^^^^
+---------------+----------------------+--------------------------------------------------------+
| **Model Name**|ClassicShower         | *Lossless tap model*                                   |
+---------------+----------------------+--------------------------------------------------------+
| **Type**      | Model                |  *extends partial model* ``BasicValve``                |
+---------------+----------------------+--------------------------------------------------------+
| **Inlets**    | ``inletCold``        |  *cold water inlet*                                    |
+               +----------------------+--------------------------------------------------------+
|               | ``inletHot``         |  *hot water inlet*                                     |
+               +----------------------+--------------------------------------------------------+
|               | ``flowInput``        |  *data input from e.g. block HydrographFromFile*       |
+---------------+----------------------+--------------------------------------------------------+
| **Outlets**   | ``outlet``           | *water outlet*                                         |
+---------------+----------------------+--------------------------------------------------------+
| **Parameters**|``T_wanted``          | *Targeted Temperature*                                 |
+---------------+----------------------+--------------------------------------------------------+

Analogous to :ref:`classicshowerref`.
