# SQL definition for domain's attributes change
# CAUTION: Do not modify this file unless you know what you are doing.
#          Code generation can be broken if incorrect changes are made.

#Changing default value
%if {default-value} %then
  [ALTER ] {sql-object} $sp {signature} 

  %if ({default-value} == "unset") %then
    [ DROP DEFAULT]
  %else
    [ SET DEFAULT ] {default-value}
  %end
  ; $br
  [-- ddl-end --] $br
%end

#Changing NOT NULL constraint
%if {not-null} %then
  [ALTER ] {sql-object} $sp {signature} 

  %if ({not-null} == "unset") %then
    [ DROP ]
  %else
    [ SET ]
  %end
  
  [NOT NULL;] $br
  [-- ddl-end --] $br
%end

#Changing CHECK expression
%if {constraints} %then
 {constraints}
%end
