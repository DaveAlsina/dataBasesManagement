# Template code for data dictionary generation
# CAUTION: Do not modify this file unless you know what you are doing.
#          Code generation can be broken if incorrect changes are made. 

<html> $br
<head> $br
[	<meta charset="utf-8"> 
	<title>Data dictionary generated by pgModeler</title>] $br

%if {splitted} %then
	 [	<link rel="stylesheet" type="text/css" href="styles.css">] $br
%else
	[	<style>] $br
		{styles} $br 
	[	</style>] $br
%end

</head> $br
<body> $br

%if %not {splitted} %and {index} %then
{index}
%end

{objects}

[<footer>
Generated by <a href="https://pgmodeler.io"> PostgreSQL Database Modeler - pgModeler</a><br/>
Copyright © 2006 - 2019 Raphael A. Silva 
</footer> ]
</body> $br
</html> $br
