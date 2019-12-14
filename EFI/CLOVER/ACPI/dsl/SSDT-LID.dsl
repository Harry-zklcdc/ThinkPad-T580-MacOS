// Overriding _LID
// In config ACPI, LID0 renamed LID
// Find:     4C 49 44 30
// Replace:  4C 49 44 5F
//
// In config ACPI, _LID renamed XLID
// Find:     5F4C4944 00
// Replace:  584C4944 00
//
#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "XLID", 0)
{
#endif
    //note:_LID 's path
    //path:_SB.LID._LID
    External(_SB.LID, DeviceObj)
    External(_SB.LID.XLID, MethodObj)
    External(S2EP.MYLD, IntObj)
    Scope (_SB.LID)
    {
        Method (_LID, 0, NotSerialized)
        {
            if(\S2EP.MYLD==0)
             {
                 Return (0)
             }
             Else
             {
                 Return (\_SB.LID.XLID())
             }
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif enable
//EOF