Pipes & Carriers
----------------

Models of water pipes, electric wires and other carrier systems.


Water Pipes
^^^^^^^^^^^

PipeLossesAtRest
****************

+---------------+----------------------+--------------------------------------------------------+
| **Model Name**|PipeLossesAtRest      | *Loses energy to environment*                          |
|               |                      | *when water flow is zero*                              |
+---------------+----------------------+--------------------------------------------------------+
| **Type**      | Model                |                                                        |
+---------------+----------------------+--------------------------------------------------------+
| **Inlets**    | ``inlet``            |  *water inlet*                                         |
+---------------+----------------------+--------------------------------------------------------+
| **Outlets**   | ``outlet``           | *water outlet*                                         |
+               +----------------------+--------------------------------------------------------+
|               | ``heatOutlet``       | *heat flow outlet*                                     |
+---------------+----------------------+--------------------------------------------------------+
| **Parameters**|  ``triggerValue``    | *Triggers modeling of heat losses when flow get below* |
+               +----------------------+--------------------------------------------------------+
|               | ``pipeLength``       | *Length of water pipe in meters*                       |
+               +----------------------+--------------------------------------------------------+
|               |``pipeDiameterInside``| *Inside diameter of pipe in meters*                    |
+               +----------------------+--------------------------------------------------------+
|               |``pipeThickness``     | *Thickness of pipe walls in meters*                    |
+               +----------------------+--------------------------------------------------------+
|               |``material``          | *Roll menu to choose material thermal properties*      |
+               +----------------------+--------------------------------------------------------+
|               |``tEnvironment``      | *Temperature of external air in Kelvin*                |
+---------------+----------------------+--------------------------------------------------------+

Model of a water pipe that loses energy to its environment when the flow is zero (i.e when water is stagnating in the pipe). The model computes the `UA`-value, i.e. the total thermal conductance of the pipe, using:

.. math::
  \frac{1}{UA} = \frac{1}{h_{ci}A_i} + \sum\frac{s_n}{k_nA_n} + \frac{1}{h_{co}A_o}

where :math:`h_{ci}` and :math:`h_{co}` are the convection heat transfer coefficients of the inside, respectively outside fluid. :math:`A_i` and :math:`A_o` are the inside, respectively outside contact areas. :math:`s_n` is the thickness, :math:`k_n` the thermal conductivity and :math:`A_n` the mean area of pipe layer `n`.

`UA` is then used in the ODE:

.. math::
  V C_{v} \frac{dT}{dt} = -UA(T-T_{env})

to compute the time-dependent fluid temperature.
