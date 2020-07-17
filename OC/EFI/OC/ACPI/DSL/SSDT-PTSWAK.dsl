// Overriding _PTS and _WAK
// In config ACPI, _PTS renamed ZPTS
// Find:     5F50545301
// Replace:  5A50545301
// or 
// Find:     5F50545309
// Replace:  5A50545309
//
// In config ACPI, _WAK renamed ZWAK
// Find:     5F57414B01
// Replace:  5A57414B01
//or
// Find:     5F57414B09
// Replace:  5A57414B09
//
// In config ACPI, XHCI renamed XHC
// Find:     58484349
// Replace:  5848435F
#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "PTSWAK", 0)
{
#endif
    External(ZPTS, MethodObj)
    External(ZWAK, MethodObj)
    External(DGPU._ON, MethodObj)
    External(DGPU._OFF, MethodObj)
    External(_SB.PCI0.XHC, DeviceObj)
    External(_SI._SST, MethodObj)
    External(S2EP.MPWS, IntObj)
    External(S2EP.MYLD, IntObj)
    
    Scope (_SB)
    {
        Name (QPTS,0)   // QPTS: Control "_PTS" code execution process.
                        // 0: Normal.
                        // 1: Don't execution "_PTS".
    
        Name (QWAK,0)   // QPTS: Control "_WAK" code execution process.
                        // 0: normal.
                        // 1: Don't execution "_WAK".    
    
        Name (PMEE,1)   // PMEE: Control "PMXX" code.
                        // 0: disable "PMXX".
                        // 1: enable "PMXX". 
    }
    
    Scope (_SB.PCI0.XHC)
    {
        OperationRegion (PMWX, PCI_Config, 0x00, 0x0100)
        Field (PMWX, AnyAcc, NoLock, Preserve)
        {
            Offset (0x75), 
            PMXX,   1, //PMEE
        }
    } 

    Method (_PTS, 1, NotSerialized) //Method (_PTS, 1, Serialized)
    {
      If (_OSI ("Darwin"))
      {
        If (CondRefOf (\S2EP.MPWS))
        {
            if(\S2EP.MPWS ==1)
            {
                Arg0 = 3
            }
        }

        If (CondRefOf (\DGPU._ON))
        {
            \DGPU._ON ()
        }
        
        If (\_SB.QPTS == 0)
        {
            ZPTS(Arg0)
        }
        
        If (5 == Arg0)
        {       
            If (\_SB.PMEE == 1)
            {
                \_SB.PCI0.XHC.PMXX = 0
            } 
        }
      }
      ZPTS(Arg0)  
    }
    
    Method (_WAK, 1, NotSerialized) //Method (_WAK, 1, Serialized)
    {  
      If (_OSI ("Darwin"))
      {
        If (CondRefOf (\S2EP.MPWS))
        {
            if(\S2EP.MPWS ==1)
            {
                \S2EP.MPWS =0
                Arg0 = 3
            }
        }
        
        If (CondRefOf (\S2EP.MYLD))
        {
            \S2EP.MYLD =1
        }
        
        If (Arg0 < 1 || Arg0 > 5 )
        {
            Arg0 = 3
        }       
        
        If (CondRefOf (\DGPU._OFF))
        {
            \DGPU._OFF ()
        }
        
        If (3 == Arg0)
        {
            If (CondRefOf(\_SI._SST)) { \_SI._SST (1) }
        }

        If (\_SB.QWAK == 0)
        {
            Local0 = ZWAK(Arg0)
        }
        Else
        {
            Local0 = Package () { 0x00, 0x00 }
        }
      }
      Local0 = ZWAK(Arg0)
      Return (Local0)
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF