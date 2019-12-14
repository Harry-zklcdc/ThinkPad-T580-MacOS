// In config ACPI, _Q13 renamed XQ13
// Find:     5F 51 31 33
// Replace:  58 51 31 33
//
// In config ACPI, _Q2B renamed XQ2B
// Find:     5F 51 32 42
// Replace:  58 51 32 42
//
#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "X-KEYLID", 0)
{
#endif
    External(_SB.PCI0.LPCB.EC, DeviceObj)
    External(LID, DeviceObj)
    External(SLPB, DeviceObj)
    External(S2EP.MPWS, IntObj)
    External(S2EP.MODE, IntObj)
    External(S2EP.MYLD, IntObj)
    External(_SB.PCI0.LPCB.EC.XQ2B, MethodObj)

    Scope (_SB.PCI0.LPCB.EC)
    {
        Method (_Q13, 0, NotSerialized)
        {
             If (\S2EP.MODE==0)
             {
                 If (\S2EP.MYLD!=0)
                 {
                     \S2EP.MYLD =0
                 }
                 Else
                 {
                     \S2EP.MYLD =1
                 }
                 Notify (LID, 0x80)
             }
             Else
             {
                 \S2EP.MPWS =1
                 Notify (SLPB, 0x80)
             }        
         }        
             
         Method (_Q2B, 0, NotSerialized)
         {
             If (\S2EP.MODE==0)
             {
                 \S2EP.MYLD =1
                 \_SB.PCI0.LPCB.EC.XQ2B()
             }
             Else
             {
                 \S2EP.MPWS =1
                 Notify (SLPB, 0x80)
             }
         }
    }      
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF