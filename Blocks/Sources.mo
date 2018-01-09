within WaterHub.Blocks;

package Sources
  extends Modelica.Icons.Package;

  block hydrographFromFile "Reproduced with modifications from the block Modelica.Blocks.Sources.CombiTimeTable. Table look-up with respect to time and linear/periodic extrapolation methods (data from matrix/file)"
    extends Modelica.Blocks.Interfaces.MO(final nout=max([size(columns, 1);
  							     size(offset, 1)]));
  
    final parameter Boolean tableOnFile=true
      "= true, if table is defined on file or in function usertab"
      annotation (Dialog(group="Table data definition"));
    final parameter Real table[:, :] = fill(0.0, 0, 2)
      "Table matrix (time = first column; e.g., table=[0, 0; 1, 1; 2, 4])"
      annotation (Dialog(group="Table data definition",enable=not tableOnFile));
    final parameter Boolean verboseRead=true
      "= true, if info message that file is loading is to be printed"
      annotation (Dialog(group="Table data definition",enable=tableOnFile));
          
    parameter String tableName="FlowTable"
      "Table name on file or in function usertab (see docu)"
      annotation (Dialog(group="Table definition"));
    parameter String fileName="FileName" "File where matrix is stored"
      annotation (Dialog(
        group="Table definition",
        loadSelector(filter="Text files (*.txt);;CSV files (*.csv)",
            caption="Open file in which table is present")));
    parameter Integer columns[:]={4}
      "Columns of table to be interpolated, column 4 is default"
      annotation (Dialog(group="Table data interpretation"));
    parameter Modelica.Blocks.Types.Smoothness smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments
      "Smoothness of table interpolation"
      annotation (Dialog(tab="More options",group="Table data interpretation"));
    parameter Modelica.Blocks.Types.Extrapolation extrapolation=Modelica.Blocks.Types.Extrapolation.LastTwoPoints
      "Extrapolation of data outside the definition range"
      annotation (Dialog(tab="More options",group="Table data interpretation"));
    parameter Real offset[:]={0} "Offsets of output signals"
      annotation (Dialog(tab="More options",group="Table data interpretation"));
    parameter Modelica.SIunits.Time startTime=0
      "Output = offset for time < startTime"
      annotation (Dialog(tab="More options",group="Table data interpretation"));
    parameter Modelica.SIunits.Time timeScale(
      min=Modelica.Constants.eps)=1 "Time scale of first table column"
      annotation (Dialog(tab="More options",group="Table data interpretation"), Evaluate=true);
    final parameter Modelica.SIunits.Time t_min(fixed=false)
      "Minimum abscissa value defined in table";
    final parameter Modelica.SIunits.Time t_max(fixed=false)
      "Maximum abscissa value defined in table";
    final parameter Real t_minScaled(fixed=false)
      "Minimum (scaled) abscissa value defined in table";
    final parameter Real t_maxScaled(fixed=false)
      "Maximum (scaled) abscissa value defined in table";
  protected
  
    
    final parameter Real p_offset[nout]=(if size(offset, 1) == 1 then ones(nout)*offset[1] else offset)
      "Offsets of output signals";
    Modelica.Blocks.Types.ExternalCombiTimeTable tableID=
        Modelica.Blocks.Types.ExternalCombiTimeTable(
          if tableOnFile then tableName else "NoName",
          if tableOnFile and fileName <> "NoName" and not Modelica.Utilities.Strings.isEmpty(fileName) then fileName else "NoName",
          table,
          startTime/timeScale,
          columns,
          smoothness,
          extrapolation) "External table object";
    discrete Modelica.SIunits.Time nextTimeEvent(start=0, fixed=true)
      "Next time event instant";
    discrete Real nextTimeEventScaled(start=0, fixed=true)
      "Next scaled time event instant";
    parameter Real tableOnFileRead(fixed=false)
      "= 1, if table was successfully read from file";
    constant Real DBL_MAX = 1.7976931348623158e+308;
    Real timeScaled "Scaled time";
  
    function readTableData "Read table data from ASCII text or MATLAB MAT-file"
      extends Modelica.Icons.Function;
      input Modelica.Blocks.Types.ExternalCombiTimeTable tableID;
      input Boolean forceRead = false
        "= true: Force reading of table data; = false: Only read, if not yet read.";
      output Real readSuccess "Table read success";
      input Boolean verboseRead
        "= true: Print info message; = false: No info message";
      external"C" readSuccess = ModelicaStandardTables_CombiTimeTable_read(tableID, forceRead, verboseRead)
        annotation (Library={"ModelicaStandardTables", "ModelicaMatIO", "zlib"});
      annotation(__ModelicaAssociation_Impure=true);
    end readTableData;
  
    function getTableValue
      "Interpolate 1-dim. table where first column is time"
      extends Modelica.Icons.Function;
      input Modelica.Blocks.Types.ExternalCombiTimeTable tableID;
      input Integer icol;
      input Real timeIn;
      discrete input Real nextTimeEvent;
      discrete input Real pre_nextTimeEvent;
      input Real tableAvailable
        "Dummy input to ensure correct sorting of function calls";
      output Real y;
      external"C" y = ModelicaStandardTables_CombiTimeTable_getValue(tableID, icol, timeIn, nextTimeEvent, pre_nextTimeEvent)
        annotation (Library={"ModelicaStandardTables", "ModelicaMatIO", "zlib"});
      annotation (derivative(
          noDerivative=nextTimeEvent,
          noDerivative=pre_nextTimeEvent,
          noDerivative=tableAvailable) = getDerTableValue);
    end getTableValue;
  
    function getTableValueNoDer
      "Interpolate 1-dim. table where first column is time (but do not provide a derivative function)"
      extends Modelica.Icons.Function;
      input Modelica.Blocks.Types.ExternalCombiTimeTable tableID;
      input Integer icol;
      input Real timeIn;
      discrete input Real nextTimeEvent;
      discrete input Real pre_nextTimeEvent;
      input Real tableAvailable
        "Dummy input to ensure correct sorting of function calls";
      output Real y;
      external"C" y = ModelicaStandardTables_CombiTimeTable_getValue(tableID, icol, timeIn, nextTimeEvent, pre_nextTimeEvent)
        annotation (Library={"ModelicaStandardTables", "ModelicaMatIO", "zlib"});
    end getTableValueNoDer;
  
    function getDerTableValue
      "Derivative of interpolated 1-dim. table where first column is time"
      extends Modelica.Icons.Function;
      input Modelica.Blocks.Types.ExternalCombiTimeTable tableID;
      input Integer icol;
      input Real timeIn;
      discrete input Real nextTimeEvent;
      discrete input Real pre_nextTimeEvent;
      input Real tableAvailable
        "Dummy input to ensure correct sorting of function calls";
      input Real der_timeIn;
      output Real der_y;
      external"C" der_y = ModelicaStandardTables_CombiTimeTable_getDerValue(tableID, icol, timeIn, nextTimeEvent, pre_nextTimeEvent, der_timeIn)
        annotation (Library={"ModelicaStandardTables", "ModelicaMatIO", "zlib"});
    end getDerTableValue;
  
    function getTableTimeTmin
      "Return minimum abscissa value of 1-dim. table where first column is time"
      extends Modelica.Icons.Function;
      input Modelica.Blocks.Types.ExternalCombiTimeTable tableID;
      input Real tableAvailable
        "Dummy input to ensure correct sorting of function calls";
      output Real timeMin "Minimum abscissa value in table";
      external"C" timeMin = ModelicaStandardTables_CombiTimeTable_minimumTime(tableID)
        annotation (Library={"ModelicaStandardTables", "ModelicaMatIO", "zlib"});
    end getTableTimeTmin;
  
    function getTableTimeTmax
      "Return maximum abscissa value of 1-dim. table where first column is time"
      extends Modelica.Icons.Function;
      input Modelica.Blocks.Types.ExternalCombiTimeTable tableID;
      input Real tableAvailable
        "Dummy input to ensure correct sorting of function calls";
      output Real timeMax "Maximum abscissa value in table";
      external"C" timeMax = ModelicaStandardTables_CombiTimeTable_maximumTime(tableID)
        annotation (Library={"ModelicaStandardTables", "ModelicaMatIO", "zlib"});
    end getTableTimeTmax;
  
    function getNextTimeEvent
      "Return next time event value of 1-dim. table where first column is time"
      extends Modelica.Icons.Function;
      input Modelica.Blocks.Types.ExternalCombiTimeTable tableID;
      input Real timeIn;
      input Real tableAvailable
        "Dummy input to ensure correct sorting of function calls" annotation(
        __OpenModelica_UnusedVariable = true);
      output Real nextTimeEvent "Next time event in table";
      external"C" nextTimeEvent = ModelicaStandardTables_CombiTimeTable_nextTimeEvent(tableID, timeIn)
        annotation (Library={"ModelicaStandardTables", "ModelicaMatIO", "zlib"});
    end getNextTimeEvent;
  
  initial algorithm
    if tableOnFile then
      tableOnFileRead := readTableData(tableID, false, verboseRead);
    else
      tableOnFileRead := 1.;
    end if;
    t_minScaled := getTableTimeTmin(tableID, tableOnFileRead);
    t_maxScaled := getTableTimeTmax(tableID, tableOnFileRead);
    t_min := t_minScaled*timeScale;
    t_max := t_maxScaled*timeScale;
  equation
    if tableOnFile then
      assert(tableName <> "NoName",
        "tableOnFile = true and no table name given");
    else
      assert(size(table, 1) > 0 and size(table, 2) > 0,
        "tableOnFile = false and parameter table is an empty matrix");
    end if;
    timeScaled = time/timeScale;
    when {time >= pre(nextTimeEvent),initial()} then
      nextTimeEventScaled = getNextTimeEvent(tableID, timeScaled, tableOnFileRead);
      if (nextTimeEventScaled < DBL_MAX) then
        nextTimeEvent = nextTimeEventScaled*timeScale;
      else
        nextTimeEvent = DBL_MAX;
      end if;
    end when;
    if smoothness == Modelica.Blocks.Types.Smoothness.ConstantSegments then
      for i in 1:nout loop
        y[i] = p_offset[i] + getTableValueNoDer(tableID, i, timeScaled, nextTimeEventScaled, pre(nextTimeEventScaled), tableOnFileRead);
      end for;
    else
      for i in 1:nout loop
        y[i] = p_offset[i] + getTableValue(tableID, i, timeScaled, nextTimeEventScaled, pre(nextTimeEventScaled), tableOnFileRead);
      end for;
    end if;
    annotation (
      Documentation(info="<html>
  <p>
  This block was modified from Modelica.Blocks.Sources.CombiTimeTable to fit the needs of the WaterHub model. When connecting this block to an end-use model, remember to connect it to y[1] (and not y[:], as the default). This is a bug that will be addressed in the future. The block accepts .txt and .csv files containing a table that has the following format
  </p>
  <pre>
  #1
  float FlowTable(86400, 4)
  0, 0.0, 0.0, 0.0
  1, 0.0, 0.0, 0.0
  2, 0.0, 0.0, 0.0
  ...
  </pre>
  <p>
  where the first column is the <strong>time</strong> (86400 rows for one day simulation at second resolution, which can be tuned as required), the second column the <strong>probability</strong> for an end-use event to happen, the third column the <strong>cumulative frequency</strong> and the fourth column the <strong>water flow</strong> generated by a random event. This kind of table is generated by a python script named <strong>HydroGen</strong>, for 'Hydrograph Generator'. See specific documentation for use.
  </p>
  
  <p>
  The following information is copied from the TimeCombiTable Block information:
  </p>
  <p>
  This block generates an output signal y[:] by <strong>constant</strong>,
  <strong>linear</strong> or <strong>cubic Hermite spline interpolation</strong>
  in a table. The time points and function values are stored in a matrix
  <strong>table[i,j]</strong>, where the first column table[:,1] contains the
  time points and the other columns contain the data to be interpolated.
  </p>
  
  <p>
  <img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/CombiTimeTable.png\"
     alt=\"CombiTimeTable.png\">
  </p>
  
  <p>
  Via parameter <strong>columns</strong> it can be defined which columns of the
  table are interpolated. If, e.g., columns={2,4}, it is assumed that
  2 output signals are present and that the first output is computed
  by interpolation of column 2 and the second output is computed
  by interpolation of column 4 of the table matrix.
  The table interpolation has the following properties:
  </p>
  <ul>
  <li>The time points need to be <strong>strictly increasing</strong> for cubic Hermite
    spline interpolation, otherwise <strong>monotonically increasing</strong>.</li>
  <li><strong>Discontinuities</strong> are allowed for (constant or) linear interpolation,
    by providing the same time point twice in the table.</li>
  <li>Values <strong>outside</strong> of the table range, are computed by
    extrapolation according to the setting of parameter
    <strong>extrapolation</strong>:
  <pre>
  extrapolation = 1: Hold the first or last value of the table,
                     if outside of the table scope.
                = 2: Extrapolate by using the derivative at the first/last table
                     points if outside of the table scope.
                     (If smoothness is LinearSegments or ConstantSegments
                     this means to extrapolate linearly through the first/last
                     two table points.).
                = 3: Periodically repeat the table data (periodical function).
                = 4: No extrapolation, i.e. extrapolation triggers an error
  </pre></li>
  <li>Via parameter <strong>smoothness</strong> it is defined how the data is interpolated:
  <pre>
  smoothness = 1: Linear interpolation
             = 2: Akima interpolation: Smooth interpolation by cubic Hermite
                  splines such that der(y) is continuous, also if extrapolated.
             = 3: Constant segments
             = 4: Fritsch-Butland interpolation: Smooth interpolation by cubic
                  Hermite splines such that y preserves the monotonicity and
                  der(y) is continuous, also if extrapolated.
             = 5: Steffen interpolation: Smooth interpolation by cubic Hermite
                  splines such that y preserves the monotonicity and der(y)
                  is continuous, also if extrapolated.
  </pre></li>
  <li>If the table has only <strong>one row</strong>, no interpolation is performed and
    the table values of this row are just returned.</li>
  <li>Via parameters <strong>startTime</strong> and <strong>offset</strong> the curve defined
    by the table can be shifted both in time and in the ordinate value.
    The time instants stored in the table are therefore <strong>relative</strong>
    to <strong>startTime</strong>.
    If time &lt; startTime, no interpolation is performed and the offset
    is used as ordinate value for all outputs.</li>
  <li>The table is implemented in a numerically sound way by <strong>always</strong>
    generating <strong>time events</strong> at interval boundaries, in case of
    interpolation by constant or linear segments.
    This generates continuously differentiable values for the integrator.
    (In package Modelica&nbsp;v3.2 and earlier, time events had always been generated
    at interval boundaries if smoothness was LinearSegments, which means the blocks
    <a href=\"modelica://Modelica.Blocks.Sources.TimeTable\">TimeTable</a> and
    CombiTimetable behaved identically. In contrast, in packages Modelica&nbsp;v3.2.1
    and&nbsp;v3.2.2 time events were only generated for replicated time points,
    which could lead to unexpected simulation results. This behaviour was later
    reverted again to match the previous behaviour of Modelica&nbsp;v3.2 and earlier.)
    </li>
  <li>Via parameter <strong>timeScale</strong> the first column of the table array can
    be scaled, e.g., if the table array is given in hours (instead of seconds)
    <strong>timeScale</strong> shall be set to 3600.</li>
  <li>For special applications it is sometimes needed to know the minimum
    and maximum time instant defined in the table as a parameter. For this
    reason parameters <strong>t_min</strong>/<strong>t_minScaled</strong> and
    <strong>t_max</strong>/<strong>t_maxScaled</strong> are provided and can be
    accessed from the outside of the table object. Whereas <strong>t_min</strong> and
    <strong>t_max</strong> define the scaled abscissa values (using parameter
    <strong>timeScale</strong>) in SIunits.Time, <strong>t_minScaled</strong> and
    <strong>t_maxScaled</strong> define the unitless original abscissa values of
    the table.</li>
  </ul>
  <p>
  Example:
  </p>
  <pre>
   table = [0, 0;
            1, 0;
            1, 1;
            2, 4;
            3, 9;
            4, 16];
   extrapolation = 2 (default)
  If, e.g., time = 1.0, the output y =  0.0 (before event), 1.0 (after event)
    e.g., time = 1.5, the output y =  2.5,
    e.g., time = 2.0, the output y =  4.0,
    e.g., time = 5.0, the output y = 23.0 (i.e., extrapolation via last 2 points).
  </pre>
  <p>
  The table matrix can be defined in the following ways:
  </p>
  <ol>
  <li>Explicitly supplied as <strong>parameter matrix</strong> \"table\",
    and the other parameters have the following values:
  <pre>
   tableName is \"NoName\" or has only blanks,
   fileName  is \"NoName\" or has only blanks.
  </pre></li>
  <li><strong>Read</strong> from a <strong>file</strong> \"fileName\" where the matrix is stored as
    \"tableName\". Both ASCII and MAT-file format is possible.
    (The ASCII format is described below).
    The MAT-file format comes in four different versions: v4, v6, v7 and v7.3.
    The library supports at least v4, v6 and v7 whereas v7.3 is optional.
    It is most convenient to generate the MAT-file from FreeMat or MATLAB&reg;
    by command
  <pre>
   save tables.mat tab1 tab2 tab3
  </pre>
    or Scilab by command
  <pre>
   savematfile tables.mat tab1 tab2 tab3
  </pre>
    when the three tables tab1, tab2, tab3 should be used from the model.<br>
    Note, a fileName can be defined as URI by using the helper function
    <a href=\"modelica://Modelica.Utilities.Files.loadResource\">loadResource</a>.</li>
  <li>Statically stored in function \"usertab\" in file \"usertab.c\".
    The matrix is identified by \"tableName\". Parameter
    fileName = \"NoName\" or has only blanks. Row-wise storage is always to be
    preferred as otherwise the table is reallocated and transposed.</li>
  </ol>
  <p>
  When the constant \"NO_FILE_SYSTEM\" is defined, all file I/O related parts of the
  source code are removed by the C-preprocessor, such that no access to files takes place.
  </p>
  <p>
  If tables are read from an ASCII-file, the file needs to have the
  following structure (\"-----\" is not part of the file content):
  </p>
  <pre>
  -----------------------------------------------------
  #1
  double tab1(6,2)   # comment line
  0   0
  1   0
  1   1
  2   4
  3   9
  4  16
  double tab2(6,2)   # another comment line
  0   0
  2   0
  2   2
  4   8
  6  18
  8  32
  -----------------------------------------------------
  </pre>
  <p>
  Note, that the first two characters in the file need to be
  \"#1\" (a line comment defining the version number of the file format).
  Afterwards, the corresponding matrix has to be declared
  with type (= \"double\" or \"float\"), name and actual dimensions.
  Finally, in successive rows of the file, the elements of the matrix
  have to be given. The elements have to be provided as a sequence of
  numbers in row-wise order (therefore a matrix row can span several
  lines in the file and need not start at the beginning of a line).
  Numbers have to be given according to C syntax (such as 2.3, -2, +2.e4).
  Number separators are spaces, tab (\\t), comma (,), or semicolon (;).
  Several matrices may be defined one after another. Line comments start
  with the hash symbol (#) and can appear everywhere.
  Other characters, like trailing non comments, are not allowed in the file.
  </p>
  <p>
  MATLAB is a registered trademark of The MathWorks, Inc.
  </p>
  </html>", revisions="<html>
  <p><strong>Release Notes:</strong></p>
  <ul>
  <li><em>April 09, 2013</em>
       by Thomas Beutlich:<br>
       Implemented as external object.</li>
  <li><em>March 31, 2001</em>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Used CombiTableTime as a basis and added the
       arguments <strong>extrapolation, columns, startTime</strong>.
       This allows periodic function definitions.</li>
  </ul>
  </html>"),
      Icon(
      coordinateSystem(preserveAspectRatio=true,
        extent={{-100.0,-100.0},{100.0,100.0}}),
        graphics={
      Polygon(lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{-80.0,90.0},{-88.0,68.0},{-72.0,68.0},{-80.0,90.0}}),
      Line(points={{-80.0,68.0},{-80.0,-80.0}},
        color={192,192,192}),
      Line(points={{-90.0,-70.0},{82.0,-70.0}},
        color={192,192,192}),
      Polygon(lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{90.0,-70.0},{68.0,-62.0},{68.0,-78.0},{90.0,-70.0}}),
      Rectangle(lineColor={255,255,255},
        fillColor={255,215,136},
        fillPattern=FillPattern.Solid,
        extent={{-48.0,-50.0},{2.0,70.0}}),
      Line(points={{-48.0,-50.0},{-48.0,70.0},{52.0,70.0},{52.0,-50.0},{-48.0,-50.0},{-48.0,-20.0},{52.0,-20.0},{52.0,10.0},{-48.0,10.0},{-48.0,40.0},{52.0,40.0},{52.0,70.0},{2.0,70.0},{2.0,-51.0}})}),
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={
          Polygon(
            points={{-80,90},{-88,68},{-72,68},{-80,90}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Line(points={{-80,68},{-80,-80}}, color={95,95,95}),
          Line(points={{-90,-70},{82,-70}}, color={95,95,95}),
          Polygon(
            points={{90,-70},{68,-62},{68,-78},{90,-70}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-20,90},{20,-30}},
            lineColor={255,255,255},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-20,-30},{-20,90},{80,90},{80,-30},{-20,-30},{-20,0},{
                80,0},{80,30},{-20,30},{-20,60},{80,60},{80,90},{20,90},{20,-30}}),
          Text(
            extent={{-71,-42},{-32,-54}},
            lineColor={0,0,0},
            textString="offset"),
          Polygon(
            points={{-31,-30},{-33,-40},{-28,-40},{-31,-30}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-31,-70},{-34,-60},{-29,-60},{-31,-70},{-31,-70}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Line(points={{-31,-31},{-31,-70}}, color={95,95,95}),
          Line(points={{-20,-30},{-20,-70}}, color={95,95,95}),
          Text(
            extent={{-42,-74},{6,-84}},
            lineColor={0,0,0},
            textString="startTime"),
          Line(points={{-20,-30},{-80,-30}}, color={95,95,95}),
          Text(
            extent={{-73,93},{-44,74}},
            lineColor={0,0,0},
            textString="y"),
          Text(
            extent={{66,-81},{92,-92}},
            lineColor={0,0,0},
            textString="time"),
          Text(
            extent={{-19,83},{20,68}},
            lineColor={0,0,0},
            textString="time"),
          Text(
            extent={{21,82},{50,68}},
            lineColor={0,0,0},
            textString="y[1]"),
          Line(points={{50,90},{50,-30}}),
          Line(points={{80,0},{100,0}}, color={0,0,255}),
          Text(
            extent={{34,-30},{71,-42}},
            textString="columns",
            lineColor={0,0,255}),
          Text(
            extent={{51,82},{80,68}},
            lineColor={0,0,0},
            textString="y[2]")}));
  end hydrographFromFile;





































end Sources;
