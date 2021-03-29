# Catalog queries for event triggers
# CAUTION: Do not modify this file unless you know what you are doing.
#          Code generation can be broken if incorrect changes are made.

%if ({pgsql-ver} >=f "9.3") %then
  %if {list} %then
     [SELECT oid, evtname AS name FROM pg_event_trigger AS et ]

    %if {last-sys-oid} %then
     [ WHERE oid ] {oid-filter-op} $sp {last-sys-oid}
   %end

   %if {not-ext-object} %then
     %if {last-sys-oid} %then
       [ AND ]
     %else
       [ WHERE ]
     %end
       ( {not-ext-object} )
   %end
 %else
    %if {attribs} %then
      [SELECT oid, evtname AS name, evtevent AS event, evtowner AS owner, evtfoid AS function, evttags AS values, ]

	({comment}) [ AS comment ]

       [ FROM pg_event_trigger AS et ]

      %if {last-sys-oid} %then
       [ WHERE oid ] {oid-filter-op} $sp {last-sys-oid}
      %end

      %if {not-ext-object} %then
         %if {last-sys-oid} %then
           [ AND ]
         %else
           [ WHERE ]
         %end
        ( {not-ext-object} )
      %end

    %end
 %end
%end
