within WaterHub;
package Constants
  "Library of mathematical constants and constants of nature"
  extends Modelica.Icons.UtilitiesPackage;
  import SI = WaterHub.SIUnits;
  
  // Mathematical constants
  final constant Real pi=3.14159265358979;
  
  // Constants of nature
  // (name, value, description from http://physics.nist.gov/cuu/Constants/index.html, data from 2014)
  final constant SI.Velocity c=299792458 "Speed of light in vacuum";
  final constant SI.Acceleration g_n=9.80665
    "Standard acceleration of gravity on earth";
  final constant Real G(final unit="m3/(kg.s2)") = 6.67408e-11
    "Newtonian constant of gravitation (previous value: 6.6742e-11)";
  final constant Real R(final unit="J/(mol.K)") = 8.3144598
    "Molar gas constant (previous value: 8.314472)";
  final constant Real sigma(final unit="W/(m2.K4)") = 5.670367e-8
    "Stefan-Boltzmann constant (previous value: 5.670400e-8)";
  final constant Real N_A(final unit="1/mol") = 6.022140857e23
    "Avogadro constant (previous value: 6.0221415e23)";
  final constant Real mue_0(final unit="N/A2") = 4*pi*1.e-7 "Magnetic constant";
  final constant Real epsilon_0(final unit="F/m") = 1/(mue_0*c*c) "Electric constant";
  final constant Real VolSpecificHeatCapWater(final unit="J/L*K") = 4179.6 "Volumetric Specific Heat of Water";

end Constants;