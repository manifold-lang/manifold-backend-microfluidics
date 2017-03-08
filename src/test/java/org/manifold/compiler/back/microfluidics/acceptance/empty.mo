model Main
	import Modelica.Constants.inf;
	import Pi=Modelica.Constants.pi;
	import Modelica.Constants.pi;
	import Maplesoft.Constants.I;

equation
annotation(
Diagram(coordinateSystem(preserveAspectRatio=true, extent={{0,0},{500.0,500.0}}),graphics),
Icon(coordinateSystem(preserveAspectRatio=true, extent={{0,0},{200.0,200.0}}),graphics={Rectangle(extent={{0,0},{200.0,200.0}}, lineColor={0,0,0}),Rectangle(extent={{0.0,0.0},{200.0,200.0}})}),
uses(Modelica(version="3.2.1")),
experiment( StartTime = 0,
StopTime = 10.0,
__Maplesoft_solver = "ck45",
__Maplesoft_adaptive = true,
__Maplesoft_engine = 2,
Tolerance = 0.10e-4,
__Maplesoft_tolerance_abs = 0.10e-4,
__Maplesoft_step_size = 0.10e-2,
__Maplesoft_plot_points = 200,
__Maplesoft_numeric_jacobian = false,
__Maplesoft_constraint_iterations = 50,
__Maplesoft_event_iterations = 100,
__Maplesoft_algebraic_error_control = false,
__Maplesoft_algebraic_error_relaxation_factor = 1.0,
__Maplesoft_rate_hysteresis = 0.10e-9,
__Maplesoft_scale_method = "none",
__Maplesoft_reduce_events = false,
__Maplesoft_integration_diagnostics = false,
__Maplesoft_plot_event_points = true,
__Maplesoft_compiler = true,
__Maplesoft_compiler_optimize = true
));
end Main;
