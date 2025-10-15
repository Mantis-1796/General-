"uvm_config_db" is a configuration database which is one of the most important utilities in UVM. 
It is used to store and retrieve configuration information(like parameters, handles or objects)
The configuration database in UVM is designed to work top-down, not bottom-up. set at top levels of hierarchy and retrieve at bottom levels. viceversa is not possible.

class uvm_config_db #(type T = uvm_object);
It’s a parameterized class — meaning it can hold any type (int, bit, string, uvm_object, etc.).

