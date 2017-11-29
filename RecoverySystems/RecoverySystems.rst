RecoverySystems
---------------

This package is meant to cluster the models specialized in energy recovery. Heat exchanger and heat pump models are the most obvious examples.


Simple Heat Exchanger
^^^^^^^^^^^^^^^^^^^^^


Not So Simple Heat Exchanger
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The NotSoSimpleHeatExchanger Model has been inspired by a derivation from the `Wikipedia <https://en.wikipedia.org/wiki/Heat_exchanger>`_ page on heat exchangers, in the section "A model of a simple heat exchanger". This derivation is based on the Book "Fluid Mechanics and Transfer Processes", Cambridge University Press, Kay J.M. and Nedderman R.M.

The simplest heat exchanger consist of two straight pipes with fluid flows. Let the pipe be of length :math:`L`, with fluid capacities :math:`C_i`, flow rates :math:`j_i`, and temperature profiles along the pipes :math:`T_i(x)`. Assume the heat transfer occurs only transversely between the two fluids and not along the pipe. From Newton's law of cooling:

.. math::

  \label{eq:NewtonCooling}
	\frac{\partial u_1}{\partial t} & =  \gamma (T_2-T_1) \nonumber \\
	\frac{\partial u_2}{\partial t} & = \gamma (T_1-T_2)

where $u_i(x)$ is the thermal energy profile. It must be noted here that this is for parallel flows. Counterflows heat exchangers require a negative sign in the second equation. :math:`\gamma` is the thermal connection constant, a function of the heat exchange coefficient and the contact area. The time change in thermal energy for a fluid unit volume being carried along the pipe can be also written as

.. math::

  \label{eq:ThermalEnergyTimeRate}
  \frac{\partial u_1}{\partial t} & = C_1j_1 \frac{\partial T_1}{\partial x} \nonumber \\
  \frac{\partial u_2}{\partial t} & = C_2j_2 \frac{\partial T_2}{\partial x}

Here, :math:`C_i j_i` are the thermal flow rates. So, equating equations \ref{eq:NewtonCooling} and \ref{eq:ThermalEnergyTimeRate}, it results in a steady-state, x-only differential equation, that can be solved with

.. math::

  \label{eq:diffEq}
  T_1(x) & = A - \frac{Bk_1}{k} e^{-kx} \nonumber \\
  T_2(x) & = A + \frac{Bk_2}{k} e^{-kx}

where :math:`k_i = \gamma/(C_ij_i)`, :math:`k = k_1 + k_2` and :math:`A,B` being integration constants. Knowing the input temperatures at (x = 0) :math:`T_{10}` and :math:`T_{20}`, we can derive (for parallel flows)


.. math::

  \label{eq:temps}
  B & = (T_{20} - T_{10}) & = \Delta T \nonumber \\
  A & = T_{10} + \frac{\Delta T}{(1+j_1/j_2)} &  = T_{20} - \frac{\Delta T}{(1 + j_2/j_1)} \nonumber

.. math::

  T_{1L} & = &T_{10} + \frac{\Delta T}{(1 + j_1/j_2)} (1 - e^{\frac{\gamma}{j_1+j_2}L}) \nonumber \\
  T_{1L} & = &T_{20} - \frac{\Delta T}{(1 + j_2/j_1)} (1 - e^{\frac{\gamma}{j_1+j_2}L})

Letting :math:`\alpha = (1-e^{\frac{\gamma}{j_1+j_2}L})`, this term thus describes the efficiency of the heat-exchanger, depending on many parameters such as the heat exchange coefficients, exchange surface area and length of pipes. With :math:`\alpha = 0`, no heat is transferred between the pipes, while all the available heat is transferred when :math:`\alpha = 1`.
