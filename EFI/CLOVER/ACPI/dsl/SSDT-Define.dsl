//
#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "SLEEP-X", 0)
{
#endif
    Device(S2EP)
    {
        Name(_ADR, 0)
        Name(MYLD, 1)
        Name(MPWS, 0)
        Name(MODE, 0)         //0:PNP0C0D,1:PNP0C0E
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            MYLD = 1
            MPWS = 0
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif enable
//EOF