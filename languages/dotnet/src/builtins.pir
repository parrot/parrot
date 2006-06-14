# THIS IS A GENERATED FILE! DO NOT EDIT!

.HLL '_dotnet', ''

.sub internal_method_body
    .param pmc class
    .param pmc meth
    .local string class_name, method_name, body

    # Get class and method names.
    class_name = class.get_fullname()
    method_name = meth
if class_name == "System.Object" goto CLASS_System_Object
goto FAIL
CLASS_System_Object:
if method_name == "GetType" goto UNIMPLEMENTED
if method_name == "InternalGetHashCode" goto BODY_System_Object___InternalGetHashCode
if method_name == "MemberwiseClone" goto BODY_System_Object___MemberwiseClone
if method_name == "obj_address" goto BODY_System_Object___obj_address
goto FAIL
FAIL:
    $P0 = new .Exception
    $P0["_message"] = "No body supplied for built-in method"
    throw $P0
BODY_System_Object___InternalGetHashCode:
body = <<"___BUILTIN_CODE___"
    .param pmc obj
    $I0 = obj.__hash(42)
    .return($I0)


___BUILTIN_CODE___
goto END
BODY_System_Object___MemberwiseClone:
body = <<"___BUILTIN_CODE___"
    .local pmc cpy
    cpy = clone self
    .return(cpy)


___BUILTIN_CODE___
goto END
BODY_System_Object___obj_address:
body = <<"___BUILTIN_CODE___"
    $I0 = net_pmc_addr self
    .return($I0)
___BUILTIN_CODE___
goto END
    # Generic unimplemented internal method body (throws exception).
UNIMPLEMENTED:
    body = <<"PIR"
$P0 = new .Exception
$P0["_message"] = "System.NotImplementedException"
$P1 = new "System.NotImplementedException"
$P0["obj"] = $P1
throw $P0
PIR

    # Return.
END:
    .return(body)
.end
