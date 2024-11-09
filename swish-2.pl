variable_definition(road_condition, ['dry', 'wet', 'snowy']).
variable_definition(wheel, [true, false]).
variable_definition(dynamo, [true, false]).
variable_definition(voltage, [true, false]).
variable_definition(bulb, [true, false]).
variable_definition(cable, [true, false]).
variable_definition(light, [true, false]).

0.6::road_condition('dry').
0.3::road_condition('wet').
0.1::road_condition('snowy').
0.2::wheel(true).
0.8::wheel(false).
0.95::bulb(true).
0.05::bulb(false).
0.98::cable(true).
0.02::cable(false).

0.1::dynamo(true) :- road_condition('dry'), wheel(true).
0.05::dynamo(true) :- road_condition('dry'), wheel(false).
0.3::dynamo(true) :- road_condition('wet'), wheel(true).
0.1::dynamo(true) :- road_condition('wet'), wheel(false).
0.5::dynamo(true) :- road_condition('snowy'), wheel(true).
0.2::dynamo(true) :- road_condition('snowy'), wheel(false).

0.9::voltage(true) :- dynamo(true).
0.2::voltage(true) :- dynamo(false).

0.99::light(true) :- voltage(true), bulb(true), cable(true).
0.01::light(true) :- voltage(true), bulb(true), cable(false).
0.01::light(true) :- voltage(true), bulb(false), cable(true).
0.001::light(true) :- voltage(true), bulb(false), cable(false).
0.3::light(true) :- voltage(false), bulb(true), cable(true).
0.005::light(true) :- voltage(false), bulb(true), cable(false).
0.005::light(true) :- voltage(false), bulb(false), cable(true).
0.0::light(true) :- voltage(false), bulb(false), cable(false).

query(voltage).
evidence(road_condition('snowy')).
