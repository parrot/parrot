.namespace [ "_Tcl" ]

=head2 _Tcl::__list

Given a PMC, get a list from it. If the PMC is a TclLst,
this is as simple as returning the list. If it's a string,
use __stringToList.

=cut

.sub __list
  .param pmc value

  .local int return_type
  return_type = TCL_OK

  $S0 = typeof value
  if $S0 == "TclList" goto done

  $S0 = value
  (return_type, value) = __stringToList($S0)
  
done:
  .return(return_type, value)
.end

=head2 _Tcl::__number

Given a PMC, get a number from it.

=cut

.sub __number
  .param pmc value
  
  $I0 = typeof value
  if $I0 == .TclInt goto done
  if $I0 == .TclFloat goto done
  
  $S0 = value
  $I0 = length $S0
  (value, $I1) = get_number($S0, 0)
  if $I0 != $I1 goto NaN
  goto done

done:
  .return(TCL_OK, value)

NaN:
  $P0 = new Exception
  $P0["_message"] = "Not a number!"
  throw $P0
.end
